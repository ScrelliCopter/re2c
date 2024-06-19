-- Generated by re2c
{-# LANGUAGE RecordWildCards #-}
-- re2hs $INPUT -o $OUTPUT -fi
{-# OPTIONS_GHC -Wno-unused-record-wildcards #-}
{-# LANGUAGE OverloadedStrings #-}

import Control.Concurrent.Chan
import Control.Monad
import Data.ByteString as BS
import Text.Printf

debug :: IO () -> IO ()
debug = when False

data State = State {
    _pipe :: !(Chan BS.ByteString),
    _str :: !BS.ByteString,
    _cur :: !Int,
    _mar :: !Int,
    _lim :: !Int,
    _tok :: !Int,
    _eof :: !Bool,
    _yystate :: !Int,
    _recv :: !Int
}

data Status = End | Ready | Waiting | BadPacket deriving (Eq)


yy0 :: State -> IO (State, Status)
yy0 !State{..} = do
    yych <- return $ BS.index _str _cur
    case yych of
        _c | 0x61 <= _c && _c <= 0x7A -> do
            _cur <- return $ _cur + 1
            yy3 State{..}
        _c | True -> do
            if _cur >= _lim then do
                let _yystate = 0
                return (State{..}, Waiting)
            else do
                _cur <- return $ _cur + 1
                yy1 State{..}

yy1 :: State -> IO (State, Status)
yy1 !State{..} = do
    yy2 State{..}

yy2 :: State -> IO (State, Status)
yy2 !State{..} = do
    let _yystate = -1
    return (State{..}, BadPacket)

yy3 :: State -> IO (State, Status)
yy3 !State{..} = do
    let _mar = _cur
    yych <- return $ BS.index _str _cur
    case yych of
        _c | 0x3B == _c -> do
            _cur <- return $ _cur + 1
            yy4 State{..}
        _c | 0x61 <= _c && _c <= 0x7A -> do
            _cur <- return $ _cur + 1
            yy5 State{..}
        _c | True -> do
            if _cur >= _lim then do
                let _yystate = 1
                return (State{..}, Waiting)
            else do
                yy2 State{..}

yy4 :: State -> IO (State, Status)
yy4 !State{..} = do
    let _yystate = -1
    lexer State{_tok = _cur, _recv = _recv + 1, ..}

yy5 :: State -> IO (State, Status)
yy5 !State{..} = do
    yych <- return $ BS.index _str _cur
    case yych of
        _c | 0x3B == _c -> do
            _cur <- return $ _cur + 1
            yy4 State{..}
        _c | 0x61 <= _c && _c <= 0x7A -> do
            _cur <- return $ _cur + 1
            yy5 State{..}
        _c | True -> do
            if _cur >= _lim then do
                let _yystate = 2
                return (State{..}, Waiting)
            else do
                yy6 State{..}

yy6 :: State -> IO (State, Status)
yy6 !State{..} = do
    let _cur = _mar
    yy2 State{..}

yy7 :: State -> IO (State, Status)
yy7 !State{..} = do
    let _yystate = -1
    return (State{..}, End)

lexer :: State -> IO (State, Status)
lexer !State{..} = do
    case _yystate of
        _c | -1 == _c -> do
            yy0 State{..}
        _c | 0 == _c -> do
            if _cur >= _lim then yy7 State{..}
            else yy0 State{..}
        _c | 1 == _c -> do
            if _cur >= _lim then yy2 State{..}
            else yy3 State{..}
        _c | 2 == _c -> do
            if _cur >= _lim then yy6 State{..}
            else yy5 State{..}
        _c | True -> do
            error "internal lexer error"



fill :: State -> IO (State, Status)
fill st@State{..} = do
    case _eof of
        True -> return (st, End)
        False -> do
            -- Discard everything up to the current token, cut off terminating null,
            -- read new chunk from file and reappend terminating null at the end.
            chunk <- readChan _pipe
            return (State {
                _str = BS.concat [(BS.init . BS.drop _tok) _str, chunk, "\0"],
                _cur = _cur - _tok,
                _mar = _mar - _tok,
                _lim = _lim - _tok + BS.length chunk, -- exclude terminating null
                _tok = 0,
                _eof = BS.null chunk, -- end of file?
                ..}, Ready)

loop :: State -> [BS.ByteString] -> IO Status
loop State{..} packets = do
    (State{..}, status) <- lexer State{..}
    case status of
        End -> do
            debug $ printf "done: got %d packets\n" _recv
            return End
        Waiting -> do
            debug $ printf "waiting...\n"
            packets' <- case packets of
                [] -> do
                    writeChan _pipe BS.empty
                    return []
                p:ps -> do
                    debug $ printf "sent packet '%s'\n" (show p)
                    writeChan _pipe p
                    return ps
            (State{..}, status') <- fill State{..}
            case status' of
                Ready -> loop State{..} packets'
                _ -> error "unexpected status after fill"
        BadPacket -> do
            debug $ printf "error: ill-formed packet\n"
            return BadPacket
        _ -> error "unexpected status"

test :: [BS.ByteString] -> Status -> IO ()
test packets expect = do
    pipe <- newChan -- emulate pipe using a chan of bytestrings
    let st = State {
        _pipe = pipe,
        _str = BS.singleton 0, -- null sentinel triggers YYFILL
        _cur = 0,
        _mar = 0,
        _tok = 0,
        _lim = 0,
        _eof = False,
        _yystate = -1,
        _recv = 0
    }
    status <- loop st packets
    when (status /= expect) $ error "failed"
    return ()

main :: IO ()
main = do
    test [] End
    test ["ze", "ro;o", "ne", ";t", "wo;thr", "e", "e", ";", "four;"] End
    test ["zer0;"] BadPacket

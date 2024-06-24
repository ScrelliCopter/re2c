-- re2hs $INPUT -o $OUTPUT
{-# OPTIONS_GHC -Wno-unused-record-wildcards #-}
{-# LANGUAGE OverloadedStrings #-}

import Control.Monad
import Data.ByteString as BS
import GHC.IO.Handle
import System.Directory
import System.IO

chunk_size :: Int
chunk_size = 4096

data State = State {
    _file :: !Handle,
    _yyinput :: !BS.ByteString,
    _yycursor :: !Int,
    _yymarker :: !Int,
    _yylimit :: !Int,
    _token :: !Int,
    _eof :: !Bool,
    /*!stags:re2c format = '\n@@{tag} :: !Int,'; */
    _1 :: !Int,
    _2 :: !Int,
    _3 :: !Int,
    _4 :: !Int,
    _5 :: !Int
}

data SemVer = SemVer {
    major :: !Int,
    minor :: !Int,
    patch :: !Int
} deriving (Eq, Show)

s2n :: BS.ByteString -> Int -> Int -> Int
s2n s i j = f i 0 where
    f k n = if k >= j then n else f (k + 1) (n * 10 + (fromIntegral (BS.index s k) - 48))

/*!re2c
    re2c:define:YYFN = ["lexer;IO [SemVer]", "State{..};State", "_vers;[SemVer]"];
    re2c:define:YYPEEK = "BS.index";
    re2c:define:YYFILL = "(State{..}, yyfill) <- fill State{..}";
    re2c:eof = 0;
    re2c:monadic = 1;
    re2c:tags = 1;

    num = [0-9]+;

    @_1 num @_2 "." @_3 num @_4 ("." @_5 num)? [\n] {
        let ver = SemVer {
            major = s2n _yyinput _1 _2,
            minor = s2n _yyinput _3 _4,
            patch = if _5 == (-1) then 0 else s2n _yyinput _5 (_yycursor - 1)
        }
        lexer State{..} (ver: _vers)
    }
    $ { return _vers }
    * { error "lexer failed" }
*/

fill :: State -> IO (State, Bool)
fill State{..} = do
    case _eof of
        True -> return (State{..}, False)
        False -> do
            -- Discard everything up to the current token, cut off terminating null,
            -- read new chunk from file and reappend terminating null at the end.
            chunk <- BS.hGet _file chunk_size
            return (State{
                _yyinput = BS.concat [(BS.init . BS.drop _token) _yyinput, chunk, "\0"],
                _yycursor = _yycursor - _token,
                _yymarker = _yymarker - _token,
                _yylimit = _yylimit - _token + BS.length chunk, -- exclude terminating null
                _token = 0,
                _eof = BS.null chunk, -- end of file?
                ..}, True)

main :: IO ()
main = do
    let fname = "input"

    -- Prepare input file.
    BS.writeFile fname $ BS.concat ["1.22.333\n" | _ <- [1..chunk_size]]
    let expect = [SemVer {major = 1, minor = 22, patch = 333} | _ <- [1..chunk_size]]

    -- Run lexer on the prepared file.
    fh <- openFile fname ReadMode
    let st = State {
        _file = fh,
        _yyinput = BS.singleton 0,
        _yycursor = 0,
        _yymarker = 0,
        _yylimit = 0,
        _token = 0,
        _eof = False,
        /*!stags:re2c format = '\n@@{tag} = (-1),'; */
        _1 = (-1),
        _2 = (-1),
        _3 = (-1),
        _4 = (-1),
        _5 = (-1)
    }
    result <- lexer st []
    hClose fh

    -- Cleanup.
    removeFile fname

    -- Check result.
    when (result /= expect) $ error $ "expected " ++ show expect ++ ", got " ++ show result
    return ()

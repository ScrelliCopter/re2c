-- re2hs $INPUT -o $OUTPUT
{-# OPTIONS_GHC -Wno-unused-record-wildcards #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

import Control.Monad (when)
import Data.ByteString as BS
import Data.Word

data State = State {
    _str :: BS.ByteString,
    _cur :: Int,
    _mar :: Int,
    _lim :: Int
} deriving (Show)

-- expect a null-terminated string
/*!re2c
    re2c:define:YYFN       = ["lexer;Int", "State{..};State", "_cnt;Int"];
    re2c:define:YYCTYPE    = "Word8";
    re2c:define:YYPEEK     = "BS.index _str _cur";
    re2c:define:YYSKIP     = "let cur = _cur + 1 in let _cur = cur in";
    re2c:define:YYBACKUP   = "let _mar = _cur in";
    re2c:define:YYRESTORE  = "let _cur = _mar in";
    re2c:define:YYLESSTHAN = "_cur >= _lim";
    re2c:eof = 0;
    re2c:yyfill:enable = 0;

    str = ['] ([^'\\] | [\\][^])* ['];

    *    { (-1) }
    $    { _cnt }
    str  { lexer State{..} (_cnt + 1) }
    [ ]+ { lexer State{..} _cnt }
*/

main :: IO ()
main = do
    let test s n = do
            let st = State {
                    _str = s,
                    _cur = 0, 
                    _mar = 0,
                    _lim = BS.length s - 1} -- terminating null not included

            when (lexer st 0 /= n) $ error "failed"

    test "\0" 0
    test "'qu\0tes' 'are' 'fine: \\'' \0" 3
    test "'unterminated\\'\0" (-1)

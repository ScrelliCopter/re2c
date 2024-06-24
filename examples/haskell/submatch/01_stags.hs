-- Generated by re2c
{-# LANGUAGE RecordWildCards #-}
#1 "haskell/submatch/01_stags.re"
-- re2hs $INPUT -o $OUTPUT
{-# OPTIONS_GHC -Wno-unused-record-wildcards #-}
{-# LANGUAGE OverloadedStrings #-}

import Control.Monad (when)
import Data.ByteString (ByteString, index)

data State = State {
    _yyinput :: !ByteString,
    _yycursor :: !Int,
    _yymarker :: !Int,
    
#17 "haskell/submatch/01_stags.hs"

_yyt1 :: !Int,
_yyt2 :: !Int,
_yyt3 :: !Int,
_yyt4 :: !Int,
#12 "haskell/submatch/01_stags.re"

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
} deriving (Eq)

s2n :: ByteString -> Int -> Int -> Int
s2n s i j = f i 0 where
    f k n = if k >= j then n else f (k + 1) (n * 10 + (fromIntegral (index s k) - 48))


#43 "haskell/submatch/01_stags.hs"
yy0 :: State -> Maybe SemVer
yy0 State{..} =
    let yych = index _yyinput _yycursor in
    case yych of
        _c | 0x30 <= _c && _c <= 0x39 ->
            let _yyt1 = _yycursor in
            let __ = _yycursor + 1 in let _yycursor = __ in
            yy3 State{..}
        _c | True ->
            let __ = _yycursor + 1 in let _yycursor = __ in
            yy1 State{..}

yy1 :: State -> Maybe SemVer
yy1 State{..} =
    yy2 State{..}

yy2 :: State -> Maybe SemVer
yy2 State{..} =
#44 "haskell/submatch/01_stags.re"
    Nothing
#64 "haskell/submatch/01_stags.hs"

yy3 :: State -> Maybe SemVer
yy3 State{..} =
    let _yymarker = _yycursor in
    let yych = index _yyinput _yycursor in
    case yych of
        _c | 0x2E == _c ->
            let __ = _yycursor + 1 in let _yycursor = __ in
            yy4 State{..}
        _c | 0x30 <= _c && _c <= 0x39 ->
            let __ = _yycursor + 1 in let _yycursor = __ in
            yy6 State{..}
        _c | True ->
            yy2 State{..}

yy4 :: State -> Maybe SemVer
yy4 State{..} =
    let yych = index _yyinput _yycursor in
    case yych of
        _c | 0x30 <= _c && _c <= 0x39 ->
            let _yyt2 = _yycursor in
            let __ = _yycursor + 1 in let _yycursor = __ in
            yy7 State{..}
        _c | True ->
            yy5 State{..}

yy5 :: State -> Maybe SemVer
yy5 State{..} =
    let _yycursor = _yymarker in
    yy2 State{..}

yy6 :: State -> Maybe SemVer
yy6 State{..} =
    let yych = index _yyinput _yycursor in
    case yych of
        _c | 0x2E == _c ->
            let __ = _yycursor + 1 in let _yycursor = __ in
            yy4 State{..}
        _c | 0x30 <= _c && _c <= 0x39 ->
            let __ = _yycursor + 1 in let _yycursor = __ in
            yy6 State{..}
        _c | True ->
            yy5 State{..}

yy7 :: State -> Maybe SemVer
yy7 State{..} =
    let yych = index _yyinput _yycursor in
    case yych of
        _c | 0x00 == _c ->
            let _yyt3 = _yycursor in
            let _yyt4 = (-1) in
            let __ = _yycursor + 1 in let _yycursor = __ in
            yy8 State{..}
        _c | 0x2E == _c ->
            let _yyt3 = _yycursor in
            let __ = _yycursor + 1 in let _yycursor = __ in
            yy9 State{..}
        _c | 0x30 <= _c && _c <= 0x39 ->
            let __ = _yycursor + 1 in let _yycursor = __ in
            yy7 State{..}
        _c | True ->
            yy5 State{..}

yy8 :: State -> Maybe SemVer
yy8 State{..} =
    let _1 = _yyt1 in
    let _3 = _yyt2 in
    let _4 = _yyt3 in
    let _5 = _yyt4 in
    let _2 = _yyt2 in
    let __ = if _2 == (-1) then (-1) else _2 - 1 in let _2 = __ in
#37 "haskell/submatch/01_stags.re"
    Just SemVer {
        major = s2n _yyinput _1 _2,
        minor = s2n _yyinput _3 _4,
        patch = if _5 == (-1) then 0 else s2n _yyinput _5 (_yycursor - 1)
    }
#142 "haskell/submatch/01_stags.hs"

yy9 :: State -> Maybe SemVer
yy9 State{..} =
    let yych = index _yyinput _yycursor in
    case yych of
        _c | 0x30 <= _c && _c <= 0x39 ->
            let _yyt4 = _yycursor in
            let __ = _yycursor + 1 in let _yycursor = __ in
            yy10 State{..}
        _c | True ->
            yy5 State{..}

yy10 :: State -> Maybe SemVer
yy10 State{..} =
    let yych = index _yyinput _yycursor in
    case yych of
        _c | 0x00 == _c ->
            let __ = _yycursor + 1 in let _yycursor = __ in
            yy8 State{..}
        _c | 0x30 <= _c && _c <= 0x39 ->
            let __ = _yycursor + 1 in let _yycursor = __ in
            yy10 State{..}
        _c | True ->
            yy5 State{..}

parse :: State -> Maybe SemVer
parse State{..} =
    yy0 State{..}

#45 "haskell/submatch/01_stags.re"


test :: ByteString -> Maybe SemVer -> IO ()
test str expect = do
    let s = State {
        _yyinput = str,
        _yycursor = 0,
        _yymarker = 0,
        
#182 "haskell/submatch/01_stags.hs"

_yyt1 = (-1),
_yyt2 = (-1),
_yyt3 = (-1),
_yyt4 = (-1),
#53 "haskell/submatch/01_stags.re"

        _1 = (-1),
        _2 = (-1),
        _3 = (-1),
        _4 = (-1),
        _5 = (-1)
    }
    when (parse s /= expect) $ error "failed!"

main :: IO ()
main = do
    test "23.34\0" (Just SemVer {major = 23, minor = 34, patch = 0})
    test "1.2.99999\0" (Just SemVer {major = 1, minor = 2, patch = 99999})
    test "1.a\0" Nothing

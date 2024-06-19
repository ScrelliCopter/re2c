-- Generated by re2c
{-# LANGUAGE RecordWildCards #-}
-- re2hs $INPUT -o $OUTPUT -ci
{-# OPTIONS_GHC -Wno-unused-record-wildcards #-}
{-# LANGUAGE OverloadedStrings #-}

import Control.Monad (when)
import Data.ByteString (ByteString, index)

data YYCONDTYPE = YYC_init | YYC_bin | YYC_oct | YYC_dec | YYC_hex deriving (Eq, Show)


data State = State {
    _str :: !ByteString,
    _cur :: !Int,
    _mar :: !Int,
    _yycond :: !YYCONDTYPE
}

peek_digit :: ByteString -> Int -> Int -> Int
peek_digit str idx offs = fromIntegral (index str (idx - 1)) - offs


yy1 :: State -> Int -> Maybe Int
yy1 State{..} _num =
    let yych = index _str _cur in
    let __ = _cur + 1 in let _cur = __ in
    case yych of
        _c | 0x30 == _c ->
            yy3 State{..} _num
        _c | 0x31 <= _c && _c <= 0x39 ->
            yy5 State{..} _num
        _c | True ->
            yy2 State{..} _num

yy2 :: State -> Int -> Maybe Int
yy2 State{..} _num =
    Nothing

yy3 :: State -> Int -> Maybe Int
yy3 State{..} _num =
    let _mar = _cur in
    let yych = index _str _cur in
    case yych of
        _c | 0x42 == _c || 0x62 == _c ->
            let __ = _cur + 1 in let _cur = __ in
            yy6 State{..} _num
        _c | 0x58 == _c || 0x78 == _c ->
            let __ = _cur + 1 in let _cur = __ in
            yy8 State{..} _num
        _c | True ->
            yy4 State{..} _num

yy4 :: State -> Int -> Maybe Int
yy4 State{..} _num =
    let _yycond = YYC_oct in
    yyfnoct State{..} _num

yy5 :: State -> Int -> Maybe Int
yy5 State{..} _num =
    let __ = _cur - 1 in let _cur = __ in
    let _yycond = YYC_dec in
    yyfndec State{..} _num

yy6 :: State -> Int -> Maybe Int
yy6 State{..} _num =
    let yych = index _str _cur in
    case yych of
        _c | 0x30 <= _c && _c <= 0x31 ->
            let __ = _cur + 1 in let _cur = __ in
            yy9 State{..} _num
        _c | True ->
            yy7 State{..} _num

yy7 :: State -> Int -> Maybe Int
yy7 State{..} _num =
    let _cur = _mar in
    yy4 State{..} _num

yy8 :: State -> Int -> Maybe Int
yy8 State{..} _num =
    let yych = index _str _cur in
    case yych of
        _c | 0x30 <= _c && _c <= 0x39 || 0x41 <= _c && _c <= 0x46 || 0x61 <= _c && _c <= 0x66 ->
            let __ = _cur + 1 in let _cur = __ in
            yy10 State{..} _num
        _c | True ->
            yy7 State{..} _num

yy9 :: State -> Int -> Maybe Int
yy9 State{..} _num =
    let __ = _cur - 1 in let _cur = __ in
    let _yycond = YYC_bin in
    yyfnbin State{..} _num

yy10 :: State -> Int -> Maybe Int
yy10 State{..} _num =
    let __ = _cur - 1 in let _cur = __ in
    let _yycond = YYC_hex in
    yyfnhex State{..} _num

yyfninit :: State -> Int -> Maybe Int
yyfninit State{..} _num =
    yy1 State{..} _num

yy11 :: State -> Int -> Maybe Int
yy11 State{..} _num =
    let yych = index _str _cur in
    let __ = _cur + 1 in let _cur = __ in
    case yych of
        _c | 0x30 <= _c && _c <= 0x31 ->
            yy13 State{..} _num
        _c | True ->
            yy12 State{..} _num

yy12 :: State -> Int -> Maybe Int
yy12 State{..} _num =
    Just _num

yy13 :: State -> Int -> Maybe Int
yy13 State{..} _num =
    yyfnbin State{..} $ _num * 2 + (peek_digit _str _cur 48)

yyfnbin :: State -> Int -> Maybe Int
yyfnbin State{..} _num =
    yy11 State{..} _num

yy14 :: State -> Int -> Maybe Int
yy14 State{..} _num =
    let yych = index _str _cur in
    let __ = _cur + 1 in let _cur = __ in
    case yych of
        _c | 0x30 <= _c && _c <= 0x37 ->
            yy16 State{..} _num
        _c | True ->
            yy15 State{..} _num

yy15 :: State -> Int -> Maybe Int
yy15 State{..} _num =
    Just _num

yy16 :: State -> Int -> Maybe Int
yy16 State{..} _num =
    yyfnoct State{..} $ _num * 8 + (peek_digit _str _cur 48)

yyfnoct :: State -> Int -> Maybe Int
yyfnoct State{..} _num =
    yy14 State{..} _num

yy17 :: State -> Int -> Maybe Int
yy17 State{..} _num =
    let yych = index _str _cur in
    let __ = _cur + 1 in let _cur = __ in
    case yych of
        _c | 0x30 <= _c && _c <= 0x39 ->
            yy19 State{..} _num
        _c | True ->
            yy18 State{..} _num

yy18 :: State -> Int -> Maybe Int
yy18 State{..} _num =
    Just _num

yy19 :: State -> Int -> Maybe Int
yy19 State{..} _num =
    yyfndec State{..} $ _num * 10 + (peek_digit _str _cur 48)

yyfndec :: State -> Int -> Maybe Int
yyfndec State{..} _num =
    yy17 State{..} _num

yy20 :: State -> Int -> Maybe Int
yy20 State{..} _num =
    let yych = index _str _cur in
    let __ = _cur + 1 in let _cur = __ in
    case yych of
        _c | 0x30 <= _c && _c <= 0x39 ->
            yy22 State{..} _num
        _c | 0x41 <= _c && _c <= 0x46 ->
            yy23 State{..} _num
        _c | 0x61 <= _c && _c <= 0x66 ->
            yy24 State{..} _num
        _c | True ->
            yy21 State{..} _num

yy21 :: State -> Int -> Maybe Int
yy21 State{..} _num =
    Just _num

yy22 :: State -> Int -> Maybe Int
yy22 State{..} _num =
    yyfnhex State{..} $ _num * 16 + (peek_digit _str _cur 48)

yy23 :: State -> Int -> Maybe Int
yy23 State{..} _num =
    yyfnhex State{..} $ _num * 16 + (peek_digit _str _cur 55)

yy24 :: State -> Int -> Maybe Int
yy24 State{..} _num =
    yyfnhex State{..} $ _num * 16 + (peek_digit _str _cur 87)

yyfnhex :: State -> Int -> Maybe Int
yyfnhex State{..} _num =
    yy20 State{..} _num

yy0 :: State -> Int -> Maybe Int
yy0 State{..} _num =
    case _yycond of
        _c | YYC_init == _c ->
            yyfninit State{..} _num
        _c | YYC_bin == _c ->
            yyfnbin State{..} _num
        _c | YYC_oct == _c ->
            yyfnoct State{..} _num
        _c | YYC_dec == _c ->
            yyfndec State{..} _num
        _c | YYC_hex == _c ->
            yyfnhex State{..} _num
        _c | True ->
            error "internal lexer error"

parse :: State -> Int -> Maybe Int
parse State{..} _num =
    yy0 State{..} _num



test :: ByteString -> Maybe Int -> IO ()
test str expect = do
    let s = State {
            _str = str,
            _cur = 0,
            _mar = 0,
            _yycond = YYC_init}
    when (parse s 0 /= expect) $ error "failed!"

main :: IO ()
main = do
    test "\0" Nothing
    test "1234567890\0" (Just 1234567890)
    test "0b1101\0" (Just 13)
    test "0x7Fe\0" (Just 2046)
    test "0644\0" (Just 420)
    test "9223372036854775807\0" (Just 9223372036854775807)

module StandingOvation where

import Control.Monad
import Control.Applicative
import Data.List
import Data.List.Split
import Text.Printf
import System.IO

countZero :: [Char] -> Int
countZero = length . filter (== '0')

readInt :: String -> Int
readInt = read

formatOutput :: Int -> Int -> String
formatOutput = printf "Case #%d: %d"

inFile = "A-small-attempt1.in"

main :: IO ()
main = do
  input <- openFile inFile ReadMode
           >>= hGetContents >>= return . lines
  let numTimes = readInt (head input)
      trials   = map countZero . concatMap (tail . splitOn " ") $ tail input
  writeFile "A.out" . unlines $ zipWith formatOutput [1..numTimes] trials

import System.IO
import Control.Monad
import Data.List
import Text.Printf

(|>>) = flip (<$>)

printCase :: Handle -> Int -> String -> IO ()
printCase h = hPrintf h "Case #%d: %s\n"

main :: IO ()
main = do
  out <- openFile "B-small-practice.out" WriteMode
  readFile "B-small-practice.in"
    |>> lines
    |>> tail
    |>> map (intercalate " " . reverse . words)
    >>=  zipWithM_ (printCase out) [1..]

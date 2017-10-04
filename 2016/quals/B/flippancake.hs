{-# LANGUAGE ScopedTypeVariables #-}
import Data.Bifunctor
import Control.Monad
-- assume left is top
flipcake :: String -> Int
flipcake s = case rest of
    [] -> mflip ms -- if rest is nothing, then just flip top '-'s and we are done
    _  -> mflip ms + mflip ps + flipcake rest
  where
    (ms, (ps, rest)) = second (span (== '+')) . span (=='-') $ s

    mflip [] = 0
    mflip  _ = 1

{-
   - + - -
=> + + - -
=> - - + +
=> + + + +
-}


main :: IO ()
main = do
  n :: Int <- readLn
  forM_ [1..n] $ \i -> do
    s <- getLine
    let r = flipcake s
    putStrLn $ "Case #" ++ show i ++ ": " ++ show r

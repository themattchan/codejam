import Control.Applicative
import Control.Monad
import Data.List
import Data.Maybe
import Data.Char hiding (Space)
import Text.Printf
import System.IO
import qualified Data.Map.Lazy as M

data Letter = Letter Char | Space
  deriving (Ord, Eq, Show)

data Expansion = Exp { key :: Int, expansion :: String } -- original number, expanded string
  deriving (Ord, Eq, Show)

letters :: M.Map Letter Expansion
letters = foldr (uncurry M.insert) M.empty kvs'
  where kvs = zipWith repr ['a'..'z'] $ concatMap (\(n,r) -> [(n,i) | i <- [1..r]]) keys
        kvs' = space : zero : kvs
        keys = [(2,3),(3,3),(4,3),(5,3),(6,3),(7,4),(8,3),(9,4)]
        repr c (n,r) = (Letter c, Exp n (concat (replicate r (show n))))
        zero = (Letter ' ', Exp 0 "0")
        space = (Space, Exp 0 " ")

expand :: Letter -> Expansion
expand = fromJust . flip M.lookup letters

getExpansion :: Letter -> String
getExpansion = expansion . expand

isSameKey :: Letter -> Letter -> Bool
isSameKey a b = f a == f b
  where f = key . expand

serialise :: String -> String
serialise  = reverse . concatMap getExpansion . foldl insertSpace []
  where insertSpace [] x = [Letter x]
        insertSpace (a:as) x  =
          let x' = Letter x in
              if isSameKey a x' then x' : Space : a:as
              else x' : a : as

main :: IO ()
main = do
  out <- openFile "C-large-practice.out" WriteMode
  inp <- openFile "C-large-practice.in"  ReadMode
  n   <- (fmap read $  (hGetLine inp)) :: IO Int
  forM_ [1..n] $ \i -> do
    ss <- hGetLine inp
    hPrintf out "Case #%d: %s\n" i  (serialise ss)

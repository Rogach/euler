import Data.List
import Data.Ord
import qualified Data.Map as Map
import Control.Monad.State
import Control.Applicative
import System.IO.Unsafe

-- dumb way, but fast (completes in 5.2s)
main = print $ fst $ maximumBy (comparing (length . snd)) $ map (\n -> (n, collatz n)) [1..999999]
collatz :: Int -> [Int]
collatz n = if n == 1 then [1] else if even n then n : collatz (n `div` 2) else n : collatz (3*n + 1)

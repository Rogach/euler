import qualified Data.Map as Map
import Control.Monad.State

main :: IO ()
main = print $ evalState (routes 20 20) Map.empty

routes :: Int -> Int -> State (Map.Map (Int, Int) Int) Int
routes x y = state $ \cache ->
  case Map.lookup (x,y) cache of
    Just result -> (result, cache)
    Nothing -> case (x,y) of
      (0,_) -> (1, cache)
      (_,0) -> (1, cache)
      _ -> let (right, newCache1) = runState (routes (x-1) y) cache
               (down, newCache2) = runState (routes x (y-1)) newCache1
               result = right + down
           in (result, Map.insert (x,y) result newCache2)
  
  

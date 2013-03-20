import Data.List
import Data.Ord

main :: IO ()
main = print $ fst $ maximumBy (comparing snd) $ zip [2..] $ map (\d -> length $ findCycle (div' d) (1,0)) [2..999]

div' :: Int -> (Int, Int) -> (Int, Int)
div' d (i,_) = (mod (10*i) d, (10*i) `div` d)

-- implements Floyd's cycle-finding algorithm ("tortoise and hare")
findCycle :: (Eq a) => (a -> a) -> a -> [a]
findCycle f stt = cyc $ mu stt $ nu (f stt) (f $ f stt)
  where nu tortoise hare =
          if tortoise == hare
          then tortoise
          else nu (f tortoise) (f $ f hare)
        mu tortoise hare =
          if tortoise == hare
          then hare
          else mu (f tortoise) (f hare)
        cyc tortoise = tortoise : unfoldr (\hare -> if hare == tortoise then Nothing else Just (hare, f hare)) (f tortoise)

data Weekday = Monday 
             | Tuesday 
             | Wednesday 
             | Thursday 
             | Friday 
             | Saturday 
             | Sunday 
             deriving (Show, Eq, Ord, Enum)

data Month = January 
           | February 
           | March 
           | April 
           | May 
           | June 
           | July 
           | August 
           | September 
           | October 
           | November 
           | December 
           deriving (Show, Eq, Ord, Enum)

data Date = Date { year :: Int
                 , month :: Month
                 , day :: Int
                 , dayOfWeek :: Weekday
                 } deriving (Show, Eq, Ord)

main = print $ length $
       filter (\d -> dayOfWeek d == Sunday && day d == 1) $ 
       takeWhile (\d -> year d < 2001) $ 
       dropWhile (\d -> year d < 1901) $
       iterate incrDate (Date 1900 January 1 Monday)

incrDate :: Date -> Date
incrDate d = if day d + 1 > monthLength d 
             then if month d == December
                  then d { year = year d + 1, month = January, day = 1, dayOfWeek = nextWeekday $ dayOfWeek d }
                  else d { month = succ $ month d, day = 1, dayOfWeek = nextWeekday $ dayOfWeek d }
             else d { day = day d + 1, dayOfWeek = nextWeekday $ dayOfWeek d }
                  
nextWeekday :: Weekday -> Weekday
nextWeekday Sunday = Monday
nextWeekday d = succ d

monthLength :: Date -> Int
monthLength Date { year = y, month = m } = case m of
  _ | any (== m) [September, April, June, November] -> 30
  February -> if mod y 4 == 0 && (mod y 400 == 0 || mod y 100 /= 0) then 29 else 28
  _ -> 31

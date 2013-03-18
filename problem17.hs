import Data.Char

main = print $ sum $ map (length . filter (isAlpha) . toEnglish) [1..1000]

toEnglish :: Int -> String
toEnglish n = case n of
  1 -> "one"
  2 -> "two"
  3 -> "three"
  4 -> "four"
  5 -> "five"
  6 -> "six"
  7 -> "seven"
  8 -> "eight"
  9 -> "nine"
  10 -> "ten"
  11 -> "eleven"
  12 -> "twelve"
  13 -> "thirteen"
  14 -> "fourteen"
  15 -> "fifteen"
  16 -> "sixteen"
  17 -> "seventeen"
  18 -> "eighteen"
  19 -> "nineteen"

  20 -> "twenty"
  30 -> "thirty"
  40 -> "forty"
  50 -> "fifty"
  60 -> "sixty"
  70 -> "seventy"
  80 -> "eighty"
  90 -> "ninety"

  1000 -> "one thousand"

  _ | n < 100 -> toEnglish (n - mod n 10) ++ "-" ++ toEnglish (mod n 10)
  
  _ | mod n 100 == 0 -> toEnglish (n `div` 100) ++ " hundred"
  _ | n < 1000 -> toEnglish (n - mod n 100) ++ " and " ++ toEnglish (mod n 100)


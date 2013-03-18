main = print $ maximum [ a * b | a <- [100..999], b <- [100..999], isPalindrome (show (a*b))]

isPalindrome :: String -> Bool
isPalindrome str = str == reverse str
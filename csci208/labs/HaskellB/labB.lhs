Author: Andre Amirsaleh
Course: CSCI 208L (1:00PM section)
Assignment: HaskellB
Prof: Benoit Razet
Date: 10/27/16


PROBLEM 6:

1.

>roots :: Int -> Int -> Int -> (Float, Float)
>roots a b c = if (((fromIntegral b) ** 2) - ((4 * (fromIntegral a)) * (fromIntegral c))) < 0
>              then error "No real roots"
>              else (plus, minus)
>              where af = fromIntegral a
>                    bf = fromIntegral b
>                    cf = fromIntegral c
>                    plus = ((-1 * bf) + (sqrt ((bf ** 2) - ((4 * af) * cf)))) / (2 * af)
>                    minus = ((-1 * bf) - (sqrt ((bf ** 2) - ((4 * af) * cf)))) / (2 * af)

2.

>allRoots :: Int -> Int -> Int -> ((Float, Float), (Float, Float))
>allRoots a b c = if (delta >= 0)
>                 then ((r1, 0), (r2, 0))
>                 else ((r, i1), (r, i2))
>                 where delta = (bf ** 2) - ((4 * af) * (cf))
>                       af = fromIntegral a
>                       bf = fromIntegral b
>                       cf = fromIntegral c
>                       r1 = ((-1 * bf) + (sqrt delta)) / (2 * af)
>                       r2 = ((-1 * bf) - (sqrt delta)) / (2 * af)
>                       r = (-1 * bf) / (2 * af)
>                       i1 = (sqrt (abs delta)) / (2 * af)
>                       i2 = -1 * i1


PROBLEM 7:

i) tail takes longer than head

ii) execution time for computing the head of the tail seems instantaneous regardless of n


PROBLEM 8:

1.

>revHead ls = (head (tail ls)) : ((head ls) : (tail (tail ls)))

2.

>slice from to xs = take (to - from + 1) (drop from xs)
>strip n l = if (length l < 1)
>                then error "ERROR: Empty list!"
>                else if ((length (l)) <= (n * 2))
>                then []
>                else slice (n + 1) (length (l) - 1 - n) l

ref: http://stackoverflow.com/questions/4597820/does-haskell-have-list-slices-i-e-python

3.

>mrg :: [Int] -> [Int] -> [Int]
>mrg [] [] = []
>mrg [] l = l
>mrg l [] = l
>mrg (x : xs) (y : ys) = if x < y
>                        then x : (mrg xs(y : ys))
>                        else y : (mrg (x : xs) ys)


PROBLEM 9:

Pattern             Argument            Succeeds?       Bindings
1                     1                    yes           1 = 1
2                     1                    no
x                     1                    yes           x = 1
x:y                 [1,2]                  yes           x = 1, y = [2]
x:y                [[1,2]]                 yes           x = [1,2], y = []
x:y               "Bucknell"               yes           x = 'B', y = "ucknell"
x:y              ["Bucknell"]              yes           x = "Bucknell", y = []
x:y:z             [1,2,3,4,5]              no
x                    []                    yes           x = []
[1,x]              [2,2]                   no            
[]                 [2,2]                   no
(x,y)             [1,2,3,4]                no
((x:y),(z:w))    ([1],"Bucknell")          yes           x = 1, y = [], Z = 'B', w = "ucknell"


PROBLEM 10

>addRat :: (Int, Int) -> (Int, Int) -> (Int, Int)
>addRat (_, 0) (_, _) = error "Can’t divide by zero!"
>addRat (_, _) (_, 0) = error "Can’t divide by zero!"
>addRat (a, b) (c, d) = (x, y) 
>                       where
>                           div = b * d
>                           num = a * d + c * b
>                           x = quot num (gcf (num, div))
>                           y = quot div (gcf (num, div))
>gcf :: (Int, Int) -> Int
>gcf (a, 0) = a
>gcf (a, b) = gcf (b, (a `mod` b))


PROBLEM 11

1.

>sorted :: [Int] -> Bool
>sorted [] = True
>sorted [_] = True
>sorted (a : b) = if (a <= head b)
>                 then sorted b
>                 else False

Base case:
sorted [] = True
sorted [_] = True

Recursive case:
sorted (a : b) = if (a <= head b) then sorted b else False

2.

>countList :: [Int] -> Int
>countList [] = 0
>countList (a : b) = a + (countList b)

Base case:
countList [] = 0

Recursive case:
countList (a : b) = a + (countList b)
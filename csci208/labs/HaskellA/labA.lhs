PROBLEM 1:

1. The factorial function (called fact):

% >fact :: Int -> Int
% >


>fact 0 = 1
>fact n = n * fact (n - 1)

2. (a) If I comment out the rule for fact 0, the program enters an infinite
			 loop because the that rule is the base case! So, the program keeps on
			 recursing
	 (b) Arguments are separated by spaces, so (in laimen-speak first)
			 fact(n-1) in haskel CANNOT be written WITHOUT parentheses -- AKA the
			 shortest way to write it in haskell is fact (n - 1) because fact n - 1 is
			 interpretted as (in laimen-speak again) fact(n, -, 1), which is nonsense.

3. First (less effecient) definition of the choose function

% >choose :: Int -> Int -> Int
% >


>choose 0 0 = 1
>choose 0 k = 0
>choose n k = div (fact n) (fact k * fact (n - k))

4. fact 50 evaluates to -3258495067890909184.
	 choose 50 5 evaluates to 0.

5.

% >choose2 :: Int -> Int -> Int
% >


>choose2 0 0 = 1
>choose2 0 k = 0
>choose2 n 1 = n
>choose2 n k = choose2 (n - 1) (k - 1) + choose2 (n - 1) k

6. choose2 50 5 evaluates to 2118760, which is correct; and, as we saw earlier,
	 choose 50 5 evaluates to 0, which is incorrect. Choose2 works better for
	 bigger computations because it recurses more efficiently. choose2 50 5 takes
	 a while to execute because it has to recurse so many times!

7. choose2 50 5 still works after commenting out the explicit type-cast.
	 choose 50 5 finally works now because the function now returns an Integer-
	 value rather than an Int-value. Using Integer-values makes the result more
	 accurate but takes up more memory.

8.

>fib 0 = 1
>fib 1 = 1
>fib n = fib (n - 1) + fib (n - 2)

*Main> fib 0
1
it :: Integer
*Main> fib 1
1
it :: Integer
*Main> fib 2
2
it :: Integer
*Main> fib 3
3
it :: Integer
*Main> fib 4
5
it :: Integer
*Main> fib 5
8
it :: Integer
*Main> fib 6
13
it :: Integer
*Main> fib 7
21
it :: Integer
*Main> fib 8
34
it :: Integer
*Main> fib 9
55


PROBLEM 2:

>fibsel n = if n == 0
>           then 1
>           else if n == 1
>           then 1
>           else fib (n - 1) + fib (n - 2)


PROBLEM 3:

>fibcase n = case n of
>                 0 -> 1
>                 1 -> 1
>                 n -> fib (n - 1) + fib (n - 2)


PROBLEM 4:

1.

>grade :: Int -> Char
>grade n
>      | n < 0     = 'E'
>      | n < 60    = 'F'
>      | n < 70    = 'D'
>      | n < 80    = 'C'
>      | n < 90    = 'B'
>      | n <= 100  = 'A'
>      | otherwise = 'E'

2.

>abs2 n = if n < 0
>         then n * (-1)
>         else n


PROBLEM 5:

>hyp :: Int -> Int -> Float
>hyp a b = sqrt (((fromIntegral (a)) ^ 2) + ((fromIntegral (b)) ^ 2))
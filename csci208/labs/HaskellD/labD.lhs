Andre Amirsaleh and Daniel Toback

>import System.Exit
>import System.IO
>import Data.Char


PROBLEM 17

>type MLoc = Int
>type Memory = [Int]
>type Program = [ (Maybe String, Instruction) ]
>type ProgramCounter = Int

>data Instruction = Addi MLoc MLoc Int -- Arithmetic operations
>	                | Subi MLoc MLoc Int
>                	| Muli MLoc MLoc Int
>                	| Add MLoc MLoc MLoc
>                	| Sub MLoc MLoc MLoc
>                	| Mul MLoc MLoc MLoc
>                	| Move MLoc MLoc -- Memory
>                	| Load MLoc MLoc
>                	| Loadi MLoc Int
>                	| Store MLoc MLoc
>                	| Beq MLoc MLoc String -- Jump/Branch
>                	| Jump String
>                	| Exit -- Exit
>                	deriving (Show)

>getMem :: Memory -> MLoc -> Int
>getMem (v:xs) 0 = v
>getMem (x:xs) mloc = getMem xs (mloc-1)

>setMem :: Memory -> MLoc -> Int -> Memory
>setMem (_:xs) 0 v = v : xs
>setMem (x:xs) mloc v = x : setMem xs (mloc-1) v

>getInstr :: Program -> ProgramCounter -> Instruction
>getInstr (instr:_) 0 = snd instr
>getInstr (_:xs) n = getInstr xs (n-1)

>getPC :: Program -> String -> ProgramCounter
>getPC ((Just s, instr):xs) label = if s == label then 0 else 1 + getPC xs label
>getPC ((Nothing, instr):xs) label = 1 + getPC xs label

>oneInstr :: Program -> ProgramCounter -> Memory -> (ProgramCounter, Memory)
>oneInstr p pc m =
>	                case getInstr p pc of
>		            Addi loc1 loc2 n -> (pc+1, setMem m loc1 ((getMem m loc2) + n))
>		            Subi loc1 loc2 n -> (pc+1, setMem m loc1 ((getMem m loc2) - n))
>		            Muli loc1 loc2 n -> (pc+1, setMem m loc1 ((getMem m loc2) * n))
>		            Add loc1 loc2 loc3 -> (pc+1, setMem m loc1 ((getMem m loc2) + (getMem m loc3)))
>		            Sub loc1 loc2 loc3 -> (pc+1, setMem m loc1 ((getMem m loc2) - (getMem m loc3)))
>		            Mul loc1 loc2 loc3 -> (pc+1, setMem m loc1 ((getMem m loc2) * (getMem m loc3)))
>		            Move loc1 loc2 -> (pc+1, setMem m loc1 loc2)
>		            Load loc1 loc2 -> (pc+1, setMem m loc1 (getMem m (getMem m loc2)))
>		            Loadi loc1 n -> (pc+1, setMem m loc1 n)
>		            Store loc1 loc2 -> (pc+1, setMem m (getMem m (getMem m loc2)) loc1)
>	            	Beq loc1 loc2 lbl -> (if (getMem m loc1) == (getMem m loc2) then (getPC p lbl, m) else (pc+1,m))
>	            	Jump lbl -> (getPC p lbl, m)
>	            	Exit -> error "Exited"

>execute :: Program -> ProgramCounter -> Memory -> Memory
>execute p pc m =
>	case getInstr p pc of
>		Exit -> m
>		_ 	-> case oneInstr p pc m of
>				(pc1,m1) -> execute p pc1 m1

>prog1 :: Program
>prog1 = [ (Nothing, Loadi 0 14)
>		, (Nothing, Loadi 1 9)
>		, (Nothing, Addi 0 0 6)
>		, (Nothing, Sub 0 0 1)
>		, (Nothing, Jump "End")
>		, (Nothing, Sub 0 0 1)
>		, (Just "End", Exit) ]

>prog2 :: Program
>prog2 = [ (Nothing, Loadi 0 13)
>		, (Nothing, Loadi 1 0)
>		, (Nothing, Loadi 2 0)
>		, (Just "Lbl1", Beq 0 2 "End")
>		, (Nothing, Add 1 1 0)
>		, (Nothing, Subi 0 0 1)
>		, (Nothing, Jump "Lbl1")
>		, (Just "End", Exit) ]

Problem 18

data MyList a = Empty
>     | Node a (MyList a)
>       deriving Show

>myHead :: MyList a -> a
>myHead (Node n rest) = n

>myTail :: MyList a -> MyList a
>myTail (Node n rest) = rest

example: myFilter (\n -> n <= 11) (Node 10 (Node 2 Empty))

>myFilter :: (a->Bool) -> (MyList a) -> (MyList a)
>myFilter bool Empty = Empty
>myFilter bool list = if bool (myHead list)
>                     then Node (myHead list) (myFilter bool (myTail list))
>                     else myFilter bool (myTail list)

>myDrop :: Int -> (MyList a) -> (MyList a)
>myDrop _ Empty = Empty
>myDrop 0 list = list
>myDrop n list = myDrop (n-1) (myTail list)


PROBLEM 19

>data Tree a = Null
>	| Branch a (Tree a) (Tree a)
>	deriving Show

>nodeValues :: (Tree a) -> [a]
>nodeValues Null = []
>nodeValues (Branch x left right) = (nodeValues left) ++ [x] ++ (nodeValues right)

>treeInsert :: Tree Int -> Int -> Tree Int
>treeInsert Null v = Branch v Null Null
>treeInsert t@(Branch n ltree rtree) v
>			| v < n = Branch n (treeInsert ltree v) rtree
>			| v > n = Branch n ltree (treeInsert rtree v)
>			| otherwise = t

>growTree' :: Tree Int -> [Int] -> Tree Int
>growTree' tree [] = tree
>growTree' tree (v:vs) = growTree' (treeInsert tree v) vs

>growTree :: [Int] -> Tree Int
>growTree = growTree' Null

>sortList :: [Int] -> [Int]
>sortList [] = []
>sortList ls = nodeValues (growTree ls)

>treeMap :: (a -> Int) -> (Tree a) -> (Tree Int)
>treeMap _ Null = Null
>treeMap a tree = growTree (map a (nodeValues tree))

PROBLEM 20

>getALine :: String -> IO ()
>getALine str = do putStr str
>                  line <- getLine
>                  putStrLn line

>convert2Int :: [Char] -> Int
>convert2Int charlist = foldl multiply10 0 intlist
>	where intlist = map digitToInt charlist

>multiply10 :: Int -> Int -> Int
>multiply10 x y = 10 * x + y

>fact :: Int -> Int
>fact 0 = 1
>fact n = n * fact (n-1)

>choose :: Int -> Int -> Int
>choose n k = (div (fact n) ((fact k) * (fact (n - k))))

>iChoose :: IO()
>iChoose = do putStr "Enter 2 integers: "
>             line1 <- getLine
>             line2 <- getLine
>             let a = convert2Int line1
>             let b = convert2Int line2
>             putStrLn (show (choose a b))


PROBLEM 21

>wc :: String -> IO()
>wc file = do fullFile <- readFile file
>             let chars = length fullFile
>             let line = (length (lines fullFile)) - 1
>             let word = length (words fullFile)
>             putStrLn ((show line) ++ " " ++ (show word) ++ " " ++ (show chars) ++ " " ++ f)


Andre Amirsaleh and Daniel Toback



>import System.Exit

>import System.IO

>import Data.Char



Problem 17



>type MLoc = Int

>type Memory = [Int]

>type Program = [ (Maybe String, Instruction) ]

>type ProgramCounter = Int>data Instruction = Addi MLoc MLoc Int -- Arithmetic operations

>       | Subi MLoc MLoc Int

>       | Muli MLoc MLoc Int

>       | Add MLoc MLoc MLoc

>       | Sub MLoc MLoc MLoc

>       | Mul MLoc MLoc MLoc

>

>       | Move MLoc MLoc -- Memory

>       | Load MLoc MLoc

>       | Loadi MLoc Int

>       | Store MLoc MLoc

>

>

>       | Beq MLoc MLoc String -- Jump/Branch

>       | Jump String

>

>       | Exit -- Exit

>       deriving (Show)



>getMem :: Memory -> MLoc -> Int

>getMem (v:xs) 0 = v

>getMem (x:xs) mloc = getMem xs (mloc-1)



>setMem :: Memory -> MLoc -> Int -> Memory

>setMem (_:xs) 0 v = v : xs

>setMem (x:xs) mloc v = x : setMem xs (mloc-1) v



>getInstr :: Program -> ProgramCounter -> Instruction

>getInstr (instr:_) 0 = snd instr

>getInstr (_:xs) n = getInstr xs (n-1)



>getPC :: Program -> String -> ProgramCounter

>getPC ((Just s, instr):xs) label = if s == label then 0 else 1 + getPC xs label


>getPC ((Nothing, instr):xs) label = 1 + getPC xs label

>oneInstr :: Program -> ProgramCounter -> Memory -> (ProgramCounter, Memory)

>oneInstr p pc m =
>               case getInstr p pc of
>               Addi loc1 loc2 n -> (pc+1, setMem m loc1 ((getMem m loc2) + n))
>               Subi loc1 loc2 n -> (pc+1, setMem m loc1 ((getMem m loc2) - n))
>               Muli loc1 loc2 n -> (pc+1, setMem m loc1 ((getMem m loc2) * n))
>               Add loc1 loc2 loc3 -> (pc+1, setMem m loc1 ((getMem m loc2) + (getMem m loc3)))
>               Sub loc1 loc2 loc3 -> (pc+1, setMem m loc1 ((getMem m loc2) - (getMem m loc3)))
>               Mul loc1 loc2 loc3 -> (pc+1, setMem m loc1 ((getMem m loc2) * (getMem m loc3)))
>               Move loc1 loc2 -> (pc+1, setMem m loc1 loc2)
>               Load loc1 loc2 -> (pc+1, setMem m loc1 (getMem m (getMem m loc2)))
>               Loadi loc1 n -> (pc+1, setMem m loc1 n)
>               Store loc1 loc2 -> (pc+1, setMem m (getMem m (getMem m loc2)) loc1)
>               Beq loc1 loc2 lbl -> (if (getMem m loc1) == (getMem m loc2) then (getPC p lbl, m) else (pc+1,m))
>               Jump lbl -> (getPC p lbl, m)
>               Exit -> error "Exited"



>execute :: Program -> ProgramCounter -> Memory -> Memory

>execute p pc m =
>                 case getInstr p pc of
>                 Exit -> m
>                 _    -> case oneInstr p pc m of
>                 (pc1,m1) -> execute p pc1 m1

>prog1 :: Program
>prog1 = [ (Nothing, Loadi 0 14)
>               , (Nothing, Loadi 1 9)
>               , (Nothing, Addi 0 0 6)
>               , (Nothing, Sub 0 0 1)
>               , (Nothing, Jump "End")
>               , (Nothing, Sub 0 0 1)
>               , (Just "End", Exit) ]

>prog2 :: Program
>prog2 = [ (Nothing, Loadi 0 13)
>               , (Nothing, Loadi 1 0)
>               , (Nothing, Loadi 2 0)
>               , (Just "Lbl1", Beq 0 2 "End")
>               , (Nothing, Add 1 1 0)
>               , (Nothing, Subi 0 0 1)
>               , (Nothing, Jump "Lbl1")
>               , (Just "End", Exit) ]



Problem 18

>data MyList a = Empty
>                | Node a (MyList a)
>                deriving Show



>myHead :: MyList a -> a
>myHead (Node n rest) = n

>myTail :: MyList a -> MyList a
>myTail (Node n rest) = rest



Example: myFilter (\n -> n <= 11) (Node 10 (Node 2 Empty))



>myFilter :: (a->Bool) -> (MyList a) -> (MyList a)
>myFilter bool Empty = Empty
>myFilter bool list = if bool (myHead list)
>                     then Node (myHead list) (myFilter bool (myTail list))
>                     else myFilter bool (myTail list)

>myDrop :: Int -> (MyList a) -> (MyList a)
>myDrop _ Empty = Empty
>myDrop 0 list = list
>myDrop n list = myDrop (n-1) (myTail list)


PROBLEM 19

>data Tree a = Null
>              | Branch a (Tree a) (Tree a)
>              deriving Show

>nodeValues :: (Tree a) -> [a]
>nodeValues Null = []
>nodeValues (Branch x left right) = (nodeValues left) ++ [x] ++ (nodeValues right)

>treeInsert :: Tree Int -> Int -> Tree Int
>treeInsert Null v = Branch v Null Null
>treeInsert t@(Branch n ltree rtree) v
>                    | v < n = Branch n (treeInsert ltree v) rtree
>                    | v > n = Branch n ltree (treeInsert rtree v)
>                    | otherwise = t



>growTree' :: Tree Int -> [Int] -> Tree Int
>growTree' tree [] = tree
>growTree' tree (v:vs) = growTree' (treeInsert tree v) vs

>growTree :: [Int] -> Tree Int
>growTree = growTree' Null

>sortList :: [Int] -> [Int]
>sortList [] = []
>sortList ls = nodeValues (growTree ls)

>treeMap :: (a -> Int) -> (Tree a) -> (Tree Int)
>treeMap _ Null = Null
>treeMap a tree = growTree (map a (nodeValues tree))

PROBLEM 20

>getALine :: String -> IO ()
>getALine str = do putStr str
>                  line <- getLine
>                  putStrLn line

>convert2Int :: [Char] -> Int
>convert2Int charlist = foldl multiply10 0 intlist
>       where intlist = map digitToInt charlist

>multiply10 :: Int -> Int -> Int
>multiply10 x y = 10 * x + y

>fact :: Int -> Int
>fact 0 = 1
>fact n = n * fact (n-1)

>choose :: Int -> Int -> Int
>choose n k = (div (fact n) ((fact k) * (fact (n - k))))

>iChoose :: IO()
>iChoose = do putStr "Enter 2 integers: "
>             line1 <- getLine
>             line2 <- getLine
>             let a = convert2Int line1
>             let b = convert2Int line2
>             putStrLn (show (choose a b))

PROBLEM 21

>wc :: String -> IO()
>wc file = do fullFile <- readFile file
>             let chars = length fullFile
>             let line = (length (lines fullFile)) - 1
>             let word = length (words fullFile)
>             putStrLn ((show line) ++ " " ++ (show word) ++ " " ++ (show chars) ++ " " ++ file)

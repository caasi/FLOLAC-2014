-- {-# LANGUAGE ScopedTypeVariables #-}

twice :: (a -> a) -> (a -> a)
twice f = f . f

square :: Int -> Int
square x = x * x

quad :: Int -> Int
quad = twice square

smaller :: Int -> Int -> Int
smaller x y = if x <= y then x else y

st3 :: Int -> Int
st3 = smaller 3

infinity :: Int
infinity  = infinity + 1

-- Functions

-- 1.
three :: Int -> Int
three x = 3

even' :: Int -> Bool
even' x = mod x 2 == 0

-- 2.
carea :: Double -> Double
carea r = 22 / 7 * r * r

-- 6.
f :: Int -> Char
f = undefined

g :: Int -> Char -> Int
g = undefined

h :: (Char -> Int) -> Int -> Int
h = undefined

x :: Int
x = undefined

y :: Int
y = undefined

c :: Char
c = undefined

-- Products and Sums

-- 2.
swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)

swap' :: (a, b) -> (b, a)
swap' t = (snd t, fst t)

swap'' :: (a, b) -> (b, a)
swap'' = \x -> case x of (a, b) -> (b, a)

swap''' :: (a, b) -> (b, a)
swap''' = \(a, b) -> (b, a)

-- 3.
half :: Int -> Either Int Int
half x
  | even x = Left h
  | otherwise = Right (h + 1)
  where
    h = div x 2

-- 4.
either' :: (t0 -> t) -> (t1 -> t) -> Either t0 t1 -> t
either' i j k = case k of
                  Left l  -> i l
                  Right m -> j m

-- Inductively Defined Functions on Lists

-- 1.
fstEven :: [Int] -> Int
fstEven l
  | null l        = error "not found"
  | even (head l) = head l
  | otherwise     = fstEven (tail l)

-- 2.
hasZero :: [Int] -> Bool
hasZero l
  | null l      = error "not found"
  | head l == 0 = True
  | otherwise   = hasZero (tail l)

-- 3.
last' :: [a] -> Maybe a
last' l
  | null l        = Nothing
  | null (tail l) = Just (head l)
  | otherwise     = last' (tail l)

last'' :: (Eq a) => [a] -> Maybe a
last'' l
  | l == []      = Nothing
  | tail l == [] = Just (head l)
  | otherwise    = last'' (tail l)

-- 4.
pos :: (Eq a) => a -> [a] -> Int
pos x []     = minBound::Int
pos y (x:xs) = if x == y then 0 else 1 + pos y xs

pos' :: (Eq a) => a -> [a] -> Maybe Int
pos' x []     = Nothing
pos' y (x:xs)
  | x == y    = Just 0
  | otherwise = do n <- pos' y xs
                   return (1 + n)

-- 5.
concat' :: [[a]] -> [a]
concat' []     = []
concat' (x:xs) = x ++ concat' xs

-- 6.
double :: [a] -> [a]
double []     = []
double (x:xs) = [x, x] ++ double xs

-- 7.
interleave :: [a] -> [a] -> [a]
interleave [] []         = []
interleave [] x          = x
interleave x []          = x
interleave (x:xs) (y:ys) = [x, y] ++ interleave xs ys

-- 8.
splitLR :: [Either a b] -> ([a], [b])
splitLR []      = ([], [])
splitLR (x:xs)  = either f g x
  where
    f = \x -> (x : fst splitted, snd splitted)
    g = \x -> (fst splitted, x : snd splitted)
    splitted = splitLR xs

-- 9.
fan :: a -> [a] -> [[a]]
fan x []     = [[x]]
fan x l@(y:ys) = (x : l) : map (y:) (fan x ys)

-- 10.
perms :: [a] -> [[a]]
perms []     = [[]]
perms (x:xs) = foldl1 (++) (map (\ys -> fan x ys) (perms xs))

-- 11.
inits :: [a] -> [[a]]
inits []   = [[]]
inits list = inits (init list) ++ [list]

tails :: [a] -> [[a]]
tails [] = [[]]
tails l@(x:xs) = l : tails xs

-- Inductively Defined Functions on Natural Numbers

-- 1.
mul :: Int -> Int -> Int
mul x 0 = 0
mul x y = x + mul x (y - 1)

-- 2.
min' :: Int -> Int -> Int
min' x 0 = 0
min' 0 x = 0
min' x y = 1 + min' (x - 1) (y - 1)

-- 3.
elemAt :: Int -> [a] -> a
elemAt x []     = error "index too large"
elemAt 0 (y:ys) = y
elemAt x (y:ys) = elemAt (x - 1) ys

-- 4.
insertAt :: Int -> a -> [a] -> [a]
insertAt x y []     = [y]
insertAt 0 y ys     = y : ys
insertAt x y (z:zs) = z : insertAt (x - 1) y zs

-- User-Defined Inductive Datatypes

-- 1.
data ETree a = Tip a | Bin (ETree a) (ETree a)

etree = (Bin (Tip 6)
            (Bin (Tip 4)
                 (Tip 2)))

minET :: (Ord a) => ETree a -> a
minET (Tip x)   = x
minET (Bin l r) = min (minET l) (minET r)

-- 2.
data Tree a = Null | Node a (Tree a) (Tree a)

tree = (Node 4 (Node 2 (Node 1 Null Null)
                       (Node 3 Null Null))
               (Node 6 (Node 5 Null Null)
                       (Node 7 Null Null)))

minT :: (Ord a) => Tree a -> a
minT (Node m Null Null) = m
minT (Node m    l Null) = min m (minT l)
minT (Node m Null    r) = min m (minT r)
minT (Node m    l    r) = min m (min (minT l) (minT r))

-- 3.
mapT :: (a -> b) -> Tree a -> Tree b
mapT f Null         = Null
mapT f (Node m l r) = Node (f m) (mapT f l) (mapT f r)

-- 4.
flatten :: Tree a -> [a]
flatten Null         = []
flatten (Node m l r) = flatten l ++ [m] ++ flatten r

-- 5.
memberT :: (Ord a) => a -> Tree a -> Bool
memberT x Null         = False
memberT x (Node m l r)
  | x == m    = True
  | x < m     = memberT x l
  | x > m     = memberT x r

insertT :: (Ord a) => a -> Tree a -> Tree a
insertT x Null = Node x Null Null
insertT x (Node m l r)
  | x == m = Node m l r
  | x < m  = Node m (insertT x l) r
  | x > m  = Node m l (insertT x r)

-- SKI
s :: a -> a
s = \x -> x

k :: a -> b -> a
k = \x y -> x

i :: (a -> b -> c) -> (a -> b) -> a -> c
i = \f g x -> f x (g x)


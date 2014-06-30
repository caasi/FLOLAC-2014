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

three :: Int -> Int
three x = 3

even' :: Int -> Bool
even' x = mod x 2 == 0

carea :: Double -> Double
carea r = 22 / 7 * r * r


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

swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)

swap' :: (a, b) -> (b, a)
swap' t = (snd t, fst t)

swap'' :: (a, b) -> (b, a)
swap'' = \x -> case x of (a, b) -> (b, a)

swap''' :: (a, b) -> (b, a)
swap''' = \(a, b) -> (b, a)

half :: Int -> Either Int Int
half x
  | even x = Left h
  | otherwise = Right (h + 1)
  where
    h = div x 2

either' :: (t0 -> t) -> (t1 -> t) -> Either t0 t1 -> t
either' i j k = case k of
                  Left l  -> i l
                  Right m -> j m

fstEven :: [Int] -> Int
fstEven l
  | null l        = error "not found"
  | even (head l) = head l
  | otherwise     = fstEven (tail l)

hasZero :: [Int] -> Bool
hasZero l
  | null l      = error "not found"
  | head l == 0 = True
  | otherwise   = hasZero (tail l)

last' :: [a] -> Maybe a
last' l
  | null l        = Nothing
  | null (tail l) = Just (head l)
  | otherwise     = last' (tail l)

-- why a have to be a member of Eq?
last'' :: (Eq a) => [a] -> Maybe a
last'' l
  | l == []      = Nothing
  | tail l == [] = Just (head l)
  | otherwise    = last'' (tail l)

pos :: (Eq a) => a -> [a] -> Int
pos x []     = minBound::Int
pos y (x:xs) = if x == y then 0 else 1 + pos y xs

pos' :: (Eq a) => a -> [a] -> Maybe Int
pos' x []     = Nothing
pos' y (x:xs)
  | x == y    = Just 0
  | otherwise = do n <- pos' y xs
                   return (1 + n)

concat' :: [[a]] -> [a]
concat' []     = []
concat' (x:xs) = x ++ concat' xs

double :: [a] -> [a]
double []     = []
double (x:xs) = [x, x] ++ double xs

interleave :: [a] -> [a] -> [a]
interleave [] []         = []
interleave [] x          = x
interleave x []          = x
interleave (x:xs) (y:ys) = [x, y] ++ interleave xs ys

splitLR :: [Either a b] -> ([a], [b])
splitLR []      = ([], [])
splitLR (x:xs)  = either f g x
  where
    f = \x -> (x : fst splitted, snd splitted)
    g = \x -> (fst splitted, x : snd splitted)
    splitted = splitLR xs

fan :: a -> [a] -> [[a]]
fan x []     = [[x]]
fan x l@(y:ys) = (x : l) : map (y:) (fan x ys)

perms :: [a] -> [[a]]
perms []     = [[]]
perms (x:xs) = foldl1 (++) (map (\ys -> fan x ys) (perms xs))

inits :: [a] -> [[a]]
inits []   = [[]]
inits list = inits (init list) ++ [list]

tails :: [a] -> [[a]]
tails [] = [[]]
tails l@(x:xs) = l : tails xs

-- SKI
s :: a -> a
s = \x -> x

k :: a -> b -> a
k = \x y -> x

i :: (a -> b -> c) -> (a -> b) -> a -> c
i = \f g x -> f x (g x)


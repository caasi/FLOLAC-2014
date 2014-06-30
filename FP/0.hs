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

pos :: Eq a => a -> [a] -> Int
pos = undefined

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

-- SKI
s :: a -> a
s = \x -> x

k :: a -> b -> a
k = \x y -> x

i :: (a -> b -> c) -> (a -> b) -> a -> c
i = \f g x -> f x (g x)


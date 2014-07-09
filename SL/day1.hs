paren :: String -> String
paren s = "(" ++ s ++ ")"

type ExprAlg a = (Integer -> a, a -> a -> a)
type ExprS a = ExprAlg a -> a
val :: Integer            ->ExprS a
val n = \(f, g) -> f n
add :: ExprS a -> ExprS a -> ExprS a
add x y = \(f, g) -> g (x (f, g)) (y (f, g))

e :: ExprS a
e = add (val 3) (add (val 4) (val 5))

evalAlg :: ExprAlg Integer
evalAlg = (id, (+))

printAlg :: ExprAlg String
printAlg = (show, \s t -> paren (s ++ "+" ++ t))


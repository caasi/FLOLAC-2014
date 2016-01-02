{-# LANGUAGE KindSignatures, GADTs #-}

data Grammar String :: * where
  Empty  :: Grammar String
  Unit   :: Grammar String
  Single :: Char -> Grammar String
  Conc   :: Grammar String -> Grammar String -> Grammar String
  Union  :: Grammar String -> Grammar String -> Grammar String

eval :: Grammar String -> String
eval (Empty)                 = []
eval (Unit)                  = ""
eval (Single c)              = [c]
eval Conc (Grammar s) (Grammar t)  = s ++ t
eval Union (Grammar s) (Grammar t) = undefined


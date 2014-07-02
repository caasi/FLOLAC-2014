module lambda where

--------------------------------------------
--                                        --
--        Type Structure Experiment       --
--                                        --
--------------------------------------------
-- reference: http://en.wikipedia.org/wiki/Lambda_calculus

data ⊤ : Set where
  tt : ⊤

-- can i say ℕ is (⊤ → ⊤) → ⊤ → ⊤ ?
zero : (⊤ → ⊤) → ⊤ → ⊤
zero f x = x

-- ℕ → ℕ
succ : ((⊤ → ⊤) → ⊤ → ⊤) → (⊤ → ⊤) → ⊤ → ⊤
succ n f x = f (n f x)

-- ℕ → ℕ → ℕ
plus : ((⊤ → ⊤) → ⊤ → ⊤) → ((⊤ → ⊤) → ⊤ → ⊤) → (⊤ → ⊤) → ⊤ → ⊤
plus m n f x = m f (n f x)

-- ℕ → ℕ → ℕ
mult : ((⊤ → ⊤) → ⊤ → ⊤) → ((⊤ → ⊤) → ⊤ → ⊤) → (⊤ → ⊤) → ⊤ → ⊤
mult m n f = m (n f)

-- fail, ℕ isn't (⊤ → ⊤) → ⊤ → ⊤
pow : ⊤ → (⊤ → ⊤) → ⊤
pow b e = e b

true : ⊤ → ⊤ → ⊤
true x y = x

false : ⊤ → ⊤ → ⊤
false x y = y

-- don't know how to construct 'and', 'or' without apply their own variables
pair : ⊤ → ⊤ → (⊤ → ⊤ → ⊤) → ⊤
pair x y f = f x y

first : ((⊤ → ⊤ → ⊤) → ⊤) → ⊤
first p = p true

second : ((⊤ → ⊤ → ⊤) → ⊤) → ⊤
second p = p false

nil : ⊤ → (⊤ → ⊤ → ⊤)
nil x = true

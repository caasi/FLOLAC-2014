module lambda where

--------------------------------------------
--                                        --
--        Type Structure Experiment       --
--                                        --
--------------------------------------------
-- reference: http://en.wikipedia.org/wiki/Lambda_calculus

-- More hints and information from Dr. Shin-Cheng Mu(scm):
  -- Church encoding / Church numeral
    -- reference http://en.wikipedia.org/wiki/Church_numeral
    -- type Church a = (a -> a) -> a -> a
  -- polymorphic lambda calculus

data ⊤ : Set where
  tt : ⊤

-- scm:
  -- ∀ {a} → (a → a) → a → a
  -- newtype ℕ = N (∀ a . (a -> a) -> (a -> a)) in Haskell

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

-- scm:
  -- ∀ a . a → a
  -- ∀ a . a → a → a

true : ⊤ → ⊤ → ⊤
true x y = x

false : ⊤ → ⊤ → ⊤
false x y = y


-- don't know how to construct 'and', 'or' without apply their own variables

-- scm:
  -- Pair A B = ∀ {c} → (A → B → c) → c

pair : ⊤ → ⊤ → (⊤ → ⊤ → ⊤) → ⊤
pair x y f = f x y

first : ((⊤ → ⊤ → ⊤) → ⊤) → ⊤
first p = p true

second : ((⊤ → ⊤ → ⊤) → ⊤) → ⊤
second p = p false

nil : ⊤ → (⊤ → ⊤ → ⊤)
nil x = true

-- scm:
  -- A + B = ∀ {c} → (A → c) → (B → c) → c

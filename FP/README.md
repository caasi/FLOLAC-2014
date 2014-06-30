# 函數編程 / Functional Programming

講者：[穆信成 Shin-Cheng Mu](http://www.iis.sinica.edu.tw/~scm/)
投影片：http://www.slideshare.net/funthr/functional-programming-36452166

## Notes

*   Int -> (Int -> Int) 這樣寫真的比較幫助我理解。
*   Parametric Polymorphic Types: 一定範圍內的 types 都適用這個演算法。
*   Ad-Hoc Polymorphism
*   SKI combinator calculus
    *   s = \x -> x :: a -> a
    *   k = \x y -> x :: a -> b -> a
    *   i = \f g x -> f x (g x) :: (a -> b -> c) -> (a -> b) -> a -> c


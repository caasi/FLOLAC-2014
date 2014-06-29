# 內嵌式領域特定語言 / Special Lecture: Embedded Domain-Specific Languages

講者:[Jeremy Gibbons](http://www.cs.ox.ac.uk/jeremy.gibbons/)

本屆 FLOLAC 除了以 Haskell 介紹基礎的函數編程 (functional programming), 還特別邀請到牛津大學 Jeremy Gibbons 教授介紹函數編程於「領域特定語言」(domain-specific languages) 的應用。

領域特定語言常對比於「泛用型語言」(general-purpose languages)：一般提到的程式語言如 Haskell, C/C++, Python 等皆屬後者，設計原則是達成豐富的表達能力，以求在同一語言內能寫出各式各樣的程式；領域特定語言則是聚焦於一個特定應用領域並為其設計專門語法，藉以更精準地捕捉專屬該領域的概念與慣用技巧和提供專門支援，一個重要例子是 parser generators 如 yacc 所接受的文法定義。

yacc 所接受的文法是完全獨立的語言，需要獨立程式處理，使得 yacc 和一般泛用型語言接軌的成本較高；相對比，函數編程能便利地處理具遞迴結構的資料，又提供絕佳的抽象能力，於是我們能非常輕鬆地直接在函數式語言內定義、使用領域特定語言。一個著名的用例是 parser combinators, 文法片段不僅能直接以 Haskell 自然寫出，本身還是可進一步任意操作的一級物件 (first-class objects).

Gibbons 教授將在課堂上講解領域特定語言的基礎概念，並帶領大家以 Haskell 實作 parser combinators 和 SVG 繪圖等領域特定語言。


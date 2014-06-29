# 操作語意 / Operational Semantics

講者:[陳亮廷 Liang-Ting Chen](http://www.iis.sinica.edu.tw/pages/lxc/)

Introduction to semantics of functional programming

兩年前我們提到 CompCert 這個計劃，用 Coq 證明輔助系統（其理論基礎乃衍生自直構型別論）實作一個 C 編譯器（支援絕大部分的 C89）並完整證明輸入的 C 程式和編譯出的 PowerPC 組合語言程式語意相同。C 的語意由 C 標準書所規範，但 C 標準書的英文敘述無法作為嚴格證明的對象 — 只有將語意型式化才可能完整證明其性質。本次 FLOLAC 介紹函數程式的兩種型式語意：操作語意和指稱語意。前者制定一套符號推演規則，嚴謹地定義函數程式如何一步步運行、計算出結果；後者則是將函數程式詮釋為數學上適當意義的連續函數，除寫法簡潔外更揭露計算與拓樸連續性的優雅關聯。命令式語言的語意是改變機器狀態，和函數程式語意相比較為複雜，但操作語意或指稱語意經些許調整即足以描述命令式語言的語意 — CompCert 選用的是較方便撰寫型式證明的操作語意。如果你覺得 C/C++ 標準書不僅冗長又漏洞百出，請不要錯過這次的型式語意學，了解如何精簡定義語意、甚至證明語言的安全性質。

## Outline

1.  PCF and its operational semantics [handout][0] [slides][1]
    *   Syntax and typing rules for PCF
    *   Small-step and big-step semantics
    *   Type safety
1.  Relating denotational and operational semantics [handout][2] [slides][3]
    *   Correctness
    *   Computational adequacy
    *   Compactness
    *   Fixed point induction
1.  Formalisation of PCF [exercise][4]
    *   Formalising syntax and typing rules
    *   Extracting an interpreter of PCF

[0]: https://github.com/xcycl/FLOLAC-semantics/blob/master/pdf/lecture1_note.pdf
[1]: https://github.com/xcycl/FLOLAC-semantics/blob/master/pdf/lecture1_slide.pdf
[2]: https://github.com/xcycl/FLOLAC-semantics/blob/master/pdf/lecture4_note.pdf
[3]: https://github.com/xcycl/FLOLAC-semantics/blob/master/pdf/lecture4_slide.pdf
[4]: https://github.com/xcycl/PCF-Nominal/blob/exercise/PCF_blank.agda

## Reference

*   Robert Harper. [Practical Foundations for Programming Languages][5]. Cambridge University Press, 2012.
*   Thomas Streicher. [Domain-Theoretic Foundations of Functional Programming][6]. World Scientific, 2006
*   Benjamin C. Pierce. Types and Programming Languages. MIT Press, 2002.

[5]: http://www.cs.cmu.edu/~rwh/plbook/book.pdf
[6]: http://www.mathematik.tu-darmstadt.de/~streicher/MGFP/MGFP.pdf.gz


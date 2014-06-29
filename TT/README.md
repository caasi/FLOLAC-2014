# 型別論與邏輯 / Type Theory and Logic

講者：[柯向上 Hsiang-Shang Ko](http://www.cs.ox.ac.uk/people/hsiang-shang.ko/)

資訊系學生常問的一個問題是學習數學 — 特別是數學證明 — 對寫程式有什麼幫助，答案不外乎是特定領域（如機器學習、訊號處理等）會用到，或是較為模糊的「訓練邏輯思考」。第二個答案其實有完全精確的版本，無需模糊帶過：寫程式和寫證明完全是同一件事！

不過，在給這個答案之前，我們必須切換到另一個對數學本質的看法。古典數學 (classical mathematics) 的看法是數學物件獨立於人類心智存在，構成一個理型世界；數學家如同記者，工作是報導那個世界的實況。另一方面，直構數學 (intuitionistic mathematics) 認為數學物件 — 包括證明 — 是人類心智的主觀產物，而非客觀存在；數學家如同作家，工作是以心智構築出數學理論。直構觀點下，由於數學純粹是人類心智的活動（無涉理型），故構造出的數學物件必須符合「人類心智感知之先天條件」。這個神秘條件到了近代 — 特別因為計算機的發明與普及 — 終於能夠簡單且具體地解釋：直構數學的產物必須有計算意義。換句話說，直構數學家的工作本質正是程式編寫。

傳統的數理邏輯系統源於古典數學，多忽略計算意義；另一方面，一般程式語言的表達能力不夠細緻，遠不足以描述常見數學構造的精密性質。瑞典邏輯學家 Per Martin-Löf 於是在 ’70 年代設計出直構型別論 (intuitionistic type theory) 作為直構數學的邏輯基礎，至今其理論延伸和應用均仍蓬勃發展中。本次 FLOLAC 首度專課介紹型別論如何融合數理邏輯之性質表達能力以及函數編程之計算模型，並另有專課介紹以型別論為基礎的新一代函數編程（請待下回分解）。

回到最先問題：學習數學證明對寫程式有幫助嗎？我們的答案是：顯然有，因為閱讀證明就是研究數學家歷經數千年去蕪存菁的程式庫，而習寫證明則是練習在更全面的語意考量下編寫程式。一言以蔽之：資訊系學生應該多修點數學系的課（無誤）。

## Outline

1.  Simple type theory ([slides][0])
    *   Propositions as types
    *   Sets, (typing) judgements, and derivations
    *   Propositional set formers
    *   Intuitionism and computability
1.  Dependent type theory ([slides][1], [Russell.agda][2], [RussellC.agda][3])
    *   Dependent products and sums
    *   Universe hierarchy
    *   Computation and equality judgements
    *   Classical vs intuitionistic logic
1.  Natural number arithmetic ([slides][4], [NatArith.agda][5], [NatArithC.agda][6])
    *   Set of natural numbers
    *   Identity types
    *   Peano axioms and algebraic properties
1.  Meta-theoretical reasoning ([slides][7], [Implicational.agda][8], [ImplicationalC.agda][9])
    *   Meta-language vs object language
    *   The Curry–Howard isomorphism
    *   Two-valued semantics of propositional logic
    *   Soundness and completeness

[0]: https://github.com/josh-hs-ko/FLOLAC-14/blob/master/lecture_1.pdf
[1]: https://github.com/josh-hs-ko/FLOLAC-14/blob/master/lecture_2.pdf
[2]: https://github.com/josh-hs-ko/FLOLAC-14/blob/master/Russell.agda
[3]: https://github.com/josh-hs-ko/FLOLAC-14/blob/master/RussellC.agda
[4]: https://github.com/josh-hs-ko/FLOLAC-14/blob/master/lecture_3.pdf
[5]: https://github.com/josh-hs-ko/FLOLAC-14/blob/master/NatArith.agda
[6]: https://github.com/josh-hs-ko/FLOLAC-14/blob/master/NatArithC.agda
[7]: https://github.com/josh-hs-ko/FLOLAC-14/blob/master/lecture_4.pdf
[8]: https://github.com/josh-hs-ko/FLOLAC-14/blob/master/Implicational.agda
[9]: https://github.com/josh-hs-ko/FLOLAC-14/blob/master/ImplicationalC.agda

## References


*   Nicolaas Govert de Bruijn. Type-theoretical checking and philosophy of mathematics. [In Twenty-Five Years of Constructive Type Theory][10], pages 41–56. Clarendon Press, 1998.
*   Michael Dummett. [Elements of Intuitionism][11]. Oxford University Press, second edition, 2000.
*   Georges Gonthier. [Formal proof — the four-color theorem][12]. Notices of the AMS, 55(11):1382–1393, 2008.
*   Robert Harper. [Practical Foundations for Programming Languages][13]. Cambridge University Press, 2012.
*   Arend Heyting. [Intuitionism: An Introduction][14]. Amsterdam: North-Holland Publishing, third revised edition, 1971.
*   Per Martin-Löf. [Intuitionistic Type Theory][15]. Bibliopolis, Napoli, 1984.
*   Per Martin-Löf. [Constructive mathematics and computer programming][16]. Philosophical Transactions of the Royal Society of London, 312(1522):501–518, 1984.
*   Per Martin-Löf. [Truth of a proposition, evidence of a judgement, validity of a proof][17]. Synthese, 73(3):407–420, 1987.
*   Zhaohui Luo. [Computation and Reasoning: A Type Theory for Computer Science][18]. Clarendon Press, 1994.
*   Bengt Nordström, Kent Peterson, and Jan M. Smith. [Programming in Martin-Löf’s Type Theory: An Introduction][19]. Oxford University Press, 1990.

[10]: http://books.google.com.tw/books?id=3fAFl9zpYe4C
[11]: http://books.google.com/books?id=bz7onQEACAAJ
[12]: http://www.ams.org/notices/200811/tx081101382p.pdf
[13]: http://www.cs.cmu.edu/~rwh/plbook/book.pdf
[14]: http://books.google.com/books?id=qfp_-Fo9yWMC
[15]: http://www.csie.ntu.edu.tw/~b94087/ITT.pdf
[16]: http://rsta.royalsocietypublishing.org/content/312/1522/501
[17]: http://link.springer.com/article/10.1007/BF00484985
[18]: http://books.google.com.tw/books?id=z3uicYzJR1MC
[19]: http://books.google.com.tw/books?id=mZhQAAAAMAAJ



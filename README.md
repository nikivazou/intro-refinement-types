README
======

This repository has the materials for a 25 minute talk on Refinement Types,
with [LiquidHaskell](https://github.com/ucsd-progsys/liquidhaskell).

For longer versions, you may be interested in:

+ [2 Hr Workshop](http://ucsd-progsys.github.io/lh-workshop/)
+ [Tutorial](http://ucsd-progsys.github.io/liquidhaskell-tutorial/)


Running LiquidHaskell
---------------------

1. [Try Online][online]
2. [VM Image][]
3. [Build Locally][local]

[online]: (http://ucsd-progsys.github.io/intro-refinement-types)
[local]:(https://github.com/ucsd-progsys/liquidhaskell-tutorial/blob/master/src/01-intro.lhs#L170-L197)
[vm]: http://goto.ucsd.edu/~gridaphobe/LiquidHaskell.ova

Virtual Machine
---------------

This is also very easy, if you can manage the 2Gb download.

**Step 1** Download [this VM image][vm]

**Step 2** Choose your editor. For *emacs* do:

       tar -zxvf liquid-emacs.tgz

and for *Spacemacs* (a great Vim-Emacs hybrid) do:

       tar -zxvf liquid-spacemacs.tgz

**Step 3** Grab the source files from Github.

Build Slides
------------

To build rust-style html (in dist/_site)

     $ stack exec -- make html

To build reveal.js slides (in dist/_slides)

     $ stack exec -- make slides

Edit Slides
-----------

You can modify the following parameters:

1. **Server URL**: change `liquidserver` in `assets/templates/preamble.lhs`
2. **MathJax URL**: change the relevant link in `assets/templates/pagemeta.template`
3. **Talk**: change the `TALK` field in the `Makefile` which builds the src-$(TALK) directory.

Outline [25]
-------

+ 01-intro         [3]
+ 02-refinements   [6]
+ 03-examples      [9]
+ 04-abstracting   [4]
+ 05-concl         [3]

Outline [120]
-------------

0. Hack in "random access" else really silly
1. Choose subset from below
2. Add snippets of termination, reflection, synthesis to 01-index

+ 01-index
+ 02-refinements
+ 03-datatypes
+ 04-case-study-insertsort
+ 05-case-study-eval
+ 06-case-study-bytestring

+ 07-abstract-refinements
+ 08-bounded-refinements
+ 09-termination
+ 10-abstract-refinements  [see 07]
+ 11-bounded-refinements   [see 08]
+ 12-refinement-reflection
+ 13-structural-induction
+ 14-map-reduce
+ 15-security
+ Tagged.lhs


Misc Links
----------

WBL Heaps

+ [HS+DT proof](https://github.com/jstolarek/dep-typed-wbl-heaps-hs/blob/master/src/TwoPassMerge/CombinedProofs.hs#L68)
+ [HS](https://github.com/jstolarek/dep-typed-wbl-heaps-hs/blob/master/src/TwoPassMerge/NoProofs.hs#L96)
+ [HS+Liquid](https://github.com/ucsd-progsys/liquidhaskell/blob/master/tests/pos/WBL.hs#L129)

Insert Sort

+ https://github.com/davidfstr/idris-insertion-sort/tree/master
+ http://www.enseignement.polytechnique.fr/informatique/INF551/TD/TD5/aux/Insert_Sort.v
+ https://github.com/goldfirere/singletons/blob/master/tests/compile-and-dump/InsertionSort/InsertionSortImp.hs

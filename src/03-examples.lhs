<div class="hidden">
\begin{code}
{-@ LIQUID "--no-termination" @-}
{-@ LIQUID "--short-names"    @-}

module IntroToRefinementTypes
       ( sum
       , sum'
       -- , sumHO
       -- , average
       -- , insertSort
       )
       where

import Prelude hiding (foldr, map, sum, length, (!))

data Vector a


at   :: Vector a -> Int -> a
at = undefined

size :: Vector a -> Int
size = undefined
\end{code}
</div>

Refinement Types by Example
---------------------------

<div class="mybreak"><br></div>

Specifications

Verification

Inference

Collections & HOFs

Invariants & Datatypes

Refinement Types by Example
---------------------------

<div class="mybreak"><br></div>

**Specifications**

Verification

Inference

Collections & HOFs

Invariants & Datatypes


Refinement Types by Example
---------------------------

<div class="mybreak"><br></div>

Specifications

<div class="mybreak"><br></div>

**Property: In-bounds Array Access**

Refinement Types by Example
---------------------------

<div class="mybreak"><br></div>

Specifications

<div class="mybreak"><br></div>

**Property: In-bounds Array Access**

\begin{code}
{-@ measure vlen :: Vector a -> Int @-}
\end{code}

Specifications: Pre-Conditions
------------------------------

<div class="mybreak"><br></div>

What does a function **require** for correct execution?

<div class="mybreak"><br></div>

\begin{code}
{-@ at :: v:Vector a -> {i:Nat| i < vlen v} -> a @-}
\end{code}

<div class="mybreak"><br></div>

Refinement on the function's **input type**


Specifications: Post-Conditions
-------------------------------

<div class="mybreak"><br></div>

What does a function **ensure** about its result?

<div class="mybreak"><br></div>

\begin{code}
{-@ size :: v:Vector a -> {n:Int | n == vlen v} @-}
\end{code}

<div class="mybreak"><br></div>

Refinement on the function's **output type**

Refinement Types by Example
---------------------------

<div class="mybreak"><br></div>

Specifications

**Verification**

Inference

Collections & HOFs

Invariants & Datatypes

Verification: Vector Sum
------------------------

<div class="mybreak"><br></div>

\begin{code}
sum :: Vector Int -> Int
sum v = loop 0
  where
    {-@ loop :: Nat -> Int @-}
    loop i
      | i <= size v = at v i + loop (i + 1)
      | otherwise   = 0
\end{code}

<div class="mybreak"><br></div>

Oops! What gives?

Verification: Vector Sum
------------------------

<img src="img/sum-code-numbers.png" height=150px>

Verification: Vector Sum
------------------------

<img src="img/sum-code-numbers.png" height=150px>

**Verification Conditions**

$$\begin{array}{lll}
\True
  & \Rightarrow v = 0
  & \Rightarrow 0 \leq v
  & \mbox{(A)} \\
0 \leq i \wedge n = \mathit{vlen}\ v \wedge i < n
  & \Rightarrow v = i + 1
  & \Rightarrow 0 \leq v
  & \mbox{(B)} \\
0 \leq i \wedge n = \mathit{vlen}\ v \wedge i < n
  & \Rightarrow v = i
  & \Rightarrow 0 \leq v < \mathit{vlen}\ v
  & \mbox{(C)} \\
\end{array}$$


Refinement Types by Example
---------------------------

<div class="mybreak"><br></div>

Specifications

Verification

**Inference**

Collections & HOFs

Invariants & Datatypes

Inference
---------

<br>

    The more interesting your types get,
    the less fun it is to write them down.
                       -- Benjamin Pierce

Inference: Vector Sum
----------------------

<div class="mybreak"><br></div>

\begin{code}
sum' :: Vector Int -> Int
sum' v = loop 0
  where
    {-@ loop :: _ -> _ @-}
    loop i
      | i < size v = at v i + loop (i + 1)
      | otherwise  = 0
\end{code}


Inference: Vector Sum
---------------------

<br>

Not magic, just **Abstract Interpretation**

Inference: Vector Sum [[PLDI 2008]][pldi08]
---------------------

<br>

Not magic, just Abstract Interpretation

Represent **unknown refinements** with $\kvar{}$ variables ...

... Solve resulting **Horn Constraints**

Inference: Vector Sum [[PLDI 2008]][pldi08]
---------------------

<img src="img/sum-code-numbers.png" height=150px>

**Horn Constraints**

$$\begin{array}{lll}
\True
  & \Rightarrow v = 0
  & \Rightarrow \kvar{}(v)
  & \mbox{(A)} \\
\kvar{}(i) \wedge n = \mathit{vlen}\ v \wedge i < n
  & \Rightarrow v = i + 1
  & \Rightarrow \kvar{}(v)
  & \mbox{(B)} \\
\kvar{}(i) \wedge n = \mathit{vlen}\ v \wedge i < n
  & \Rightarrow v = i
  & \Rightarrow 0 \leq v < \mathit{vlen}\ v
  & \mbox{(C)} \\
\end{array}$$



[pldi08]: http://dl.acm.org/citation.cfm?id=1375602

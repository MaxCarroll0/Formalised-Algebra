module ChapterI.S1NaiveSetTheory.Exercises.ExerciseOneTwo where

open import Level using (Level; zero)
open import Data.Product using (Σ; _,_)
open import Relation.Binary.Core using (Rel)

-- Basic preamble for Exercise 1.2.
-- Goal: show that equivalence classes form a partition.

infix 4 _≈_

postulate
  S : Set
  _≈_ : Rel S zero

record IsEquivalence : Set where
  field
    refl  : ∀ {x} → x ≈ x
    sym   : ∀ {x y} → x ≈ y → y ≈ x
    trans : ∀ {x y z} → x ≈ y → y ≈ z → x ≈ z

-- A subset of S.
Pred : Set → Set₁
Pred A = A → Set

-- Membership notation for subsets.
_∈_ : ∀ {A : Set} → A → Pred A → Set
x ∈ P = P x

-- The equivalence class of a point.
[_] : S → Pred S
[ a ] b = b ≈ a

-- The family of all equivalence classes.
Classes : S → Pred S
Classes = [_]

record IsPartition (P : S → Pred S) : Set₁ where
  field
    nonempty : ∀ a → Σ S (λ x → x ∈ P a)
    cover    : ∀ x → Σ S (λ a → x ∈ P a)
    disjoint : ∀ {a b} → (x : S) → x ∈ P a → x ∈ P b → a ≈ b

partition-of-classes : IsEquivalence → IsPartition Classes
partition-of-classes record { refl = refl ; sym = sym ; trans = trans } .IsPartition.nonempty
  = λ a → a , refl
partition-of-classes record { refl = refl ; sym = sym ; trans = trans } .IsPartition.cover
  = λ x → x , refl
partition-of-classes record { refl = refl ; sym = sym ; trans = trans } .IsPartition.disjoint
  = λ x z → trans (sym z)

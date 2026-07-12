module Foundations.Agda.Basics where

open import Relation.Binary.PropositionalEquality using (_≡_; refl)

_∘′_ : {A B C : Set} → (B → C) → (A → B) → A → C
(g ∘′ f) x = g (f x)

∘′-assoc : {A B C D : Set} (h : C → D) (g : B → C) (f : A → B) →
           ((h ∘′ g) ∘′ f) ≡ (h ∘′ (g ∘′ f))
∘′-assoc h g f = refl

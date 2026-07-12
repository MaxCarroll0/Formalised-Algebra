universe u v

structure Category where
  Obj : Type u
  Hom : Obj → Obj → Type v
  id : (A : Obj) → Hom A A
  comp : {A B C : Obj} → Hom A B → Hom B C → Hom A C
  id_right : ∀ {A B : Obj} (f : Hom A B), comp (id A) f = f
  id_left : ∀ {A B : Obj} (f : Hom A B), comp f (id B) = f
  assoc : ∀ {A B C D : Obj} (f : Hom A B) (g : Hom B C) (h : Hom C D),
    comp f (comp g h) = comp (comp f g) h

def one : Category where
  Obj := PUnit
  Hom _ _ := PUnit
  id _ := ⟨⟩
  comp _ _ := ⟨⟩
  id_right _ := rfl
  id_left _ := rfl
  assoc _ _ _ := rfl

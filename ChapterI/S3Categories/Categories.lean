universe u v

structure SmallCategory where
  Obj : Type u
  Hom : Obj → Obj → Type v
  id : (X : Obj) → Hom X X
  comp : {X Y Z : Obj} → Hom X Y → Hom Y Z → Hom X Z
  id_comp : ∀ {X Y : Obj} (f : Hom X Y), comp (id X) f = f
  comp_id : ∀ {X Y : Obj} (f : Hom X Y), comp f (id Y) = f
  assoc : ∀ {W X Y Z : Obj} (f : Hom W X) (g : Hom X Y) (h : Hom Y Z),
    comp (comp f g) h = comp f (comp g h)

def one : SmallCategory where
  Obj := PUnit
  Hom _ _ := PUnit
  id _ := ⟨⟩
  comp _ _ := ⟨⟩
  id_comp _ := rfl
  comp_id _ := rfl
  assoc _ _ _ := rfl

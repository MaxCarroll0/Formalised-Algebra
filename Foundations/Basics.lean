universe u v w x

def compose {α : Type u} {β : Type v} {γ : Type w} (g : β → γ) (f : α → β) : α → γ :=
  fun a => g (f a)

theorem compose_assoc {α : Type u} {β : Type v} {γ : Type w} {δ : Type x}
    (h : γ → δ) (g : β → γ) (f : α → β) :
    compose (compose h g) f = compose h (compose g f) :=
  rfl

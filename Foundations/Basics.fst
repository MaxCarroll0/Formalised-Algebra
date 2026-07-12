module Basics

let compose (#a #b #c: Type) (g: b -> c) (f: a -> b) : a -> c =
  fun x -> g (f x)

let compose_assoc (#a #b #c #d: Type) (h: c -> d) (g: b -> c) (f: a -> b) (x: a)
  : Lemma (compose (compose h g) f x == compose h (compose g f) x)
  = ()

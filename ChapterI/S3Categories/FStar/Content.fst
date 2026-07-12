module Content

noeq type category = {
  obj: Type;
  hom: obj -> obj -> Type;
  id: (a: obj) -> hom a a;
  comp: (#a: obj) -> (#b: obj) -> (#c: obj) -> hom a b -> hom b c -> hom a c;
  id_right: squash (forall (a b: obj) (f: hom a b). comp (id a) f == f);
  id_left: squash (forall (a b: obj) (f: hom a b). comp f (id b) == f);
  assoc: squash (forall (a b c d: obj) (f: hom a b) (g: hom b c) (h: hom c d).
    comp f (comp g h) == comp (comp f g) h);
}

let nat_add : category = {
  obj = unit;
  hom = (fun _ _ -> nat);
  id = (fun _ -> 0);
  comp = (fun #_ #_ #_ f g -> f + g);
  id_right = ();
  id_left = ();
  assoc = ();
}

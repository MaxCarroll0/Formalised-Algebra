module Categories

noeq type one_object_category (a: Type) = {
  op: a -> a -> a;
  unit: a;
  assoc: squash (forall (f g h: a). op (op f g) h == op f (op g h));
  left_unit: squash (forall (f: a). op unit f == f);
  right_unit: squash (forall (f: a). op f unit == f);
}

let nat_add : one_object_category nat = {
  op = (fun (x y: nat) -> x + y);
  unit = 0;
  assoc = ();
  left_unit = ();
  right_unit = ();
}

let unit_unique (#a: Type) (c: one_object_category a) (e: a)
    (pf: squash (forall (f: a). c.op e f == f))
  : Lemma (e == c.unit)
  = ()

theory Basics
  imports Main
begin

text \<open>Function composition associates; the running warm-up fact for Aluffi I.2.\<close>

lemma compose_assoc: "(h \<circ> g) \<circ> f = h \<circ> (g \<circ> f)"
  by (simp add: fun_eq_iff)

end

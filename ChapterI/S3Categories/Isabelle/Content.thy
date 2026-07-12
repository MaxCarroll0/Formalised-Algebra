theory Content
  imports Main
begin

text \<open>Aluffi Definition 3.1. Morphisms live in one type \<open>'m\<close> with hom-sets
carved out as \<open>hom A B :: 'm set\<close>, so the book's disjointness clause is an
explicit assumption. Composition \<open>g \<cdot> f\<close> is the book's \<open>gf\<close>.\<close>

locale category =
  fixes hom :: "'o \<Rightarrow> 'o \<Rightarrow> 'm set"
    and ident :: "'o \<Rightarrow> 'm"
    and comp :: "'m \<Rightarrow> 'm \<Rightarrow> 'm"  (infixl \<open>\<cdot>\<close> 70)
  assumes ident_in_hom: "ident A \<in> hom A A"
    and comp_in_hom: "f \<in> hom A B \<Longrightarrow> g \<in> hom B C \<Longrightarrow> g \<cdot> f \<in> hom A C"
    and disjoint: "(A, B) \<noteq> (C, D) \<Longrightarrow> hom A B \<inter> hom C D = {}"
    and id_right: "f \<in> hom A B \<Longrightarrow> f \<cdot> ident A = f"
    and id_left: "f \<in> hom A B \<Longrightarrow> ident B \<cdot> f = f"
    and assoc: "f \<in> hom A B \<Longrightarrow> g \<in> hom B C \<Longrightarrow> h \<in> hom C D \<Longrightarrow>
                  (h \<cdot> g) \<cdot> f = h \<cdot> (g \<cdot> f)"

text \<open>Example 3.5: a monoid is a one-object category; here \<open>(nat, +, 0)\<close>
with the single object \<open>()\<close>.\<close>

interpretation nat_add:
  category "\<lambda>(_ :: unit) (_ :: unit). (UNIV :: nat set)" "\<lambda>_. (0 :: nat)" "(+)"
  by unfold_locales (auto simp: add.assoc)

end

theory Categories
  imports Main
begin

text \<open>Aluffi I.3, Example 3.5: a monoid is a one-object category. The locale
packages the operation, unit, and axioms; interpreting it at \<open>(+), 0\<close> on
naturals recovers the additive monoid.\<close>

locale one_object_category =
  fixes comp :: "'a \<Rightarrow> 'a \<Rightarrow> 'a"  (infixl \<open>\<odot>\<close> 70)
    and unit :: 'a  (\<open>\<one>\<close>)
  assumes assoc: "(f \<odot> g) \<odot> h = f \<odot> (g \<odot> h)"
    and left_unit: "\<one> \<odot> f = f"
    and right_unit: "f \<odot> \<one> = f"
begin

lemma unit_unique:
  assumes "\<And>f. e \<odot> f = f"
  shows "e = \<one>"
  by (metis assms right_unit)

end

interpretation nat_add: one_object_category "(+) :: nat \<Rightarrow> nat \<Rightarrow> nat" 0
  by unfold_locales simp_all

end

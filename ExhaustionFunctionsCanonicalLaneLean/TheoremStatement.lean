import ExhaustionFunctionsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure ExhaustionTheoremStatement where
  space : ExhaustionSpace
  exhaustionFunction : space.carrier → ℝ
  properness : Prop
  sublevelCompact : ∀ r, IsCompact {x | exhaustionFunction x ≤ r}
  lowerSemicontinuous : Prop
  exhaustionFunctionLowerSemicontinuous : lowerSemicontinuous

theorem exhaustion_theorem_statement (S : ExhaustionTheoremStatement) :
    S.exhaustionFunctionLowerSemicontinuous := by
  exact S.exhaustionFunctionLowerSemicontinuous

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
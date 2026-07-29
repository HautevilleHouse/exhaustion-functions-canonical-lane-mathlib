import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure ExhaustionFunctionPackage where
  space : Type u
  topology : TopologicalSpace space
  exhaustion : space → ℝ
  sublevelCompact : ∀ r : ℝ, IsCompact {x : space | exhaustion x ≤ r}
  properness : Prop
  lowerSemicontinuous : Prop
  propernessTerm : properness
  lowerSemicontinuousTerm : lowerSemicontinuous

structure ExhaustionFunctionEvidence (E : ExhaustionFunctionPackage) where
  sublevelCompactClosed : ∀ r : ℝ, IsCompact {x : E.space | E.exhaustion x ≤ r}
  propernessClosed : E.properness
  lowerSemicontinuousClosed : E.lowerSemicontinuous

def ExhaustionFunctionClosed (E : ExhaustionFunctionPackage) : Prop :=
  (∀ r : ℝ, IsCompact {x : E.space | E.exhaustion x ≤ r}) ∧ E.properness ∧ E.lowerSemicontinuous

theorem exhaustion_function_closed_from_evidence
    (E : ExhaustionFunctionPackage) (Ev : ExhaustionFunctionEvidence E) :
    ExhaustionFunctionClosed E := by
  exact And.intro Ev.sublevelCompactClosed (And.intro Ev.propernessClosed Ev.lowerSemicontinuousClosed)

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse

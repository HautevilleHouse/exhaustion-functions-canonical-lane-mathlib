import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure ExhaustionFunctionConstruction where
  space : Type u
  topology : TopologicalSpace space
  exhaustion : space → ℝ
  sublevelCompact : ∀ r : ℝ, IsCompact {x : space | exhaustion x ≤ r}
  properness : Prop
  lowerSemicontinuous : Prop
  propernessTerm : properness
  lowerSemicontinuousTerm : lowerSemicontinuous
  smoothness : Prop
  lipschitzConstant : ℝ
  gradientBound : Prop
  smoothnessTerm : smoothness
  lipschitzConstantTerm : lipschitzConstant > 0
  gradientBoundTerm : gradientBound

def ExhaustionFunctionConstructionClosed (C : ExhaustionFunctionConstruction) : Prop :=
  (∀ r : ℝ, IsCompact {x : C.space | C.exhaustion x ≤ r}) ∧ C.properness ∧ C.lowerSemicontinuous ∧
  C.smoothness ∧ (C.lipschitzConstant > 0) ∧ C.gradientBound

structure ExhaustionFunctionConstructionEvidence (C : ExhaustionFunctionConstruction) where
  sublevelCompactClosed : ∀ r : ℝ, IsCompact {x : C.space | C.exhaustion x ≤ r}
  propernessClosed : C.properness
  lowerSemicontinuousClosed : C.lowerSemicontinuous
  smoothnessClosed : C.smoothness
  lipschitzConstantClosed : C.lipschitzConstant > 0
  gradientBoundClosed : C.gradientBound

theorem exhaustion_function_construction_closed
    (C : ExhaustionFunctionConstruction) (Ev : ExhaustionFunctionConstructionEvidence C) :
    ExhaustionFunctionConstructionClosed C := by
  exact And.intro Ev.sublevelCompactClosed
    (And.intro Ev.propernessClosed
      (And.intro Ev.lowerSemicontinuousClosed
        (And.intro Ev.smoothnessClosed
          (And.intro Ev.lipschitzConstantClosed Ev.gradientBoundClosed))))

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse

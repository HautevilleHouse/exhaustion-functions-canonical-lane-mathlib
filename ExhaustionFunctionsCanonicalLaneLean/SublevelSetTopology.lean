import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure SublevelSetTopologyPackage {X : Type u} [TopologicalSpace X]
    (E : ExhaustionFunctionPackage) where
  sublevelSetsCompact : Prop
  sublevelSetsCompactTerm : sublevelSetsCompact
  sublevelNesting : ∀ a b : ℝ, a ≤ b → {x | E.exhaustion.f x ≤ a} ⊆ {x | E.exhaustion.f x ≤ b}
  sublevelNestingTerm : sublevelNesting

structure SublevelSetTopologyEvidence {X : Type u} [TopologicalSpace X]
    {E : ExhaustionFunctionPackage} (S : SublevelSetTopologyPackage E) where
  sublevelSetsCompactClosed : S.sublevelSetsCompact
  sublevelNestingClosed : S.sublevelNesting

def SublevelSetTopologyClosed {X : Type u} [TopologicalSpace X]
    {E : ExhaustionFunctionPackage} (S : SublevelSetTopologyPackage E) : Prop :=
  S.sublevelSetsCompact ∧ S.sublevelNesting

theorem sublevel_set_topology_closed_from_evidence
    {X : Type u} [TopologicalSpace X] {E : ExhaustionFunctionPackage}
    (S : SublevelSetTopologyPackage E) (Ev : SublevelSetTopologyEvidence S) :
    SublevelSetTopologyClosed S := by
  exact And.intro Ev.sublevelSetsCompactClosed Ev.sublevelNestingClosed

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
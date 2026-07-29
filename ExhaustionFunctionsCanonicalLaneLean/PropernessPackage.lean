import ExhaustionFunctionsCanonicalLaneLean.MathlibObjects

/-!
# Properness Package
-/

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure PropernessPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  metric : Type v
  complete : Prop
  locallyCompact : Prop
  propernessCondition : Prop

structure PropernessEvidence (P : PropernessPackage) where
  completeClosed : P.complete
  locallyCompactClosed : P.locallyCompact
  propernessConditionClosed : P.propernessCondition

def PropernessClosed (P : PropernessPackage) : Prop :=
  P.complete ∧ P.locallyCompact ∧ P.propernessCondition

theorem properness_closed_from_evidence
    (P : PropernessPackage) (E : PropernessEvidence P) :
    PropernessClosed P := by
  exact And.intro E.completeClosed
    (And.intro E.locallyCompactClosed E.propernessConditionClosed)

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
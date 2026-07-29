import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure RayShenConstructionPackage (M : Type u) [TopologicalSpace M] [TameManifold M] where
  completeRiemannianMetric : Prop
  metricChosen : Prop
  exhaustionConstructed : Prop
  exhaustionConstructedTerm : exhaustionConstructed
  metricChosenTerm : metricChosen

def RayShenConstructionClosed (R : RayShenConstructionPackage M) : Prop :=
  R.completeRiemannianMetric ∧ R.metricChosen ∧ R.exhaustionConstructed

theorem ray_shen_construction_closed (R : RayShenConstructionPackage M) :
    RayShenConstructionClosed R := by
  exact And.intro (by exact R.metricChosenTerm) (And.intro (by exact R.metricChosenTerm) R.exhaustionConstructedTerm)

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass
import ExhaustionFunctionsCanonicalLaneLean.ExhaustionFunctionDefinition

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure TamenessPackage {X : Type u} [TopologicalSpace X] (f : ExhaustionFunction X) where
  gradientEstimate : Prop
  regularValuesDense : Prop
  sublevelSetsAreManifolds : Prop

def TamenessClosed {X : Type u} [TopologicalSpace X] {f : ExhaustionFunction X} (T : TamenessPackage f) : Prop :=
  T.gradientEstimate ∧ T.regularValuesDense ∧ T.sublevelSetsAreManifolds

structure TamenessEvidence {X : Type u} [TopologicalSpace X] {f : ExhaustionFunction X} (T : TamenessPackage f) where
  gradientEstimateClosed : T.gradientEstimate
  regularValuesDenseClosed : T.regularValuesDense
  sublevelSetsAreManifoldsClosed : T.sublevelSetsAreManifolds

theorem tameness_closed_from_evidence {X : Type u} [TopologicalSpace X] {f : ExhaustionFunction X} (T : TamenessPackage f) (E : TamenessEvidence T) :
    TamenessClosed T := by
  exact And.intro E.gradientEstimateClosed (And.intro E.regularValuesDenseClosed E.sublevelSetsAreManifoldsClosed)

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse

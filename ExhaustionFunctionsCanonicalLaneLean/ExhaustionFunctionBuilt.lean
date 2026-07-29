import canonicalLaneMathlib.AdmissibleClass
import ExhaustionFunctionsCanonicalLaneLean.LaplacianComparisonEstimate

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure ExhaustionFunctionBuiltPackage {E : RiemannianMetricExhaustionPackage}
    {R : RiemannianMetricExhaustionEvidence E}
    {B : BarrierFunctionFamilyPackage R} {Br : BarrierFunctionFamilyEvidence B}
    {L : LaplacianComparisonEstimatePackage Br} (La : LaplacianComparisonEstimateEvidence L) where
  exhaustionFunctionConstructed : Prop
  laplacianComparisonApplied : Prop
  completeManifoldFromExhaustion : Prop
  complexGeometryApplication : Prop

structure ExhaustionFunctionBuiltEvidence {E : RiemannianMetricExhaustionPackage}
    {R : RiemannianMetricExhaustionEvidence E}
    {B : BarrierFunctionFamilyPackage R} {Br : BarrierFunctionFamilyEvidence B}
    {L : LaplacianComparisonEstimatePackage Br} {La : LaplacianComparisonEstimateEvidence L}
    (X : ExhaustionFunctionBuiltPackage La) where
  exhaustionFunctionConstructedClosed : X.exhaustionFunctionConstructed
  laplacianComparisonAppliedClosed : X.laplacianComparisonApplied
  completeManifoldFromExhaustionClosed : X.completeManifoldFromExhaustion
  complexGeometryApplicationClosed : X.complexGeometryApplication

def ExhaustionFunctionBuiltClosed {E : RiemannianMetricExhaustionPackage}
    {R : RiemannianMetricExhaustionEvidence E}
    {B : BarrierFunctionFamilyPackage R} {Br : BarrierFunctionFamilyEvidence B}
    {L : LaplacianComparisonEstimatePackage Br} {La : LaplacianComparisonEstimateEvidence L}
    (X : ExhaustionFunctionBuiltPackage La) : Prop :=
  X.exhaustionFunctionConstructed ∧ X.laplacianComparisonApplied ∧
  X.completeManifoldFromExhaustion ∧ X.complexGeometryApplication

theorem exhaustion_function_built_closed_from_evidence
    {E : RiemannianMetricExhaustionPackage}
    {R : RiemannianMetricExhaustionEvidence E}
    {B : BarrierFunctionFamilyPackage R} {Br : BarrierFunctionFamilyEvidence B}
    {L : LaplacianComparisonEstimatePackage Br} {La : LaplacianComparisonEstimateEvidence L}
    (X : ExhaustionFunctionBuiltPackage La) (Ev : ExhaustionFunctionBuiltEvidence X) :
    ExhaustionFunctionBuiltClosed X := by
  exact And.intro Ev.exhaustionFunctionConstructedClosed
    (And.intro Ev.laplacianComparisonAppliedClosed
      (And.intro Ev.completeManifoldFromExhaustionClosed Ev.complexGeometryApplicationClosed))

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
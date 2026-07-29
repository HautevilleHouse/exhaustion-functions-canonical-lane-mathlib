import canonicalLaneMathlib.AdmissibleClass
import ExhaustionFunctionsCanonicalLaneLean.BarrierFunctionFamily

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure LaplacianComparisonEstimatePackage {E : RiemannianMetricExhaustionPackage}
    {R : RiemannianMetricExhaustionEvidence E}
    {B : BarrierFunctionFamilyPackage R} (Br : BarrierFunctionFamilyEvidence B) where
  laplacianUpperBound : Prop
  laplacianLowerBound : Prop
  comparisionWithModel : Prop
  riemannianCurvatureUsed : Prop

structure LaplacianComparisonEstimateEvidence {E : RiemannianMetricExhaustionPackage}
    {R : RiemannianMetricExhaustionEvidence E}
    {B : BarrierFunctionFamilyPackage R} {Br : BarrierFunctionFamilyEvidence B}
    (L : LaplacianComparisonEstimatePackage Br) where
  laplacianUpperBoundClosed : L.laplacianUpperBound
  laplacianLowerBoundClosed : L.laplacianLowerBound
  comparisionWithModelClosed : L.comparisionWithModel
  riemannianCurvatureUsedClosed : L.riemannianCurvatureUsed

def LaplacianComparisonEstimateClosed {E : RiemannianMetricExhaustionPackage}
    {R : RiemannianMetricExhaustionEvidence E}
    {B : BarrierFunctionFamilyPackage R} {Br : BarrierFunctionFamilyEvidence B}
    (L : LaplacianComparisonEstimatePackage Br) : Prop :=
  L.laplacianUpperBound ∧ L.laplacianLowerBound ∧
  L.comparisionWithModel ∧ L.riemannianCurvatureUsed

theorem laplacian_comparison_estimate_closed_from_evidence
    {E : RiemannianMetricExhaustionPackage}
    {R : RiemannianMetricExhaustionEvidence E}
    {B : BarrierFunctionFamilyPackage R} {Br : BarrierFunctionFamilyEvidence B}
    (L : LaplacianComparisonEstimatePackage Br) (Ev : LaplacianComparisonEstimateEvidence L) :
    LaplacianComparisonEstimateClosed L := by
  exact And.intro Ev.laplacianUpperBoundClosed
    (And.intro Ev.laplacianLowerBoundClosed
      (And.intro Ev.comparisionWithModelClosed Ev.riemannianCurvatureUsedClosed))

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass
import ExhaustionFunctionsCanonicalLaneLean.RiemannianMetricExhaustion

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure BarrierFunctionFamilyPackage {E : RiemannianMetricExhaustionPackage}
    (R : RiemannianMetricExhaustionEvidence E) where
  barrierFunction : Type u
  lowerBound : Prop
  gradientEstimate : Prop
  hessianEstimate : Prop
  barrierAlongExhaustion : Prop

structure BarrierFunctionFamilyEvidence {E : RiemannianMetricExhaustionPackage}
    {R : RiemannianMetricExhaustionEvidence E}
    (B : BarrierFunctionFamilyPackage R) where
  lowerBoundClosed : B.lowerBound
  gradientEstimateClosed : B.gradientEstimate
  hessianEstimateClosed : B.hessianEstimate
  barrierAlongExhaustionClosed : B.barrierAlongExhaustion

def BarrierFunctionFamilyClosed {E : RiemannianMetricExhaustionPackage}
    {R : RiemannianMetricExhaustionEvidence E}
    (B : BarrierFunctionFamilyPackage R) : Prop :=
  B.lowerBound ∧ B.gradientEstimate ∧ B.hessianEstimate ∧ B.barrierAlongExhaustion

theorem barrier_function_family_closed_from_evidence
    {E : RiemannianMetricExhaustionPackage}
    {R : RiemannianMetricExhaustionEvidence E}
    (B : BarrierFunctionFamilyPackage R) (Ev : BarrierFunctionFamilyEvidence B) :
    BarrierFunctionFamilyClosed B := by
  exact And.intro Ev.lowerBoundClosed
    (And.intro Ev.gradientEstimateClosed
      (And.intro Ev.hessianEstimateClosed Ev.barrierAlongExhaustionClosed))

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
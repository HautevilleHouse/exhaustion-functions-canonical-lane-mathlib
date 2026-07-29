import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure RiemannianMetricExhaustionPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  riemannianMetric : Type v
  exhaustionFunction : Type w
  exhaustionLevelSetsCompact : Prop
  exhaustionFunctionProper : Prop
  exhaustionFunctionSmooth : Prop
  metricCompatible : Prop

structure RiemannianMetricExhaustionEvidence (E : RiemannianMetricExhaustionPackage) where
  exhaustionLevelSetsCompactClosed : E.exhaustionLevelSetsCompact
  exhaustionFunctionProperClosed : E.exhaustionFunctionProper
  exhaustionFunctionSmoothClosed : E.exhaustionFunctionSmooth
  metricCompatibleClosed : E.metricCompatible

def RiemannianMetricExhaustionClosed (E : RiemannianMetricExhaustionPackage) : Prop :=
  E.exhaustionLevelSetsCompact ∧ E.exhaustionFunctionProper ∧
  E.exhaustionFunctionSmooth ∧ E.metricCompatible

theorem riemannian_metric_exhaustion_closed_from_evidence
    (E : RiemannianMetricExhaustionPackage) (Ev : RiemannianMetricExhaustionEvidence E) :
    RiemannianMetricExhaustionClosed E := by
  exact And.intro Ev.exhaustionLevelSetsCompactClosed
    (And.intro Ev.exhaustionFunctionProperClosed
      (And.intro Ev.exhaustionFunctionSmoothClosed Ev.metricCompatibleClosed))

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
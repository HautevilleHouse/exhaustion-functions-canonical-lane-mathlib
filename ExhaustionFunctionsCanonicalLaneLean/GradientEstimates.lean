import canonicalLaneMathlib.AdmissibleClass
import ExhaustionFunctionsCanonicalLaneLean.ExhaustionFunctionsStructure

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure GradientEstimatePackage (E : ExhaustionFunctionData) where
  gradientBound : ℝ
  lipschitzConstant : ℝ
  gradientInequality : ∀ x : E.carrier, ‖gradient E x‖ ≤ gradientBound
  lipschitzCondition : ∀ x y : E.carrier, |E.exhaustionFamily x - E.exhaustionFamily y| ≤ lipschitzConstant * dist x y
  gradientEstimateClosed : gradientInequality ∧ lipschitzCondition

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
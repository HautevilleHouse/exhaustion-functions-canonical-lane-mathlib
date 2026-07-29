import canonicalLaneMathlib.AdmissibleClass
import ExhaustionFunctionsCanonicalLaneLean.ExhaustionFunctionsStructure

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure EnergyFunctional (E : ExhaustionFunctionData) where
  energy : (E.carrier → ℝ) → ℝ
  domain : Set (E.carrier → ℝ)
  lowerSemicontinuous : ∀ (f : E.carrier → ℝ), f ∈ domain → lowerSemicontinuousAt (energy) f
  coercive : ∀ (f : E.carrier → ℝ), f ∈ domain → energy f → ∞ as ‖f‖ → ∞
  energyFunctionalClosed : lowerSemicontinuous ∧ coercive

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
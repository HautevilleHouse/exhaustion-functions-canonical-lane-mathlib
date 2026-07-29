import ExhaustionFunctionsCanonicalLaneLean.ExhaustionFunctionPackage

/-!
# Gradient Estimate Package
-/

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure GradientEstimatePackage {P : PropernessPackage}
    {E : ExhaustionFunctionPackage P} where
  gradientBound : ℝ
  gradientInequality : ∀ x : P.manifold, ‖gradient E.exhaustionFunction x‖ ≤ gradientBound
  globalLipschitz : LipschitzWith gradientBound E.exhaustionFunction

structure GradientEstimateEvidence {P : PropernessPackage}
    {E : ExhaustionFunctionPackage P} (G : GradientEstimatePackage E) where
  gradientInequalityClosed : ∀ x : P.manifold, ‖gradient E.exhaustionFunction x‖ ≤ G.gradientBound
  globalLipschitzClosed : LipschitzWith G.gradientBound E.exhaustionFunction

def GradientEstimateClosed {P : PropernessPackage}
    {E : ExhaustionFunctionPackage P} (G : GradientEstimatePackage E) : Prop :=
  (∀ x : P.manifold, ‖gradient E.exhaustionFunction x‖ ≤ G.gradientBound) ∧
  LipschitzWith G.gradientBound E.exhaustionFunction

theorem gradient_estimate_closed_from_evidence
    {P : PropernessPackage} {E : ExhaustionFunctionPackage P}
    (G : GradientEstimatePackage E) (Ev : GradientEstimateEvidence G) :
    GradientEstimateClosed G := by
  exact And.intro Ev.gradientInequalityClosed Ev.globalLipschitzClosed

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
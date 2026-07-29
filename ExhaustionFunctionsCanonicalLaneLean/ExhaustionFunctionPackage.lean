import ExhaustionFunctionsCanonicalLaneLean.PropernessPackage

/-!
# Exhaustion Function Package
-/

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure ExhaustionFunctionPackage {P : PropernessPackage} where
  exhaustionFunction : P.manifold → ℝ
  sublevelCompact : ∀ r : ℝ, IsCompact {x : P.manifold | exhaustionFunction x ≤ r}
  continuous : Continuous exhaustionFunction
  goesToInfinity : ∀ C : ℝ, ∃ K : Set P.manifold, IsCompact K ∧ ∀ x ∉ K, exhaustionFunction x ≥ C

structure ExhaustionFunctionEvidence {P : PropernessPackage} (E : ExhaustionFunctionPackage P) where
  sublevelCompactClosed : ∀ r : ℝ, IsCompact {x | E.exhaustionFunction x ≤ r}
  continuousClosed : Continuous E.exhaustionFunction
  goesToInfinityClosed : ∀ C : ℝ, ∃ K : Set P.manifold, IsCompact K ∧ ∀ x ∉ K, E.exhaustionFunction x ≥ C

def ExhaustionFunctionClosed {P : PropernessPackage} (E : ExhaustionFunctionPackage P) : Prop :=
  (∀ r : ℝ, IsCompact {x | E.exhaustionFunction x ≤ r}) ∧
  Continuous E.exhaustionFunction ∧
  (∀ C : ℝ, ∃ K : Set P.manifold, IsCompact K ∧ ∀ x ∉ K, E.exhaustionFunction x ≥ C)

theorem exhaustion_function_closed_from_evidence
    {P : PropernessPackage} (E : ExhaustionFunctionPackage P)
    (Ev : ExhaustionFunctionEvidence E) : ExhaustionFunctionClosed E := by
  exact And.intro Ev.sublevelCompactClosed
    (And.intro Ev.continuousClosed Ev.goesToInfinityClosed)

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
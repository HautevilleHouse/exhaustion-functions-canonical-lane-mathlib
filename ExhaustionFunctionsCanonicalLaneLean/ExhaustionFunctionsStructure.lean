import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure ExhaustionFunctionData where
  carrier : Type u
  topology : TopologicalSpace carrier
  exhaustionFamily : carrier → ℝ
  properness : Prop
  sublevelCompact : ∀ r : ℝ, IsCompact {x : carrier | exhaustionFamily x ≤ r}
  exhaustionFamilyContinuous : Continuous exhaustionFamily

def exhaustionWitnessClosed (E : ExhaustionFunctionData) : Prop :=
  E.properness ∧ (∀ r : ℝ, IsCompact {x : E.carrier | E.exhaustionFamily x ≤ r})

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
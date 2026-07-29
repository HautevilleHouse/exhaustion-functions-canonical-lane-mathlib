import canonicalLaneMathlib.AdmissibleClass
import ExhaustionFunctionsCanonicalLaneLean.ExhaustionFunctionsStructure

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure SublevelCompactPackage (E : ExhaustionFunctionData) where
  sublevelCompact : ∀ r : ℝ, IsCompact {x : E.carrier | E.exhaustionFamily x ≤ r}
  sublevelNonempty : ∀ r ≥ sup E.exhaustionFamily, Set.Nonempty {x : E.carrier | E.exhaustionFamily x ≤ r}
  sublevelCompactNonemptyClosed : sublevelCompact ∧ sublevelNonempty

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
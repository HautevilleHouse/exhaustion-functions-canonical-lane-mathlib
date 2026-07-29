import ExhaustionFunctionsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
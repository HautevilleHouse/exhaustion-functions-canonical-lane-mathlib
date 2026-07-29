import ExhaustionFunctionsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure AdmissibleClass where
  object : ExhaustionFunctionAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ExhaustionFunctionWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
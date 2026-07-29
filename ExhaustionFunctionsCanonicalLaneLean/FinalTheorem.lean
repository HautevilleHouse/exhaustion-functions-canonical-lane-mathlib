import canonicalLaneMathlib.AdmissibleClass
import ExhaustionFunctionsCanonicalLaneLean.ExhaustionFunctionDefinition
import ExhaustionFunctionsCanonicalLaneLean.ExhaustionFunctionConstruction

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ExhaustionFunctionClosed (ExhaustionFunctionDefinition A)

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact exhaustion_function_closed_from_evidence (ExhaustionFunctionDefinition A) (exhaustionFunctionEvidence A)

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

def ConstrainedExhaustionFunctionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_exhaustion_function_endgame (A : AdmissibleClass) :
    ConstrainedExhaustionFunctionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse

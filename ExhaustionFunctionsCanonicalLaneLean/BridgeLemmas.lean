import ExhaustionFunctionsCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ExhaustionFunctionWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
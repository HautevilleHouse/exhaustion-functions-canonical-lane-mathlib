import ExhaustionFunctionsCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ExhaustionFunctionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ExhaustionFunctionAdmittedObject where
  space : ExhaustionFunctionSpace
  properMetric : Prop
  exhaustionExists : Prop
  exhaustionFunction : Type
  exhaustionTopology : TopologicalSpace exhaustionFunction
  exhaustionProper : Prop
  conclusion : exhaustionProper

structure ExhaustionFunctionEndgameState where
  object : ExhaustionFunctionAdmittedObject

def ExhaustionFunctionWitnessClosed (O : ExhaustionFunctionAdmittedObject) : Prop :=
  O.exhaustionProper

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse
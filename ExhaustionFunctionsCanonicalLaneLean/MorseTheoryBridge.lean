import canonicalLaneMathlib.AdmissibleClass
import ExhaustionFunctionsCanonicalLaneLean.HandleAttachment

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure MorseTheoryBridgePackage {X : Type u} [TopologicalSpace X] {f : ExhaustionFunction X} {T : TamenessPackage f} (H : HandleAttachmentPackage T) where
  criticalPointsClassified : Prop
  localModelsCellDecomposition : Prop
  invariantUnderHomotopy : Prop
  hCobordismConnection : Prop

def MorseTheoryBridgeClosed {X : Type u} [TopologicalSpace X] {f : ExhaustionFunction X} {T : TamenessPackage f} {H : HandleAttachmentPackage T} (M : MorseTheoryBridgePackage H) : Prop :=
  M.criticalPointsClassified ∧ M.localModelsCellDecomposition ∧ M.invariantUnderHomotopy ∧ M.hCobordismConnection

structure MorseTheoryBridgeEvidence {X : Type u} [TopologicalSpace X] {f : ExhaustionFunction X} {T : TamenessPackage f} {H : HandleAttachmentPackage T} (M : MorseTheoryBridgePackage H) where
  criticalPointsClassifiedClosed : M.criticalPointsClassified
  localModelsCellDecompositionClosed : M.localModelsCellDecomposition
  invariantUnderHomotopyClosed : M.invariantUnderHomotopy
  hCobordismConnectionClosed : M.hCobordismConnection

theorem morse_theory_bridge_closed_from_evidence {X : Type u} [TopologicalSpace X] {f : ExhaustionFunction X} {T : TamenessPackage f} {H : HandleAttachmentPackage T} (M : MorseTheoryBridgePackage H) (E : MorseTheoryBridgeEvidence M) :
    MorseTheoryBridgeClosed M := by
  exact And.intro E.criticalPointsClassifiedClosed (And.intro E.localModelsCellDecompositionClosed (And.intro E.invariantUnderHomotopyClosed E.hCobordismConnectionClosed))

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse

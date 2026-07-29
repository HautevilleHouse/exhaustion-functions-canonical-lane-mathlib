import canonicalLaneMathlib.AdmissibleClass
import ExhaustionFunctionsCanonicalLaneLean.TamenessConditions

namespace HautevilleHouse
namespace ExhaustionFunctionsCanonicalLaneLean

structure HandleAttachmentPackage {X : Type u} [TopologicalSpace X] {f : ExhaustionFunction X} (T : TamenessPackage f) where
  handleDecomposition : Prop
  indexPairs : Prop
  attachmentMaps : Prop
  smoothCompatibility : Prop

def HandleAttachmentClosed {X : Type u} [TopologicalSpace X] {f : ExhaustionFunction X} {T : TamenessPackage f} (H : HandleAttachmentPackage T) : Prop :=
  H.handleDecomposition ∧ H.indexPairs ∧ H.attachmentMaps ∧ H.smoothCompatibility

structure HandleAttachmentEvidence {X : Type u} [TopologicalSpace X] {f : ExhaustionFunction X} {T : TamenessPackage f} (H : HandleAttachmentPackage T) where
  handleDecompositionClosed : H.handleDecomposition
  indexPairsClosed : H.indexPairs
  attachmentMapsClosed : H.attachmentMaps
  smoothCompatibilityClosed : H.smoothCompatibility

theorem handle_attachment_closed_from_evidence {X : Type u} [TopologicalSpace X] {f : ExhaustionFunction X} {T : TamenessPackage f} (H : HandleAttachmentPackage T) (E : HandleAttachmentEvidence H) :
    HandleAttachmentClosed H := by
  exact And.intro E.handleDecompositionClosed (And.intro E.indexPairsClosed (And.intro E.attachmentMapsClosed E.smoothCompatibilityClosed))

end ExhaustionFunctionsCanonicalLaneLean
end HautevilleHouse

import DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean.ConvergenceRate

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean

structure MeshRefinementPackage where
  baseMesh : Type u
  refinedMesh : Type v
  errorIndicator : Type w
  refinementCriterion : Prop
  errorReduction : Prop
  optimalityPreservation : Prop

structure MeshRefinementEvidence (M : MeshRefinementPackage) where
  refinementCriterionClosed : M.refinementCriterion
  errorReductionClosed : M.errorReduction
  optimalityPreservationClosed : M.optimalityPreservation

def MeshRefinementClosed (M : MeshRefinementPackage) : Prop :=
  M.refinementCriterion ∧ M.errorReduction ∧ M.optimalityPreservation

theorem mesh_refinement_closed_from_evidence
    (M : MeshRefinementPackage) (E : MeshRefinementEvidence M) :
    MeshRefinementClosed M := by
  exact And.intro E.refinementCriterionClosed (And.intro E.errorReductionClosed E.optimalityPreservationClosed)

end DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean
end HautevilleHouse

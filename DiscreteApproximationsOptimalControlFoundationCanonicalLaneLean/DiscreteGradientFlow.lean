import DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean

structure DiscreteGradientFlowPackage where
  stateSpace : Type u
  timeStep : Type v
  gradientOperator : Type w
  descentDirection : Prop
  stepSizeAdmissible : Prop
  convergenceToCriticalPoint : Prop

structure DiscreteGradientFlowEvidence (D : DiscreteGradientFlowPackage) where
  descentDirectionClosed : D.descentDirection
  stepSizeAdmissibleClosed : D.stepSizeAdmissible
  convergenceToCriticalPointClosed : D.convergenceToCriticalPoint

def DiscreteGradientFlowClosed (D : DiscreteGradientFlowPackage) : Prop :=
  D.descentDirection ∧ D.stepSizeAdmissible ∧ D.convergenceToCriticalPoint

theorem discrete_gradient_flow_closed_from_evidence
    (D : DiscreteGradientFlowPackage) (E : DiscreteGradientFlowEvidence D) :
    DiscreteGradientFlowClosed D := by
  exact And.intro E.descentDirectionClosed (And.intro E.stepSizeAdmissibleClosed E.convergenceToCriticalPointClosed)

end DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean
end HautevilleHouse

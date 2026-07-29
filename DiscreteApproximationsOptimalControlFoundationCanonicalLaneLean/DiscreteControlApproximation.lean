import canonicalLaneMathlib.RicciFlowAnalyticFoundation

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean

structure DiscreteControlApproximationPackage where
  timeStepRefinement : Prop
  stateSpaceDiscretization : Prop
  controlActionSet : Type
  convergenceRate : Prop
  numericalStability : Prop

structure DiscreteControlApproximationEvidence (P : DiscreteControlApproximationPackage) where
  timeStepRefinementClosed : P.timeStepRefinement
  stateSpaceDiscretizationClosed : P.stateSpaceDiscretization
  convergenceRateClosed : P.convergenceRate
  numericalStabilityClosed : P.numericalStability

def DiscreteControlApproximationClosed (P : DiscreteControlApproximationPackage) : Prop :=
  P.timeStepRefinement ∧ P.stateSpaceDiscretization ∧ P.convergenceRate ∧ P.numericalStability

theorem discrete_control_approximation_closed_from_evidence
    (P : DiscreteControlApproximationPackage) (E : DiscreteControlApproximationEvidence P) :
    DiscreteControlApproximationClosed P := by
  exact And.intro E.timeStepRefinementClosed
    (And.intro E.stateSpaceDiscretizationClosed
      (And.intro E.convergenceRateClosed E.numericalStabilityClosed))

end DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean
end HautevilleHouse

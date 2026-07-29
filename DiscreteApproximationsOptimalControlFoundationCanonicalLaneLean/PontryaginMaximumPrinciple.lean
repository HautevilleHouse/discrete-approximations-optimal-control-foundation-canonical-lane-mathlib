import DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean.DiscreteGradientFlow

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean

structure PontryaginMaximumPrinciplePackage where
  optimalControl : Type u
  adjointState : Type v
  hamiltonian : Type w
  necessaryConditionOptimality : Prop
  adjointDynamics : Prop
  transversalityCondition : Prop

structure PontryaginMaximumPrincipleEvidence (P : PontryaginMaximumPrinciplePackage) where
  necessaryConditionOptimalityClosed : P.necessaryConditionOptimality
  adjointDynamicsClosed : P.adjointDynamics
  transversalityConditionClosed : P.transversalityCondition

def PontryaginMaximumPrincipleClosed (P : PontryaginMaximumPrinciplePackage) : Prop :=
  P.necessaryConditionOptimality ∧ P.adjointDynamics ∧ P.transversalityCondition

theorem pontryagin_maximum_principle_closed_from_evidence
    (P : PontryaginMaximumPrinciplePackage) (E : PontryaginMaximumPrincipleEvidence P) :
    PontryaginMaximumPrincipleClosed P := by
  exact And.intro E.necessaryConditionOptimalityClosed (And.intro E.adjointDynamicsClosed E.transversalityConditionClosed)

end DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean
end HautevilleHouse

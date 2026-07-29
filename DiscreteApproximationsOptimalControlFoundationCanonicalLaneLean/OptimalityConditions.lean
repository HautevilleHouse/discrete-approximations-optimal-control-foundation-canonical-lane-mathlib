import canonicalLaneMathlib.DiscreteControlApproximation

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean

structure OptimalityConditionsPackage {P : DiscreteControlApproximationPackage} where
  discretePontryaginPrinciple : Prop
  hjbEquationDiscrete : Prop
  necessaryConditions : Prop
  sufficientConditions : Prop

structure OptimalityConditionsEvidence {P : DiscreteControlApproximationPackage}
    (O : OptimalityConditionsPackage P) where
  discretePontryaginPrincipleClosed : O.discretePontryaginPrinciple
  hjbEquationDiscreteClosed : O.hjbEquationDiscrete
  necessaryConditionsClosed : O.necessaryConditions
  sufficientConditionsClosed : O.sufficientConditions

def OptimalityConditionsClosed {P : DiscreteControlApproximationPackage}
    (O : OptimalityConditionsPackage P) : Prop :=
  O.discretePontryaginPrinciple ∧ O.hjbEquationDiscrete ∧
  O.necessaryConditions ∧ O.sufficientConditions

theorem optimality_conditions_closed_from_evidence
    {P : DiscreteControlApproximationPackage} (O : OptimalityConditionsPackage P)
    (E : OptimalityConditionsEvidence O) : OptimalityConditionsClosed O := by
  exact And.intro E.discretePontryaginPrincipleClosed
    (And.intro E.hjbEquationDiscreteClosed
      (And.intro E.necessaryConditionsClosed E.sufficientConditionsClosed))

end DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean
end HautevilleHouse

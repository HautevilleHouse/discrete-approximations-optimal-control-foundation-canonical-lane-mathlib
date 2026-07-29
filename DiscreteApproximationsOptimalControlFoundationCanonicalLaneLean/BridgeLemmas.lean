import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproxOptimalControlFoundation

def bridgeClosed (A : AdmissibleClass) : Prop :=
  bridgeWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DiscreteApproxOptimalControlFoundation
end HautevilleHouse

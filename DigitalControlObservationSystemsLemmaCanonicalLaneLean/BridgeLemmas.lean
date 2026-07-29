import canonicalLaneMathlib.AdmissibleClass
open HautevilleHouse.DigitalControlObservationSystemsLemmaCanonicalLaneLean

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let O := A.object
  O.systemDynamics ∧ O.observabilityCondition ∧ O.controllabilityCondition

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  have h : A.object.conclusion := A.object.conclusion
  exact h

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse

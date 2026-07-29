import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DigitalControlObservationSystemsLemmaCanonicalLaneLean.DigitalControlObservationSystem

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

open DigitalControlObservationSystem

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let S := A.object
  SystemControlEvidence.fromAdmissibleClass A
  -- Use the system's conclusion
  S.reachabilityUnderControl

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.reachabilityUnderControl

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse

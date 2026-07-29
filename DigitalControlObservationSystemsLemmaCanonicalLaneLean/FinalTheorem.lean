import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DigitalControlObservationSystemsLemmaCanonicalLaneLean.ObservationBridgeLemmas

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

def ConstrainedDigitalControlClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_digital_control_endgame (A : AdmissibleClass) : ConstrainedDigitalControlClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse

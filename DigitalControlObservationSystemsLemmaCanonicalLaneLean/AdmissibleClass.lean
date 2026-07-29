import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : DigitalControlObservationSystem
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DigitalControlObservationSystemClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse

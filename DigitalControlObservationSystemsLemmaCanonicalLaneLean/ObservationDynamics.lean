import HautevilleHouse.DigitalControlObservationSystemsLemmaCanonicalLaneLean.SensorModel

/-!
# Observation Dynamics Package
-/

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure ObservationDynamicsPackage (S : SensorModelPackage) where
  stateTransition : S.sensorType → S.sensorType
  outputMap : Prop
  observability : Prop
  detectability : Prop

structure ObservationDynamicsEvidence (S : SensorModelPackage)
    (D : ObservationDynamicsPackage S) where
  outputMapClosed : D.outputMap
  observabilityClosed : D.observability
  detectabilityClosed : D.detectability

def ObservationDynamicsClosed (S : SensorModelPackage)
    (D : ObservationDynamicsPackage S) : Prop :=
  D.outputMap ∧ D.observability ∧ D.detectability

theorem observation_dynamics_closed_from_evidence
    (S : SensorModelPackage) (D : ObservationDynamicsPackage S)
    (E : ObservationDynamicsEvidence S D) :
    ObservationDynamicsClosed S D := by
  exact And.intro E.outputMapClosed
    (And.intro E.observabilityClosed E.detectabilityClosed)

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
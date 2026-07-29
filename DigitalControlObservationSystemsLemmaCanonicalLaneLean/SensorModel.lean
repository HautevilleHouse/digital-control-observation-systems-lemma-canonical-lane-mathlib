import HautevilleHouse.DigitalControlObservationSystemsLemmaCanonicalLaneLean.AdmissibleClass

/-!
# Sensor Model Package
-/

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure SensorModelPackage where
  sensorType : Type
  measurementSpace : Type
  measurementFunction : Prop
  noiseModel : Prop
  samplingRate : Prop

structure SensorModelEvidence (S : SensorModelPackage) where
  measurementFunctionClosed : S.measurementFunction
  noiseModelClosed : S.noiseModel
  samplingRateClosed : S.samplingRate

def SensorModelClosed (S : SensorModelPackage) : Prop :=
  S.measurementFunction ∧ S.noiseModel ∧ S.samplingRate

theorem sensor_model_closed_from_evidence (S : SensorModelPackage)
    (E : SensorModelEvidence S) :
    SensorModelClosed S := by
  exact And.intro E.measurementFunctionClosed
    (And.intro E.noiseModelClosed E.samplingRateClosed)

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure ObservationFilteringPackage where
  filterDesign : Prop
  estimationError : Prop
  observabilityCondition : Prop

structure ObservationFilteringEvidence (O : ObservationFilteringPackage) where
  filterDesignClosed : O.filterDesign
  estimationErrorClosed : O.estimationError
  observabilityConditionClosed : O.observabilityCondition

def ObservationFilteringClosed (O : ObservationFilteringPackage) : Prop :=
  O.filterDesign ∧ O.estimationError ∧ O.observabilityCondition

theorem observation_filtering_closed_from_evidence (O : ObservationFilteringPackage) (E : ObservationFilteringEvidence O) :
    ObservationFilteringClosed O := by
  exact And.intro E.filterDesignClosed (And.intro E.estimationErrorClosed E.observabilityConditionClosed)

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
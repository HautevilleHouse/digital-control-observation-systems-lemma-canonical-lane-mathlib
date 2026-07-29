import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure DetectabilityObserverPackage where
  unstableModes : Type
  detectabilityGramian : Type
  observerExistence : Prop
  stableErrorDynamics : Prop
  detectabilityCondition : Prop
  minimalObserverOrder : Prop

theorem detectability_observer_closed (pkg : DetectabilityObserverPackage) :
  pkg.observerExistence ∧ pkg.stableErrorDynamics ∧ pkg.detectabilityCondition ∧ pkg.minimalObserverOrder := by
  exact And.intro pkg.observerExistence (And.intro pkg.stableErrorDynamics (And.intro pkg.detectabilityCondition pkg.minimalObserverOrder))

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse

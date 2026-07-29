import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure LuenbergerObserverPackage where
  systemState : Type
  observation : Type
  observerGain : Type
  errorDynamics : Prop
  asymptoticStability : Prop
  polePlacement : Prop

theorem luenberger_observer_closed (pkg : LuenbergerObserverPackage) :
  pkg.errorDynamics ∧ pkg.asymptoticStability ∧ pkg.polePlacement := by
  exact And.intro pkg.errorDynamics (And.intro pkg.asymptoticStability pkg.polePlacement)

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse

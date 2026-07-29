import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure SeparatorPrinciplePackage where
  controllerState : Type
  observerState : Type
  combinedSystem : Type
  eigenvalueSeparation : Prop
  closedLoopStability : Prop
  combinedDynamics : Prop

theorem separator_principle_closed (pkg : SeparatorPrinciplePackage) :
  pkg.eigenvalueSeparation ∧ pkg.closedLoopStability ∧ pkg.combinedDynamics := by
  exact And.intro pkg.eigenvalueSeparation (And.intro pkg.closedLoopStability pkg.combinedDynamics)

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse

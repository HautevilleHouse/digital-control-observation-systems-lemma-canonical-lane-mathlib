import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure ClosedLoopEquilibriumPackage where
  equilibriumPoint : Prop
  lyapunovFunction : Prop
  asymptoticStability : Prop

structure ClosedLoopEquilibriumEvidence (C : ClosedLoopEquilibriumPackage) where
  equilibriumPointClosed : C.equilibriumPoint
  lyapunovFunctionClosed : C.lyapunovFunction
  asymptoticStabilityClosed : C.asymptoticStability

def ClosedLoopEquilibriumClosed (C : ClosedLoopEquilibriumPackage) : Prop :=
  C.equilibriumPoint ∧ C.lyapunovFunction ∧ C.asymptoticStability

theorem closed_loop_equilibrium_closed_from_evidence (C : ClosedLoopEquilibriumPackage) (E : ClosedLoopEquilibriumEvidence C) :
    ClosedLoopEquilibriumClosed C := by
  exact And.intro E.equilibriumPointClosed (And.intro E.lyapunovFunctionClosed E.asymptoticStabilityClosed)

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
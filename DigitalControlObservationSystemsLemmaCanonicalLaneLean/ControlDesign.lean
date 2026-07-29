import HautevilleHouse.DigitalControlObservationSystemsLemmaCanonicalLaneLean.ObservationDynamics

/-!
# Control Design Package
-/

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure ControlDesignPackage {G : ObservationDynamicsPackage} (O : ObserverDesignPackage G) where
  feedbackLaw : Prop
  lyapunovFunction : Prop
  stabilityMargin : Prop
  robustnessBand : Prop

structure ControlDesignEvidence {G : ObservationDynamicsPackage} {O : ObserverDesignPackage G}
    (C : ControlDesignPackage O) where
  feedbackLawClosed : C.feedbackLaw
  lyapunovFunctionClosed : C.lyapunovFunction
  stabilityMarginClosed : C.stabilityMargin
  robustnessBandClosed : C.robustnessBand

def ControlDesignClosed {G : ObservationDynamicsPackage} {O : ObserverDesignPackage G}
    (C : ControlDesignPackage O) : Prop :=
  C.feedbackLaw ∧ C.lyapunovFunction ∧ C.stabilityMargin ∧ C.robustnessBand

theorem control_design_closed_from_evidence
    {G : ObservationDynamicsPackage} {O : ObserverDesignPackage G}
    (C : ControlDesignPackage O) (E : ControlDesignEvidence C) :
    ControlDesignClosed C := by
  exact And.intro E.feedbackLawClosed
    (And.intro E.lyapunovFunctionClosed
      (And.intro E.stabilityMarginClosed E.robustnessBandClosed))

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
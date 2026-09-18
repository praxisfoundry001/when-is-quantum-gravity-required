/-
QUANTUM GRAVITY ADJUDICATION — FORMAL CONTRACT v1.0
Lean 4 downstream formal contract

Companion physics artifact
--------------------------
  When Is Quantum Gravity Required?
  A Finite Experimental Adjudication Framework

Human-facing machine documentation
----------------------------------
  Quantum Gravity Adjudication — Machine Companion v1.3

Universal machine base
----------------------
  Structural_Flow_Universal_Kernel_v1.0.lean

BUILD HEADER
------------
QG_ADJUDICATION_FORMAL_CONTRACT_PUBLIC_v1_0

USAGE
-----
Append this complete file directly after the complete Structural Flow Universal
Kernel, after the kernel's final `end StructuralFlow`, then elaborate in Lean 4.

Expected clean result:
  no messages / no errors.

This file is an APPEND CONTRACT. It does not modify the Universal Kernel.

FORMAL SCOPE
------------
This contract machine-checks only the CONDITIONAL LOGIC of the quantum-gravity
adjudication. It does not establish any empirical premise, literature claim,
numerical feasibility estimate, or experimental result.

Physics owns the premises. Lean checks what follows from the encoded premises.

The contract checks that a scoped quantum-gravity resolution is available only
when all required parent conditions are supplied, that experimental discriminator
closure cannot silently replace comparison-class coverage, and that even a fully
promoted QGR state does not select a microscopic quantum-gravity ontology.

PUBLIC TERMINOLOGY MAP
----------------------
  QDA : independently established quantum description at the declared scope
  QBA : quantum structure is load-bearing for the tested effect
  GBA : independent gravity attribution for the tested effect
  GCR : classical-gravity representability of the complete registered data

  L : finite quantum-interface / preparation-mixture consistency
  G : gravity attribution and background control
  P : standard local classical-process exclusion
  B : alternate quantum-information bypass exclusion / bounding
  N : nonlocal or correlated classical-alternative exclusion
  I : stochastic / irreversible / decohering / diffusive alternative exclusion

IMPLEMENTATION-LABEL NOTES
--------------------------
`Charge` is the inherited machine name for one exact frozen problem instance:
its beta, level, and physical scope. It is NOT electric charge.

`ClassicalCarrier` is an inherited implementation label for a candidate
classical gravitational representation. It does NOT imply that the candidate
is a mediator, particle, or physical carrier ontology.

No theorem in this file should be read as evidence that an experiment has
succeeded. The public Machine Companion gives the execution and interpretation
rules for this contract.
-/

namespace StructuralFlow

/-- Machine-visible release tag; emits no routine output. -/
def quantumGravityAdjudicationFormalContractBuild : String :=
  "QG_ADJUDICATION_FORMAL_CONTRACT_PUBLIC_v1_0"

namespace QGRTrigger

open UniversalTranslationContract

universe u

/-! --------------------------------------------------------------------------
One frozen physical charge
---------------------------------------------------------------------------- -/

structure Charge (Beta Level Scope : Type u) where
  beta : Beta
  level : Level
  scope : Scope

/-! --------------------------------------------------------------------------
Generic frozen evidence protocol
---------------------------------------------------------------------------- -/

/--
Minimum downstream evidence-discipline packet for one physics-domain gate.
These are propositions because the domain must provide the warrants; Lean only
makes their use explicit and prevents silent omission.
-/
structure EvidenceProtocol where
  independentlyDeclared : Prop
  criterionFrozen : Prop
  verdictRuleFrozen : Prop
  preOutcomeFrozen : Prop
  nonCircular : Prop
  auditable : Prop


def EvidenceProtocol.Ready (p : EvidenceProtocol) : Prop :=
  p.independentlyDeclared ∧
  p.criterionFrozen ∧
  p.verdictRuleFrozen ∧
  p.preOutcomeFrozen ∧
  p.nonCircular ∧
  p.auditable

/-!
Generic three-way evidence gate, dependently pinned to one exact scope key.

For this public contract:
* QDA positive = the relevant source/probe quantum description is independently
  established at the declared scope;
* QBA positive = the relevant quantum structure is load-bearing for the tested
  effect;
* GBA positive = the tested effect has independent gravity attribution.

A disposition cannot be machine-certified without the frozen protocol and the
corresponding domain evidence proposition.
-/
structure Gate
    {Beta Level Scope : Type u}
    (charge : Charge Beta Level Scope) where
  protocol : EvidenceProtocol

  positive : Prop
  negative : Prop
  unresolved : Prop

  positive_negative_incompatible :
    ¬ (positive ∧ negative)

  state : Disposition

  warrant :
    (state = Disposition.discharged → protocol.Ready ∧ positive) ∧
    (state = Disposition.violated → protocol.Ready ∧ negative) ∧
    (state = Disposition.open → protocol.Ready ∧ unresolved)

/--
Every certified Gate disposition carries a ready frozen evidence protocol.
-/
theorem gate_state_requires_ready_protocol
    {Beta Level Scope : Type u}
    {charge : Charge Beta Level Scope}
    (g : Gate charge) :
    g.protocol.Ready := by
  by_cases hD : g.state = Disposition.discharged
  · exact (g.warrant.1 hD).1
  · have hCases := disposition_not_discharged_cases g.state hD
    cases hCases with
    | inl hV =>
        exact (g.warrant.2.1 hV).1
    | inr hO =>
        exact (g.warrant.2.2 hO).1

/-! --------------------------------------------------------------------------
Gravity Classical Representability (GCR)
---------------------------------------------------------------------------- -/

/--
Frozen classical-gravity-representability protocol.

`classCoverageWarrant` is deliberately explicit. Lean does not prove that the
chosen classical comparison class is physically adequate or exhaustive for the
claim being made. The physics argument and experimental design must justify the
class and its coverage independently. The machine only prevents that premise
from being silently omitted.
-/
structure GCRProtocol where
  independentlyDeclared : Prop
  classDefinitionFrozen : Prop
  classCoverageWarrant : Prop
  faithfulnessCriterionFrozen : Prop
  exclusionRuleFrozen : Prop
  preOutcomeFrozen : Prop
  nonCircular : Prop
  auditable : Prop


def GCRProtocol.Ready (p : GCRProtocol) : Prop :=
  p.independentlyDeclared ∧
  p.classDefinitionFrozen ∧
  p.classCoverageWarrant ∧
  p.faithfulnessCriterionFrozen ∧
  p.exclusionRuleFrozen ∧
  p.preOutcomeFrozen ∧
  p.nonCircular ∧
  p.auditable

/--
Frozen declared class of classical-gravity carriers for one exact charge.

`admissible c` means c belongs to the independently declared classical class
being tested.

`faithful c` means c reproduces the complete registered observations and
relations required by the frozen experimental scope under its allowed
parameterization.

The class must contain at least one admitted carrier. This prevents vacuous
"all classical carriers fail" certificates over an empty class.
-/
structure ClassicalGravityClass
    {Beta Level Scope : Type u}
    (charge : Charge Beta Level Scope)
    (ClassicalCarrier : Type u) where
  protocol : GCRProtocol
  admissible : ClassicalCarrier → Prop
  faithful : ClassicalCarrier → Prop
  nonemptyClass : ∃ c, admissible c

/--
An OPEN GCR state requires an explicit unresolved-domain certificate rather
than being inferred from silence.
-/
structure GCRData
    {Beta Level Scope : Type u}
    (charge : Charge Beta Level Scope)
    (ClassicalCarrier : Type u) where
  classical : ClassicalGravityClass charge ClassicalCarrier
  unresolved : Prop

/--
Exact evidence shape for the three GCR dispositions.

DISCHARGED:
  the frozen protocol is ready and the declared class contains at least one
  faithful classical gravity carrier.

VIOLATED:
  the frozen protocol is ready and every carrier in the nonempty declared
  classical class fails the frozen faithfulness criterion.

OPEN:
  the frozen protocol is ready, but the domain supplies an explicit unresolved
  certificate.
-/
def GCREvidence
    {Beta Level Scope ClassicalCarrier : Type u}
    {charge : Charge Beta Level Scope}
    (g : GCRData charge ClassicalCarrier)
    (d : Disposition) : Prop :=
  (d = Disposition.discharged →
      g.classical.protocol.Ready ∧
      ∃ c,
        g.classical.admissible c ∧
        g.classical.faithful c) ∧
  (d = Disposition.violated →
      g.classical.protocol.Ready ∧
      ∀ c,
        g.classical.admissible c →
        ¬ g.classical.faithful c) ∧
  (d = Disposition.open →
      g.classical.protocol.Ready ∧ g.unresolved)

structure GCRContract
    {Beta Level Scope : Type u}
    (charge : Charge Beta Level Scope)
    (ClassicalCarrier : Type u) where
  data : GCRData charge ClassicalCarrier
  state : Disposition
  warrant : GCREvidence data state

/--
Every certified GCR disposition carries the complete frozen GCR protocol.
Thus a QGR trigger cannot be constructed while silently omitting class
coverage, faithfulness, the exclusion rule, pre-outcome freezing,
non-circularity, or auditability.
-/
theorem gcr_state_requires_ready_protocol
    {Beta Level Scope ClassicalCarrier : Type u}
    {charge : Charge Beta Level Scope}
    (g : GCRContract charge ClassicalCarrier) :
    g.data.classical.protocol.Ready := by
  by_cases hD : g.state = Disposition.discharged
  · exact (g.warrant.1 hD).1
  · have hCases := disposition_not_discharged_cases g.state hD
    cases hCases with
    | inl hV =>
        exact (g.warrant.2.1 hV).1
    | inr hO =>
        exact (g.warrant.2.2 hO).1

/-! --------------------------------------------------------------------------
QGR world — all gates share one exact dependent charge
---------------------------------------------------------------------------- -/

/--
Candidate outputs are deliberately separated from the QGR trigger.
They are present only so countermodels can prove that trigger closure does not
entail any of them.
-/
inductive CandidateOutput where
  | persistentQGObject
  | gravityIsQuantumField
  | graviton
  | quantumGeometry
  | loopVariables
  | strings
  | uniqueOutcome
  | replacementCarrier
  | uniqueMicroscopicCarrier
  | metricPersistence
  | discreteSpacetime
  | continuumSpacetime
  | specificUVCompletion
  | preferredCandidateTheory
  | universalGravityQuantization
deriving DecidableEq, Repr

structure World
    (Beta Level Scope ClassicalCarrier : Type u) where
  charge : Charge Beta Level Scope

  qda : Gate charge
  qba : Gate charge
  gba : Gate charge
  gcr : GCRContract charge ClassicalCarrier

  outputHolds : CandidateOutput → Prop

/-!
The dependent field types above are the machine scope pin:
`qda`, `qba`, `gba`, and `gcr` literally have the same `charge` as their type
parameter. A contract built for a different charge requires an explicit proof
of charge equality before it can be transported.
-/

/-! --------------------------------------------------------------------------
Exact QGR dispositions
---------------------------------------------------------------------------- -/

/--
A scoped quantum-gravity resolution is LIVE exactly when, at one exact frozen
problem instance:
* the independent quantum-description gate is discharged;
* the load-bearing quantum-structure gate is discharged;
* the gravity-attribution gate is discharged;
* classical-gravity representability is violated for the predeclared admitted
  comparison class.
-/
def QGRLive
    {Beta Level Scope ClassicalCarrier : Type u}
    (w : World Beta Level Scope ClassicalCarrier) : Prop :=
  w.qda.state = .discharged ∧
  w.qba.state = .discharged ∧
  w.gba.state = .discharged ∧
  w.gcr.state = .violated

/--
Classical-gravity resolution remains available at the frozen charge.
-/
def ClassicalResolutionAvailable
    {Beta Level Scope ClassicalCarrier : Type u}
    (w : World Beta Level Scope ClassicalCarrier) : Prop :=
  w.qda.state = .discharged ∧
  w.qba.state = .discharged ∧
  w.gba.state = .discharged ∧
  w.gcr.state = .discharged

/--
The charge is a QGR pressure surface but is not yet adjudicated strongly enough
to require a non-classical gravity resolution.
-/
def QGRPressureSurface
    {Beta Level Scope ClassicalCarrier : Type u}
    (w : World Beta Level Scope ClassicalCarrier) : Prop :=
  w.qda.state = .discharged ∧
  w.qba.state = .discharged ∧
  w.gba.state = .discharged ∧
  w.gcr.state = Disposition.open

/-! --------------------------------------------------------------------------
Basic trigger closure
---------------------------------------------------------------------------- -/

theorem qgr_live_iff
    {Beta Level Scope ClassicalCarrier : Type u}
    (w : World Beta Level Scope ClassicalCarrier) :
    QGRLive w ↔
      w.qda.state = .discharged ∧
      w.qba.state = .discharged ∧
      w.gba.state = .discharged ∧
      w.gcr.state = .violated := by
  rfl

theorem qgr_live_has_ready_protocols
    {Beta Level Scope ClassicalCarrier : Type u}
    {w : World Beta Level Scope ClassicalCarrier}
    (_h : QGRLive w) :
    w.qda.protocol.Ready ∧
    w.qba.protocol.Ready ∧
    w.gba.protocol.Ready ∧
    w.gcr.data.classical.protocol.Ready := by
  exact
    ⟨gate_state_requires_ready_protocol w.qda,
     gate_state_requires_ready_protocol w.qba,
     gate_state_requires_ready_protocol w.gba,
     gcr_state_requires_ready_protocol w.gcr⟩

theorem classical_resolution_blocks_qgr
    {Beta Level Scope ClassicalCarrier : Type u}
    {w : World Beta Level Scope ClassicalCarrier}
    (hClassical : ClassicalResolutionAvailable w) :
    ¬ QGRLive w := by
  intro hQGR
  have hD : w.gcr.state = Disposition.discharged := hClassical.2.2.2
  have hV : w.gcr.state = Disposition.violated := hQGR.2.2.2
  rw [hD] at hV
  cases hV

theorem open_gcr_blocks_qgr
    {Beta Level Scope ClassicalCarrier : Type u}
    {w : World Beta Level Scope ClassicalCarrier}
    (hOpen : QGRPressureSurface w) :
    ¬ QGRLive w := by
  intro hQGR
  have hO : w.gcr.state = Disposition.open := hOpen.2.2.2
  have hV : w.gcr.state = Disposition.violated := hQGR.2.2.2
  rw [hO] at hV
  cases hV

theorem qda_not_discharged_blocks_qgr
    {Beta Level Scope ClassicalCarrier : Type u}
    {w : World Beta Level Scope ClassicalCarrier}
    (h : w.qda.state ≠ Disposition.discharged) :
    ¬ QGRLive w := by
  intro hQGR
  exact h hQGR.1

theorem qba_not_discharged_blocks_qgr
    {Beta Level Scope ClassicalCarrier : Type u}
    {w : World Beta Level Scope ClassicalCarrier}
    (h : w.qba.state ≠ Disposition.discharged) :
    ¬ QGRLive w := by
  intro hQGR
  exact h hQGR.2.1

theorem gba_not_discharged_blocks_qgr
    {Beta Level Scope ClassicalCarrier : Type u}
    {w : World Beta Level Scope ClassicalCarrier}
    (h : w.gba.state ≠ Disposition.discharged) :
    ¬ QGRLive w := by
  intro hQGR
  exact h hQGR.2.2.1

/--
Once QDA/QBA/GBA are discharged, the GCR disposition exhausts the three
headline regimes at the same frozen charge.
-/
theorem active_charge_regime_coverage
    {Beta Level Scope ClassicalCarrier : Type u}
    (w : World Beta Level Scope ClassicalCarrier)
    (hQDA : w.qda.state = Disposition.discharged)
    (hQBA : w.qba.state = Disposition.discharged)
    (hGBA : w.gba.state = Disposition.discharged) :
    ClassicalResolutionAvailable w
    ∨ QGRLive w
    ∨ QGRPressureSurface w := by
  by_cases hD : w.gcr.state = Disposition.discharged
  · exact Or.inl ⟨hQDA, hQBA, hGBA, hD⟩
  · have hCases := disposition_not_discharged_cases w.gcr.state hD
    cases hCases with
    | inl hV =>
        exact Or.inr (Or.inl ⟨hQDA, hQBA, hGBA, hV⟩)
    | inr hO =>
        exact Or.inr (Or.inr ⟨hQDA, hQBA, hGBA, hO⟩)

/-! --------------------------------------------------------------------------
GCR certificate extraction and experimental-verdict firewall
---------------------------------------------------------------------------- -/

theorem gcr_discharged_has_faithful_classical_carrier
    {Beta Level Scope ClassicalCarrier : Type u}
    {charge : Charge Beta Level Scope}
    {g : GCRContract charge ClassicalCarrier}
    (h : g.state = Disposition.discharged) :
    ∃ c,
      g.data.classical.admissible c ∧
      g.data.classical.faithful c := by
  have hw := g.warrant.1 h
  exact hw.2

theorem gcr_violated_declared_class_exhausted
    {Beta Level Scope ClassicalCarrier : Type u}
    {charge : Charge Beta Level Scope}
    {g : GCRContract charge ClassicalCarrier}
    (h : g.state = Disposition.violated) :
    g.data.classical.protocol.Ready ∧
    (∃ c, g.data.classical.admissible c) ∧
    ∀ c,
      g.data.classical.admissible c →
      ¬ g.data.classical.faithful c := by
  have hw := g.warrant.2.1 h
  exact ⟨hw.1, g.data.classical.nonemptyClass, hw.2⟩

theorem faithful_classical_carrier_blocks_gcr_violation
    {Beta Level Scope ClassicalCarrier : Type u}
    {charge : Charge Beta Level Scope}
    {g : GCRContract charge ClassicalCarrier}
    (hWitness :
      ∃ c,
        g.data.classical.admissible c ∧
        g.data.classical.faithful c) :
    g.state ≠ Disposition.violated := by
  intro hV
  rcases hWitness with ⟨c, hAdmissible, hFaithful⟩
  have hExhausted := (gcr_violated_declared_class_exhausted hV).2.2 c
  exact (hExhausted hAdmissible) hFaithful

/-!
A single excluded classical model does NOT establish GCR violation.
The countermodel below has two admitted classical carriers:
* one fails faithfulness;
* one remains faithful.
Therefore one model exclusion is compatible with GCR DISCHARGED.
-/
inductive DemoBeta where
  | beta
deriving DecidableEq, Repr

inductive DemoLevel where
  | level
deriving DecidableEq, Repr

inductive DemoScope where
  | scope
deriving DecidableEq, Repr


def demoCharge : Charge DemoBeta DemoLevel DemoScope :=
  ⟨.beta, .level, .scope⟩


def readyEvidenceProtocol : EvidenceProtocol where
  independentlyDeclared := True
  criterionFrozen := True
  verdictRuleFrozen := True
  preOutcomeFrozen := True
  nonCircular := True
  auditable := True


def readyGCRProtocol : GCRProtocol where
  independentlyDeclared := True
  classDefinitionFrozen := True
  classCoverageWarrant := True
  faithfulnessCriterionFrozen := True
  exclusionRuleFrozen := True
  preOutcomeFrozen := True
  nonCircular := True
  auditable := True

theorem readyGCRProtocol_ready : readyGCRProtocol.Ready := by
  simp [GCRProtocol.Ready, readyGCRProtocol]

inductive TwoCarrier where
  | rejected
  | survivor
deriving DecidableEq, Repr


def twoCarrierAdmissible : TwoCarrier → Prop :=
  fun _ => True


def twoCarrierFaithful : TwoCarrier → Prop
  | .rejected => False
  | .survivor => True


def twoCarrierClass : ClassicalGravityClass demoCharge TwoCarrier where
  protocol := readyGCRProtocol
  admissible := twoCarrierAdmissible
  faithful := twoCarrierFaithful
  nonemptyClass := ⟨.rejected, trivial⟩


def twoCarrierGCRData : GCRData demoCharge TwoCarrier where
  classical := twoCarrierClass
  unresolved := False


def twoCarrierGCR : GCRContract demoCharge TwoCarrier where
  data := twoCarrierGCRData
  state := .discharged
  warrant := by
    constructor
    · intro _
      exact
        ⟨readyGCRProtocol_ready,
         ⟨.survivor, trivial, trivial⟩⟩
    constructor
    · intro h
      cases h
    · intro h
      cases h


theorem one_classical_model_can_fail_while_gcr_is_discharged :
    (
      twoCarrierGCR.data.classical.admissible TwoCarrier.rejected
      ∧ ¬ twoCarrierGCR.data.classical.faithful TwoCarrier.rejected
    )
    ∧ twoCarrierGCR.state = Disposition.discharged := by
  constructor
  · constructor
    · change True
      trivial
    · intro hFaithful
      change False at hFaithful
      exact hFaithful
  · rfl

/-! --------------------------------------------------------------------------
No-free-QG-output firewall
---------------------------------------------------------------------------- -/

inductive DemoClassicalCarrier where
  | classicalCandidate
deriving DecidableEq, Repr


def positiveGate : Gate demoCharge where
  protocol := readyEvidenceProtocol
  positive := True
  negative := False
  unresolved := False
  positive_negative_incompatible := by simp
  state := .discharged
  warrant := by
    constructor
    · intro _
      exact
        ⟨by simp [EvidenceProtocol.Ready, readyEvidenceProtocol],
         trivial⟩
    constructor
    · intro h
      cases h
    · intro h
      cases h


def liveDemoClass : ClassicalGravityClass demoCharge DemoClassicalCarrier where
  protocol := readyGCRProtocol
  admissible := fun _ => True
  faithful := fun _ => False
  nonemptyClass := ⟨.classicalCandidate, trivial⟩


def liveDemoGCRData : GCRData demoCharge DemoClassicalCarrier where
  classical := liveDemoClass
  unresolved := False


def liveDemoGCR : GCRContract demoCharge DemoClassicalCarrier where
  data := liveDemoGCRData
  state := .violated
  warrant := by
    constructor
    · intro h
      cases h
    constructor
    · intro _
      constructor
      · exact readyGCRProtocol_ready
      · intro c hAdmissible
        cases c
        simp [liveDemoGCRData, liveDemoClass] at hAdmissible ⊢
    · intro h
      cases h


def qgrLiveNoOutputWorld :
    World DemoBeta DemoLevel DemoScope DemoClassicalCarrier where
  charge := demoCharge
  qda := positiveGate
  qba := positiveGate
  gba := positiveGate
  gcr := liveDemoGCR
  outputHolds := fun _ => False


theorem qgrLiveNoOutputWorld_is_live :
    QGRLive qgrLiveNoOutputWorld := by
  exact ⟨rfl, rfl, rfl, rfl⟩


theorem qgr_live_does_not_entail_candidate_output
    (o : CandidateOutput) :
    ¬ (
      ∀ w : World DemoBeta DemoLevel DemoScope DemoClassicalCarrier,
        QGRLive w → w.outputHolds o
    ) := by
  intro hUniversal
  have hOutput :=
    hUniversal qgrLiveNoOutputWorld qgrLiveNoOutputWorld_is_live
  change False at hOutput
  exact hOutput


theorem qgr_live_no_free_outputs_checkpoint :
    QGRLive qgrLiveNoOutputWorld
    ∧
    (∀ o : CandidateOutput,
      ¬ qgrLiveNoOutputWorld.outputHolds o) := by
  constructor
  · exact qgrLiveNoOutputWorld_is_live
  · intro o
    simp [qgrLiveNoOutputWorld]

/-! --------------------------------------------------------------------------
Adversarial closure checkpoint
---------------------------------------------------------------------------- -/

/--
The machine-visible closure package now simultaneously establishes:
* one exact dependent charge for QDA/QBA/GBA/GCR;
* every live trigger carries ready frozen evidence protocols;
* a nonempty exhausted classical class under GCR violation;
* one-model exclusion is insufficient;
* no candidate ontology follows for free.
-/
theorem qgr_trigger_contract_checkpoint :
    QGRLive qgrLiveNoOutputWorld
    ∧
    qgrLiveNoOutputWorld.qda.protocol.Ready
    ∧
    qgrLiveNoOutputWorld.qba.protocol.Ready
    ∧
    qgrLiveNoOutputWorld.gba.protocol.Ready
    ∧
    qgrLiveNoOutputWorld.gcr.data.classical.protocol.Ready
    ∧
    twoCarrierGCR.state = Disposition.discharged
    ∧
    (
      ∀ o : CandidateOutput,
        ¬ qgrLiveNoOutputWorld.outputHolds o
    ) := by
  constructor
  · exact qgrLiveNoOutputWorld_is_live
  constructor
  · exact gate_state_requires_ready_protocol qgrLiveNoOutputWorld.qda
  constructor
  · exact gate_state_requires_ready_protocol qgrLiveNoOutputWorld.qba
  constructor
  · exact gate_state_requires_ready_protocol qgrLiveNoOutputWorld.gba
  constructor
  · exact gcr_state_requires_ready_protocol qgrLiveNoOutputWorld.gcr
  constructor
  · rfl
  · intro o
    simp [qgrLiveNoOutputWorld]

end QGRTrigger

-- Experimental adjudication layer begins here.

namespace QGRCGEX

open UniversalTranslationContract
open QGRTrigger

universe u

/-! --------------------------------------------------------------------------
Frozen bounded protocol family
---------------------------------------------------------------------------- -/

/--
One bounded experimental protocol packet, dependently pinned to the exact
parent scope key.

The propositions are domain-owned premises. Lean only prevents them from
silently disappearing once an experiment claims to use this protocol.

`tRoutingDeclared` is an upstream Structural Flow consistency guard for a
realized source/probe effect; it adds no empirical fact.

`mediatingProcessOperationalOnly` prevents process language from silently
importing a particle, metric, graviton, or other gravity ontology.
-/
structure ProtocolFamily
    {Beta Level Scope : Type u}
    (charge : Charge Beta Level Scope) where
  independentlyDeclared : Prop
  boundedInterventionSetFrozen : Prop
  samePhysicalSystems : Prop
  sameGravitySideJob : Prop
  sameLevelAndScope : Prop

  preparationsFrozen : Prop
  readoutsFrozen : Prop
  geometryTimeScanFrozen : Prop
  coherentDephasedControlsFrozen : Prop
  gravitySuppressedControlsFrozen : Prop
  proceduralMixtureIdentitiesFrozen : Prop
  environmentMonitorsFrozen : Prop

  primaryWitnessFrozen : Prop
  confidenceRuleFrozen : Prop
  oneCommonConfidenceObject : Prop
  nuisanceTreatmentFrozen : Prop
  modelParameterDomainsFrozen : Prop
  exclusionRulesFrozen : Prop
  stopRulesFrozen : Prop
  calibrationTransferRulesFrozen : Prop
  missingDataRuleFrozen : Prop
  multipleTestingRuleFrozen : Prop

  singleParameterizationJointFitRuleFrozen : Prop
  noPostOutcomeRetuning : Prop

  tRoutingDeclared : Prop
  gravitySideJobRepresentationNeutral : Prop
  mediatingProcessOperationalOnly : Prop

  nonCircular : Prop
  auditable : Prop


def ProtocolFamily.Ready
    {Beta Level Scope : Type u}
    {charge : Charge Beta Level Scope}
    (p : ProtocolFamily charge) : Prop :=
  p.independentlyDeclared ∧
  p.boundedInterventionSetFrozen ∧
  p.samePhysicalSystems ∧
  p.sameGravitySideJob ∧
  p.sameLevelAndScope ∧
  p.preparationsFrozen ∧
  p.readoutsFrozen ∧
  p.geometryTimeScanFrozen ∧
  p.coherentDephasedControlsFrozen ∧
  p.gravitySuppressedControlsFrozen ∧
  p.proceduralMixtureIdentitiesFrozen ∧
  p.environmentMonitorsFrozen ∧
  p.primaryWitnessFrozen ∧
  p.confidenceRuleFrozen ∧
  p.oneCommonConfidenceObject ∧
  p.nuisanceTreatmentFrozen ∧
  p.modelParameterDomainsFrozen ∧
  p.exclusionRulesFrozen ∧
  p.stopRulesFrozen ∧
  p.calibrationTransferRulesFrozen ∧
  p.missingDataRuleFrozen ∧
  p.multipleTestingRuleFrozen ∧
  p.singleParameterizationJointFitRuleFrozen ∧
  p.noPostOutcomeRetuning ∧
  p.tRoutingDeclared ∧
  p.gravitySideJobRepresentationNeutral ∧
  p.mediatingProcessOperationalOnly ∧
  p.nonCircular ∧
  p.auditable

/-! --------------------------------------------------------------------------
Six experiment blocks
---------------------------------------------------------------------------- -/

inductive BlockKind where
  | L  -- endpoint/interface linearity and preparation consistency
  | G  -- gravity attribution + realized-consequence routing
  | P  -- standard-interface classical process exclusion
  | B  -- quantum-bypass exclusion
  | N  -- nonlocal/correlated classical-mediation exclusion
  | I  -- irreversibility/noise branch exclusion
deriving DecidableEq, Repr

/--
Generic evidence block at one exact charge.

For every block:
* DISCHARGED = the corresponding experimental requirement has been met;
* VIOLATED   = a blocking or counter-result has been established;
* OPEN       = the requirement remains unresolved.

The physics meaning of the evidence propositions is supplied by the block
constructor used downstream.  The machine only enforces the three-way verdict
discipline and the frozen evidence protocol.
-/
structure Block
    {Beta Level Scope : Type u}
    (charge : Charge Beta Level Scope)
    (kind : BlockKind) where
  protocol : EvidenceProtocol

  dischargedEvidence : Prop
  violatedEvidence : Prop
  unresolvedEvidence : Prop

  discharged_violated_incompatible :
    ¬ (dischargedEvidence ∧ violatedEvidence)

  state : Disposition

  warrant :
    (state = Disposition.discharged →
      protocol.Ready ∧ dischargedEvidence) ∧
    (state = Disposition.violated →
      protocol.Ready ∧ violatedEvidence) ∧
    (state = Disposition.open →
      protocol.Ready ∧ unresolvedEvidence)


theorem block_state_requires_ready_protocol
    {Beta Level Scope : Type u}
    {charge : Charge Beta Level Scope}
    {kind : BlockKind}
    (b : Block charge kind) :
    b.protocol.Ready := by
  by_cases hD : b.state = Disposition.discharged
  · exact (b.warrant.1 hD).1
  · have hCases := disposition_not_discharged_cases b.state hD
    cases hCases with
    | inl hV =>
        exact (b.warrant.2.1 hV).1
    | inr hO =>
        exact (b.warrant.2.2 hO).1

/-! --------------------------------------------------------------------------
Experiment world — every block shares the parent QGR charge
---------------------------------------------------------------------------- -/

structure ExperimentWorld
    (Beta Level Scope ClassicalCarrier : Type u) where
  parent : QGRTrigger.World Beta Level Scope ClassicalCarrier

  protocol : ProtocolFamily parent.charge

  lBlock : Block parent.charge .L
  gBlock : Block parent.charge .G
  pBlock : Block parent.charge .P
  bBlock : Block parent.charge .B
  nBlock : Block parent.charge .N
  iBlock : Block parent.charge .I

/-!
The dependent types above are the same-charge pin:
all six experiment blocks and the protocol family literally use
`parent.charge`.
-/

/-! --------------------------------------------------------------------------
Decision-order objects
---------------------------------------------------------------------------- -/

/--
Channel/process classicality machinery is permitted only after the endpoint
interface and gravity attribution have both discharged.
-/
def ProcessInferenceReady
    {Beta Level Scope ClassicalCarrier : Type u}
    (e : ExperimentWorld Beta Level Scope ClassicalCarrier) : Prop :=
  e.lBlock.state = Disposition.discharged ∧
  e.gBlock.state = Disposition.discharged

/--
The standard-interface classical gravity-side process class has been excluded
only when L and G are discharged and the P block itself is discharged.
-/
def StandardProcessClassExcluded
    {Beta Level Scope ClassicalCarrier : Type u}
    (e : ExperimentWorld Beta Level Scope ClassicalCarrier) : Prop :=
  ProcessInferenceReady e ∧
  e.pBlock.state = Disposition.discharged

/--
All six discriminator requirements have discharged in the required logical
order. This still does NOT, by itself, establish classical-gravity
representability failure. Comparison-class coverage remains explicit below.
-/
def SixBlockExhaustion
    {Beta Level Scope ClassicalCarrier : Type u}
    (e : ExperimentWorld Beta Level Scope ClassicalCarrier) : Prop :=
  e.protocol.Ready ∧
  e.lBlock.state = Disposition.discharged ∧
  e.gBlock.state = Disposition.discharged ∧
  e.pBlock.state = Disposition.discharged ∧
  e.bBlock.state = Disposition.discharged ∧
  e.nBlock.state = Disposition.discharged ∧
  e.iBlock.state = Disposition.discharged

/-! --------------------------------------------------------------------------
Explicit residual / class-coverage bridge
---------------------------------------------------------------------------- -/

/--
The six experimental blocks do not, by themselves, exhaust "classical
gravity."

This bridge must be supplied by the physics/domain analysis before the
experiment may change the parent classical-gravity-representability verdict.

The fields require explicit coverage of:
* the standard local classical-process class;
* alternate quantum-information paths;
* nonlocal/correlated classical alternatives;
* nonlinear or nonstandard quantum-interface alternatives;
* operational-classicality translation/audit cases;
* stochastic, irreversible, decohering, or diffusive alternatives;
* and the match between those routes and the exact parent admitted comparison
  class, faithfulness criterion, and exclusion rule.
-/
structure CoverageBridge
    {Beta Level Scope ClassicalCarrier : Type u}
    (e : ExperimentWorld Beta Level Scope ClassicalCarrier) where
  independentlyDeclared : Prop
  residualPartitionFrozen : Prop

  standardProcessClassCovered : Prop
  quantumBypassBranchCovered : Prop
  nonlocalCorrelatedBranchCovered : Prop
  endpointInterfaceBranchCovered : Prop
  operationalClassicalityAuditsCovered : Prop
  irreversibilityNoiseBranchCovered : Prop

  parentGCRClassMatched : Prop
  parentFaithfulnessCriterionMatched : Prop
  parentExclusionRuleMatched : Prop

  representationNeutralClassicality : Prop
  noMetricGRRestriction : Prop

  preOutcomeFrozen : Prop
  nonCircular : Prop
  auditable : Prop


def CoverageBridge.Ready
    {Beta Level Scope ClassicalCarrier : Type u}
    {e : ExperimentWorld Beta Level Scope ClassicalCarrier}
    (c : CoverageBridge e) : Prop :=
  c.independentlyDeclared ∧
  c.residualPartitionFrozen ∧
  c.standardProcessClassCovered ∧
  c.quantumBypassBranchCovered ∧
  c.nonlocalCorrelatedBranchCovered ∧
  c.endpointInterfaceBranchCovered ∧
  c.operationalClassicalityAuditsCovered ∧
  c.irreversibilityNoiseBranchCovered ∧
  c.parentGCRClassMatched ∧
  c.parentFaithfulnessCriterionMatched ∧
  c.parentExclusionRuleMatched ∧
  c.representationNeutralClassicality ∧
  c.noMetricGRRestriction ∧
  c.preOutcomeFrozen ∧
  c.nonCircular ∧
  c.auditable

/--
The final experiment-to-classical-representability bridge is deliberately
domain-owned.

Lean does not derive the physical claim that discriminator closure plus the
coverage bridge excludes every admitted classical representation. The physics
artifact must supply that implication explicitly. The machine only checks the
conditional use of that premise.
-/
structure GCRPromotion
    {Beta Level Scope ClassicalCarrier : Type u}
    (e : ExperimentWorld Beta Level Scope ClassicalCarrier)
    (coverage : CoverageBridge e) where
  implicationFrozenBeforeOutcome : Prop
  sixBlockAndCoverageImpliesParentGCRViolation :
    SixBlockExhaustion e →
    coverage.Ready →
    e.parent.gcr.state = Disposition.violated


def ExperimentClosure
    {Beta Level Scope ClassicalCarrier : Type u}
    {e : ExperimentWorld Beta Level Scope ClassicalCarrier}
    (coverage : CoverageBridge e)
    (promotion : GCRPromotion e coverage) : Prop :=
  SixBlockExhaustion e ∧
  coverage.Ready ∧
  promotion.implicationFrozenBeforeOutcome

/-! --------------------------------------------------------------------------
Machine firewalls
---------------------------------------------------------------------------- -/

theorem linearity_not_discharged_blocks_process_ready
    {Beta Level Scope ClassicalCarrier : Type u}
    {e : ExperimentWorld Beta Level Scope ClassicalCarrier}
    (hL : e.lBlock.state ≠ Disposition.discharged) :
    ¬ ProcessInferenceReady e := by
  intro hReady
  exact hL hReady.1


theorem gravity_not_discharged_blocks_process_ready
    {Beta Level Scope ClassicalCarrier : Type u}
    {e : ExperimentWorld Beta Level Scope ClassicalCarrier}
    (hG : e.gBlock.state ≠ Disposition.discharged) :
    ¬ ProcessInferenceReady e := by
  intro hReady
  exact hG hReady.2


theorem process_not_discharged_blocks_six_block_exhaustion
    {Beta Level Scope ClassicalCarrier : Type u}
    {e : ExperimentWorld Beta Level Scope ClassicalCarrier}
    (hP : e.pBlock.state ≠ Disposition.discharged) :
    ¬ SixBlockExhaustion e := by
  intro hAll
  exact hP hAll.2.2.2.1


theorem bypass_not_discharged_blocks_six_block_exhaustion
    {Beta Level Scope ClassicalCarrier : Type u}
    {e : ExperimentWorld Beta Level Scope ClassicalCarrier}
    (hB : e.bBlock.state ≠ Disposition.discharged) :
    ¬ SixBlockExhaustion e := by
  intro hAll
  exact hB hAll.2.2.2.2.1


theorem nonlocal_not_discharged_blocks_six_block_exhaustion
    {Beta Level Scope ClassicalCarrier : Type u}
    {e : ExperimentWorld Beta Level Scope ClassicalCarrier}
    (hN : e.nBlock.state ≠ Disposition.discharged) :
    ¬ SixBlockExhaustion e := by
  intro hAll
  exact hN hAll.2.2.2.2.2.1


theorem irreversibility_not_discharged_blocks_six_block_exhaustion
    {Beta Level Scope ClassicalCarrier : Type u}
    {e : ExperimentWorld Beta Level Scope ClassicalCarrier}
    (hI : e.iBlock.state ≠ Disposition.discharged) :
    ¬ SixBlockExhaustion e := by
  intro hAll
  exact hI hAll.2.2.2.2.2.2


theorem experiment_closure_promotes_parent_gcr
    {Beta Level Scope ClassicalCarrier : Type u}
    {e : ExperimentWorld Beta Level Scope ClassicalCarrier}
    {coverage : CoverageBridge e}
    {promotion : GCRPromotion e coverage}
    (h : ExperimentClosure coverage promotion) :
    e.parent.gcr.state = Disposition.violated := by
  exact promotion.sixBlockAndCoverageImpliesParentGCRViolation h.1 h.2.1


/--
Final experiment-to-QGR theorem.

Even complete experimental closure does not produce QGR LIVE unless the parent
QDA, QBA, and GBA gates are independently DISCHARGED.
-/
theorem experiment_closure_qgr_live
    {Beta Level Scope ClassicalCarrier : Type u}
    {e : ExperimentWorld Beta Level Scope ClassicalCarrier}
    {coverage : CoverageBridge e}
    {promotion : GCRPromotion e coverage}
    (hExp : ExperimentClosure coverage promotion)
    (hQDA : e.parent.qda.state = Disposition.discharged)
    (hQBA : e.parent.qba.state = Disposition.discharged)
    (hGBA : e.parent.gba.state = Disposition.discharged) :
    QGRTrigger.QGRLive e.parent := by
  exact
    ⟨hQDA,
     hQBA,
     hGBA,
     experiment_closure_promotes_parent_gcr hExp⟩

/-! --------------------------------------------------------------------------
Protocol-readiness extraction
---------------------------------------------------------------------------- -/

theorem six_block_exhaustion_has_ready_block_protocols
    {Beta Level Scope ClassicalCarrier : Type u}
    {e : ExperimentWorld Beta Level Scope ClassicalCarrier}
    (_h : SixBlockExhaustion e) :
    e.lBlock.protocol.Ready ∧
    e.gBlock.protocol.Ready ∧
    e.pBlock.protocol.Ready ∧
    e.bBlock.protocol.Ready ∧
    e.nBlock.protocol.Ready ∧
    e.iBlock.protocol.Ready := by
  exact
    ⟨block_state_requires_ready_protocol e.lBlock,
     block_state_requires_ready_protocol e.gBlock,
     block_state_requires_ready_protocol e.pBlock,
     block_state_requires_ready_protocol e.bBlock,
     block_state_requires_ready_protocol e.nBlock,
     block_state_requires_ready_protocol e.iBlock⟩

/-! --------------------------------------------------------------------------
Semantic scope notes encoded as propositions, not physics facts
---------------------------------------------------------------------------- -/

/--
A compact carrier for interpretation firewalls corresponding to Sections 2
and 7 of the human artifact.

These propositions are not used to prove physics. They record intended scope
for downstream machine artifacts without altering the Universal Kernel.
-/
structure InterpretationFirewall
    {Beta Level Scope ClassicalCarrier : Type u}
    (e : ExperimentWorld Beta Level Scope ClassicalCarrier) where
  gbaMeansGravitySidePhysicalJob : Prop
  noClassicalGRObjectInheritance : Prop
  noMetricPersistenceInference : Prop
  noGravitonInference : Prop
  noQuantumGeometryInference : Prop
  noPeerForceOntologyInference : Prop
  qgrLiveStillLeavesAnswerOpen : Prop
  tRoutingAppliesToRealizedEffect : Prop


end QGRCGEX

namespace QGRCGEXAdversarial

open UniversalTranslationContract
open QGRTrigger
open QGRCGEX

universe u

/-!
ADVERSARIAL FIREWALL CHECKS

This adversarial module checks six prohibited inferences:

1. standard-process exclusion with an OPEN quantum bypass is insufficient;
2. failed interface/preparation consistency blocks the standard process
   inference;
3. unresolved gravity attribution blocks the standard process inference;
4. all six experimental discriminator results still do not establish exhaustion
   of the parent classical comparison class without CoverageBridge;
5. experimental closure does not replace the independent quantum-description,
   load-bearing-quantum-structure, or gravity-attribution parent gates;
6. even a fully promoted quantum-gravity requirement entails no frozen
   microscopic ontology output.

No physics premise is added here.
-/

/-! --------------------------------------------------------------------------
Universal blocker theorems
---------------------------------------------------------------------------- -/

theorem p_discharged_bypass_open_still_blocks_exhaustion
    {Beta Level Scope ClassicalCarrier : Type u}
    {e : ExperimentWorld Beta Level Scope ClassicalCarrier}
    (_hP : e.pBlock.state = Disposition.discharged)
    (hB : e.bBlock.state = Disposition.open) :
    ¬ SixBlockExhaustion e := by
  intro hAll
  have hBD : e.bBlock.state = Disposition.discharged := hAll.2.2.2.2.1
  rw [hB] at hBD
  cases hBD


theorem linearity_violated_blocks_process_inference
    {Beta Level Scope ClassicalCarrier : Type u}
    {e : ExperimentWorld Beta Level Scope ClassicalCarrier}
    (hL : e.lBlock.state = Disposition.violated) :
    ¬ ProcessInferenceReady e := by
  intro hReady
  have hLD : e.lBlock.state = Disposition.discharged := hReady.1
  rw [hL] at hLD
  cases hLD


theorem gravity_open_blocks_process_inference
    {Beta Level Scope ClassicalCarrier : Type u}
    {e : ExperimentWorld Beta Level Scope ClassicalCarrier}
    (hG : e.gBlock.state = Disposition.open) :
    ¬ ProcessInferenceReady e := by
  intro hReady
  have hGD : e.gBlock.state = Disposition.discharged := hReady.2
  rw [hG] at hGD
  cases hGD


theorem experiment_closure_requires_coverage_ready
    {Beta Level Scope ClassicalCarrier : Type u}
    {e : ExperimentWorld Beta Level Scope ClassicalCarrier}
    {coverage : CoverageBridge e}
    {promotion : GCRPromotion e coverage}
    (h : ExperimentClosure coverage promotion) :
    coverage.Ready := by
  exact h.2.1


theorem experiment_closure_does_not_replace_parent_gates
    {Beta Level Scope ClassicalCarrier : Type u}
    {e : ExperimentWorld Beta Level Scope ClassicalCarrier}
    {coverage : CoverageBridge e}
    {promotion : GCRPromotion e coverage}
    (_hExp : ExperimentClosure coverage promotion) :
    (e.parent.qda.state ≠ Disposition.discharged →
      ¬ QGRTrigger.QGRLive e.parent)
    ∧
    (e.parent.qba.state ≠ Disposition.discharged →
      ¬ QGRTrigger.QGRLive e.parent)
    ∧
    (e.parent.gba.state ≠ Disposition.discharged →
      ¬ QGRTrigger.QGRLive e.parent) := by
  constructor
  · intro h
    exact QGRTrigger.qda_not_discharged_blocks_qgr h
  constructor
  · intro h
    exact QGRTrigger.qba_not_discharged_blocks_qgr h
  · intro h
    exact QGRTrigger.gba_not_discharged_blocks_qgr h

/-! --------------------------------------------------------------------------
Concrete ready protocol objects used only for countermodels
---------------------------------------------------------------------------- -/

def adversarialProtocolFamily :
    ProtocolFamily QGRTrigger.demoCharge where
  independentlyDeclared := True
  boundedInterventionSetFrozen := True
  samePhysicalSystems := True
  sameGravitySideJob := True
  sameLevelAndScope := True

  preparationsFrozen := True
  readoutsFrozen := True
  geometryTimeScanFrozen := True
  coherentDephasedControlsFrozen := True
  gravitySuppressedControlsFrozen := True
  proceduralMixtureIdentitiesFrozen := True
  environmentMonitorsFrozen := True

  primaryWitnessFrozen := True
  confidenceRuleFrozen := True
  oneCommonConfidenceObject := True
  nuisanceTreatmentFrozen := True
  modelParameterDomainsFrozen := True
  exclusionRulesFrozen := True
  stopRulesFrozen := True
  calibrationTransferRulesFrozen := True
  missingDataRuleFrozen := True
  multipleTestingRuleFrozen := True

  singleParameterizationJointFitRuleFrozen := True
  noPostOutcomeRetuning := True

  tRoutingDeclared := True
  gravitySideJobRepresentationNeutral := True
  mediatingProcessOperationalOnly := True

  nonCircular := True
  auditable := True


theorem adversarialProtocolFamily_ready :
    adversarialProtocolFamily.Ready := by
  simp [ProtocolFamily.Ready, adversarialProtocolFamily]


def dischargedBlock (kind : BlockKind) :
    Block QGRTrigger.demoCharge kind where
  protocol := QGRTrigger.readyEvidenceProtocol

  dischargedEvidence := True
  violatedEvidence := False
  unresolvedEvidence := False

  discharged_violated_incompatible := by
    simp

  state := Disposition.discharged

  warrant := by
    constructor
    · intro _
      exact
        ⟨by
           simp [EvidenceProtocol.Ready, QGRTrigger.readyEvidenceProtocol],
         trivial⟩
    constructor
    · intro h
      cases h
    · intro h
      cases h

/-! --------------------------------------------------------------------------
Attack 4: all six discriminator blocks alone do not entail comparison-class exhaustion
---------------------------------------------------------------------------- -/

def sixOnlyParent :
    QGRTrigger.World
      QGRTrigger.DemoBeta
      QGRTrigger.DemoLevel
      QGRTrigger.DemoScope
      QGRTrigger.TwoCarrier where
  charge := QGRTrigger.demoCharge
  qda := QGRTrigger.positiveGate
  qba := QGRTrigger.positiveGate
  gba := QGRTrigger.positiveGate
  gcr := QGRTrigger.twoCarrierGCR
  outputHolds := fun _ => False


def sixOnlyExperiment :
    ExperimentWorld
      QGRTrigger.DemoBeta
      QGRTrigger.DemoLevel
      QGRTrigger.DemoScope
      QGRTrigger.TwoCarrier where
  parent := sixOnlyParent
  protocol := adversarialProtocolFamily
  lBlock := dischargedBlock .L
  gBlock := dischargedBlock .G
  pBlock := dischargedBlock .P
  bBlock := dischargedBlock .B
  nBlock := dischargedBlock .N
  iBlock := dischargedBlock .I


theorem sixOnlyExperiment_has_six_block_exhaustion :
    SixBlockExhaustion sixOnlyExperiment := by
  exact
    ⟨adversarialProtocolFamily_ready,
     rfl,
     rfl,
     rfl,
     rfl,
     rfl,
     rfl⟩


theorem six_blocks_alone_do_not_entail_parent_gcr_violation :
    ¬ (
      SixBlockExhaustion sixOnlyExperiment →
      sixOnlyExperiment.parent.gcr.state = Disposition.violated
    ) := by
  intro h
  have hV :=
    h sixOnlyExperiment_has_six_block_exhaustion
  change Disposition.discharged = Disposition.violated at hV
  cases hV

/-! --------------------------------------------------------------------------
Attack 6: full conditional promotion still gives no microscopic ontology
---------------------------------------------------------------------------- -/

def closedExperiment :
    ExperimentWorld
      QGRTrigger.DemoBeta
      QGRTrigger.DemoLevel
      QGRTrigger.DemoScope
      QGRTrigger.DemoClassicalCarrier where
  parent := QGRTrigger.qgrLiveNoOutputWorld
  protocol := adversarialProtocolFamily
  lBlock := dischargedBlock .L
  gBlock := dischargedBlock .G
  pBlock := dischargedBlock .P
  bBlock := dischargedBlock .B
  nBlock := dischargedBlock .N
  iBlock := dischargedBlock .I


theorem closedExperiment_has_six_block_exhaustion :
    SixBlockExhaustion closedExperiment := by
  exact
    ⟨adversarialProtocolFamily_ready,
     rfl,
     rfl,
     rfl,
     rfl,
     rfl,
     rfl⟩


def closedCoverage :
    CoverageBridge closedExperiment where
  independentlyDeclared := True
  residualPartitionFrozen := True

  standardProcessClassCovered := True
  quantumBypassBranchCovered := True
  nonlocalCorrelatedBranchCovered := True
  endpointInterfaceBranchCovered := True
  operationalClassicalityAuditsCovered := True
  irreversibilityNoiseBranchCovered := True

  parentGCRClassMatched := True
  parentFaithfulnessCriterionMatched := True
  parentExclusionRuleMatched := True

  representationNeutralClassicality := True
  noMetricGRRestriction := True

  preOutcomeFrozen := True
  nonCircular := True
  auditable := True


theorem closedCoverage_ready :
    closedCoverage.Ready := by
  simp [CoverageBridge.Ready, closedCoverage]


def closedPromotion :
    GCRPromotion closedExperiment closedCoverage where
  implicationFrozenBeforeOutcome := True
  sixBlockAndCoverageImpliesParentGCRViolation := by
    intro _ _
    rfl


theorem closedExperiment_closure :
    ExperimentClosure closedCoverage closedPromotion := by
  exact
    ⟨closedExperiment_has_six_block_exhaustion,
     closedCoverage_ready,
     trivial⟩


theorem closedExperiment_qgr_live :
    QGRTrigger.QGRLive closedExperiment.parent := by
  exact
    experiment_closure_qgr_live
      closedExperiment_closure
      rfl
      rfl
      rfl


theorem closed_experiment_still_has_no_free_qg_outputs :
    ExperimentClosure closedCoverage closedPromotion
    ∧
    QGRTrigger.QGRLive closedExperiment.parent
    ∧
    (
      ∀ o : QGRTrigger.CandidateOutput,
        ¬ closedExperiment.parent.outputHolds o
    ) := by
  constructor
  · exact closedExperiment_closure
  constructor
  · exact closedExperiment_qgr_live
  · intro o
    simp [closedExperiment, QGRTrigger.qgrLiveNoOutputWorld]

/-! --------------------------------------------------------------------------
Adversarial checkpoint
---------------------------------------------------------------------------- -/

theorem cgex_adversarial_checkpoint :
    SixBlockExhaustion sixOnlyExperiment
    ∧
    sixOnlyExperiment.parent.gcr.state = Disposition.discharged
    ∧
    ExperimentClosure closedCoverage closedPromotion
    ∧
    QGRTrigger.QGRLive closedExperiment.parent
    ∧
    (
      ∀ o : QGRTrigger.CandidateOutput,
        ¬ closedExperiment.parent.outputHolds o
    ) := by
  constructor
  · exact sixOnlyExperiment_has_six_block_exhaustion
  constructor
  · rfl
  constructor
  · exact closedExperiment_closure
  constructor
  · exact closedExperiment_qgr_live
  · intro o
    simp [closedExperiment, QGRTrigger.qgrLiveNoOutputWorld]


end QGRCGEXAdversarial

end StructuralFlow

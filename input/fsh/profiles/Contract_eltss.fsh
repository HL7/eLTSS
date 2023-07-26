Profile: Contract_eltss
Parent: Contract
Id: Contract-eltss
Description: "Contract for eLTSS"
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* . ^definition = "A legally enforceable, formally recorded unilateral or bilateral directive (i.e., a policy or agreement)."
* . ^mustSupport = false
* . ^isModifier = false
* extension ^slicing.discriminator.type = #type
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains $resource-pertainsToGoal named resource-pertainsToGoal 0..* MS
* extension[resource-pertainsToGoal] ^short = "The resource-pertainsToGoal relates the resource to the goal(s) that pertain to it. Whenever there is a goal associated with a health concern or problem, this extension should be present and populated in activity (event or intent) resources."

* instantiatesCanonical only Reference(Contract_eltss)
* domain only Reference(Location_eltss)
* site only Reference(Location_eltss)
* author only Reference(Patient_eltss or Practitioner_eltss or $us-core-practitionerrole or $us-core-organization)
* contentDefinition.publisher only Reference(Practitioner_eltss or $us-core-practitionerrole or $us-core-organization)
* term ^definition = "One or more Contract Provisions which may be related and conveyed as a group and may contain nested groups."
* term.offer ^definition = "The matter of concern in the context of this agreement provision."
* term.offer.party ^definition = "Recipient of the Offer"
* term.offer.party.reference only Reference(Patient_eltss or Practitioner_eltss or $us-core-practitionerrole or Group or $us-core-organization)
* term.asset.valuedItem.responsible only Reference(Patient_eltss or Practitioner_eltss or $us-core-practitionerrole or RelatedPerson or $us-core-organization)
* term.asset.valuedItem.recipient only Reference(Patient_eltss or Practitioner_eltss or $us-core-practitionerrole or RelatedPerson or $us-core-organization)
* term.action.subject ^definition = "Entity of the action to be performed."
* term.action.subject.reference only Reference(Patient_eltss or Practitioner_eltss or $us-core-practitionerrole or Group or $us-core-organization)
* term.action.context only Reference(EpisodeOfCare_eltss or $us-core-encounter)
* term.action.requester only Reference(Patient_eltss or Practitioner_eltss or $us-core-practitionerrole or Group or $us-core-organization)
* term.action.performer only Reference(Patient_eltss or Practitioner_eltss or $us-core-practitionerrole or $us-core-organization or Organization)
* term.action.reasonReference only Reference(Condition_eltss or Observation_eltss or Questionnaire_eltss or $us-core-documentreference or DiagnosticReport or QuestionnaireResponse)
* signer MS
* signer ^short = "Person, Guardian / Legal Representative, Support Planner, or Service Provider Signature"
* signer ^definition = "Person, Guardian / Legal Representative, Support Planner, or Service Provider Signature"
* signer ^comment = "FHIR includes a preferred coding for contract signatory roles, which map well to the eLTSS signatories. The primary one for the patient/beneficiary is \"PAT\" (patient), although implementers may use others as well. However, implementers must realize that type may be used to differentiate between the patient, service provider, planner, etc. so there need to be distinct role types utilized."
* signer ^isModifier = false
* signer.type ^comment = "Would probably use \"CONSENTER\" which represents \"consent signature\" in this use case."
* signer.type ^mustSupport = false
* signer.type ^isModifier = false
* signer.party only Reference(Patient_eltss or Practitioner_eltss or $us-core-practitionerrole or RelatedPerson or $us-core-organization)
* signer.party ^short = "Person, Guardian / Legal Representative, Support Planner, or Service Provider Printed Name"
* signer.party ^definition = "Person, Guardian / Legal Representative, Support Planner, or Service Provider Printed Name"
* signer.party ^comment = "Must match signature.who."
* signer.signature ^definition = "Legally binding Contract DSIG signature contents encoded in Base64."
* signer.signature.type ^comment = "Would probably use \"1.2.840.10065.1.12.1.7\" which represents \"consent signature\" in this use case."
* signer.signature.type ^mustSupport = false
* signer.signature.type ^isModifier = false
* signer.signature.when ^short = "Person, Guardian / Legal Representative, Support Planner, or Service Provider Signature Date"
* signer.signature.when ^definition = "Person, Guardian / Legal Representative, Support Planner, or Service Provider Signature Date"
* signer.signature.when ^mustSupport = false
* signer.signature.when ^isModifier = false
* signer.signature.who only Reference(PractitionerRole or RelatedPerson or Organization or Practitioner_eltss or Patient_eltss)
* signer.signature.who ^short = "Person, Guardian/Legal Representative, Support Planner, or Service Provider Printed Name"
* signer.signature.who ^definition = "Person, Guardian / Legal Representative, Support Planner, or Service Provider Signature"
* signer.signature.who ^comment = "Must match signer.party."
* signer.signature.who ^mustSupport = false
* signer.signature.who ^isModifier = false
* rule ^definition = "List of Computable Policy Rule Language Representation(s) of this Contract."
* rule.content[x] ^short = "Computable Contract Rule(s)"
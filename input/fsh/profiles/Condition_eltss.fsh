Profile: Condition_eltss
Parent: $us-core-condition
Id: Condition-eltss
Description: "Condition for eLTSS"
* ^status = #active
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* . ^definition = "The eLTSS Condition Profile is based upon the US Core FHIR Condition Resource and created to meet the 2015 Edition Common Clinical Data Set 'Problems' and 'Health Concerns' requirements."
* extension ^slicing.discriminator[0].type = #value
* extension ^slicing.discriminator[=].path = "url"
* extension ^slicing.rules = #open
* extension contains $resource-pertainsToGoal named resource-pertainsToGoal 0..* MS and ELTSS_dueTo named dueTo 0..*
* extension[resource-pertainsToGoal] ^short = "The resource-pertainsToGoal relates the resource to the goal(s) that pertain to it. Whenever there is a goal associated with a health concern or problem, this extension should be present and populated in activity (event or intent) resources."
* extension[dueTo] ^sliceIsConstraining = false

* extension contains $condition-assertedDate named assertedDate 0..1 MS
* extension[assertedDate] ^short = "Date the condition was first asserted"
* clinicalStatus MS
* clinicalStatus from $condition-clinical-values (required)
* verificationStatus MS
* verificationStatus from $condition-ver-status-values (required)

//* category ^code.system = "http://hl7.org/fhir/us/eltss/ValueSet/eltss-condition-category-code"
* category ^short = "Assessed Need Category"
//* category ^comment = "Could use the value \"problem-list-item\" to indicate the underlying condition, and extend the value set to add the value \"assessed-need\"."
* code ^short = "Assessed Need Code"
* code ^definition = "The clinical and/or community-based necessity or desire as identified byan assessment that should be addressed by a service."
* code.coding MS
* code.coding.code MS
* code.coding.system MS
* subject only Reference(Patient_eltss)
* recorder only Reference(Practitioner_eltss or PractitionerRole_eltss or Patient_eltss or RelatedPerson_eltss)
* asserter only Reference(Practitioner_eltss or PractitionerRole_eltss or Patient_eltss or RelatedPerson_eltss)
* stage.assessment only Reference(Observation_eltss or ClinicalImpression or DiagnosticReport)
* onset[x] only dateTime or Age or Period or Range or string
* onset[x] MS
* onset[x] ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* onset[x] ^type.extension.valueBoolean = true
* abatement[x] only dateTime or Age or Period or Range or string
* abatement[x] MS
* abatement[x] ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* abatement[x] ^type.extension.valueBoolean = true
* recordedDate MS





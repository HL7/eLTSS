Profile: Observation_eltss
Parent: Observation
Id: Observation-eltss
Description: "Observation resource mapping for eLTSS"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* . ^comment = "Used for simple observations such as device measurements, laboratory atomic results, vital signs, height, weight, smoking status, comments, etc.  Other resources may be used to provide context for observations such as laboratory reports, etc."
* . ^mustSupport = false


* extension ^label = "Label"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open

* extension contains
    $resource-pertainsToGoal named resource-pertainsToGoal 0..* MS
* extension[resource-pertainsToGoal] ^short = "The resource-pertainsToGoal relates the resource to the goal(s) that pertain to it. Whenever there is a goal associated with a health concern or problem, this extension should be present and populated in activity (event or intent) resources."

* status MS
* subject 1..1 MS
* subject only Reference(Patient_eltss)
* subject ^type.targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type.targetProfile[=].extension.valueBoolean = true 

* effective[x] only dateTime or Period or Timing or instant
* effective[x] MS
* effective[x] ^definition = "The time or time-period the observed value is asserted as being true. For biological subjects - e.g. human patients - this is usually called the \"physiologically relevant time\"."
* effective[x] ^comment = "At least a date should be present unless this observation is a historical report."
* effective[x] ^type[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* effective[x] ^type[=].extension.valueBoolean = true

* category MS
* code MS
* code ^short = "Strength or Preference"
* code ^definition = "Code representing either a favorable attribute of oneself, his/her support network, environment and/or elements of his/her life or the person’s personal thoughts about something he or she feels is relevant to his or her life experience and may be pertinent when planning."
//* code ^comment = "All code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation."

* code from ELTSS_Observation_code (preferred)
* code.coding MS
* code.coding ^requirements = "Allows for alternative encodings within a code system and translations to other code systems."
//* code.coding.system = "http://hl7.org/us/eltss/CodeSystem/eltss-observation-code" (exactly)
//* code.coding.system ^comment = "Code system for Strength or Preference"
//* code.coding.code MS
//* code.coding.code from ELTSS_Observation_code (preferred)
//* code.coding.code ^comment = "Preference, Strength from eltss-observation-code"
//* code.coding.code ^isModifier = false
* code.text MS

* performer only Reference(Patient_eltss or Practitioner_eltss or PractitionerRole_eltss or RelatedPerson_eltss or $us-core-organization or $us-core-careteam)
* performer MS
* performer ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* performer ^type[=].targetProfile[=].extension.valueBoolean = false
* performer ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* performer ^type[=].targetProfile[=].extension.valueBoolean = false
* performer ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* performer ^type[=].targetProfile[=].extension.valueBoolean = false
* performer ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* performer ^type[=].targetProfile[=].extension.valueBoolean = false
* performer ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* performer ^type[=].targetProfile[=].extension.valueBoolean = false
* performer ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* performer ^type[=].targetProfile[=].extension.valueBoolean = false

* value[x] ^short = "Preference or a Strength"
* value[x] ^definition = "Presents the person’s personal thoughts about something he or she feels is relevant to his or her life experience and may be pertinent when planning."
//* eltss contains eltss
//* eltss ^short = "Preference, Strength"
//* eltss ^definition = "Presents the person’s personal thoughts about something he or she feels is relevant to his or her life experience and may be pertinent when planning."
//* eltss ^isModifier = false

* value[x] only CodeableConcept or string
* value[x] MS
* value[x] ^type[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* value[x] ^type[=].extension.valueBoolean = false
* value[x] ^type[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* value[x] ^type[=].extension.valueBoolean = true

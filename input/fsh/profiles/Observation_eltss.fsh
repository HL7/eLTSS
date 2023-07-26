Profile: Observation_eltss
Parent: Observation
Id: Observation-eltss
Description: "Observation resource mapping for eLTSS"
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* . ^comment = "Used for simple observations such as device measurements, laboratory atomic results, vital signs, height, weight, smoking status, comments, etc.  Other resources may be used to provide context for observations such as laboratory reports, etc."
* . ^mustSupport = false
* . ^isModifier = false

* extension ^label = "Label"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^mustSupport = false
* extension contains
    $resource-pertainsToGoal named resource-pertainsToGoal 0..* MS
* extension[resource-pertainsToGoal] ^short = "The resource-pertainsToGoal relates the resource to the goal(s) that pertain to it. Whenever there is a goal associated with a health concern or problem, this extension should be present and populated in activity (event or intent) resources."

* code ^short = "Strength or Preference"
* code ^definition = "Code representing either a favorable attribute of oneself, his/her support network, environment and/or elements of his/her life or the person’s personal thoughts about something he or she feels is relevant to his or her life experience and may be pertinent when planning."
* code ^comment = "All code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation."
* code ^isModifier = false
* code.coding ^requirements = "Allows for alternative encodings within a code system and translations to other code systems."
* code.coding.system = "http://hl7.org/us/eLTSS/CodeSystem/eltss-observation-code" (exactly)
* code.coding.system ^comment = "Code system for Strength or Preference"
* code.coding.code MS
* code.coding.code from ELTSS_Observation_code (preferred)
* code.coding.code ^comment = "Preference, Strength from eltss-observation-code"
* code.coding.code ^isModifier = false
* code.text MS
* value[x] ^short = "Preference, Strength"
* value[x] ^definition = "Presents the person’s personal thoughts about something he or she feels is relevant to his or her life experience and may be pertinent when planning."
//* eltss contains eltss
//* eltss ^short = "Preference, Strength"
//* eltss ^definition = "Presents the person’s personal thoughts about something he or she feels is relevant to his or her life experience and may be pertinent when planning."
//* eltss ^isModifier = false
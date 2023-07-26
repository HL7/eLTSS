Profile: Questionnaire_eltss
Parent: Questionnaire
Id: Questionnaire-eltss
Description: "Questionnaire resource mapping for eLTSS"
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
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

* derivedFrom only canonical
* derivedFrom ^type.targetProfile = "http://hl7.org/fhir/us/eLTSS/StructureDefinition/Questionnaire-eltss"
* item ^definition = "One of:\nPerson Setting Choice Indicator\nPerson Setting Choice Options\nService Options Given Indicator\nService Selection Indicator\nService Plan Agreement Indicator\nService Provider Options Given Indicator\nService Provider Selection Agreement Indicator."
* item ^mustSupport = false
* item ^isModifier = false
* item.type ^mustSupport = false
* item.type ^isModifier = false
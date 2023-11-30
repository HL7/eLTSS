Profile: EpisodeOfCare_eltss
Parent: EpisodeOfCare
Id: EpisodeOfCare-eltss
Description: "EpisodeOfCare for eLTSS"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* . ^short = "An association of a Patient with an Organization and Healthcare Provider(s) for a period of time that the Organization assumes some level of responsibility"


* extension ^label = "Label"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    $resource-pertainsToGoal named resource-pertainsToGoal 0..* MS
* extension[resource-pertainsToGoal] ^short = "The resource-pertainsToGoal relates the resource to the goal(s) that pertain to it. Whenever there is a goal associated with a health concern or problem, this extension should be present and populated in activity (event or intent) resources."


* patient only Reference(Patient_eltss)
* referralRequest only Reference(ServiceRequest_eltss)
* careManager MS
* careManager only Reference(Practitioner_eltss)
* careManager ^short = "Plan Monitor"
* careManager ^definition = "The person responsible for monitoring the plan."
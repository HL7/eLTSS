Profile: Claim_eltss
Parent: Claim
Id: Claim-eltss
Description: "Claim Resource profile for eLTSS"
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* . ^comment = "The eLTSS Claim resource profile fulfills three information request requirements: Claim - a request for adjudication for reimbursement for products and/or services provided; Preauthorization - a request to authorize the future provision of products and/or services including an anticipated adjudication; and, Predetermination - a request for a non-bind adjudication of possible future products and/or services."
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


* patient only Reference(Patient_eltss)
* enterer only Reference(Practitioner_eltss or $us-core-practitionerrole)
* provider only Reference(Practitioner_eltss or $us-core-practitionerrole or $us-core-organization)
* related.claim only Reference(Claim_eltss)
* payee.party only Reference(Practitioner_eltss or $us-core-practitionerrole or $us-core-organization or Patient_eltss or RelatedPerson)
* referral only Reference(ServiceRequest_eltss)
* facility only Reference(Location_eltss)
* careTeam.provider only Reference(Practitioner_eltss or $us-core-practitionerrole or $us-core-organization)
* diagnosis.diagnosisReference[diagnosisReference] only Reference(Condition_eltss)
* diagnosis.diagnosisReference[diagnosisReference] ^sliceName = "diagnosisReference"
* accident.locationReference[locationReference] only Reference(Location_eltss)
* accident.locationReference[locationReference] ^sliceName = "locationReference"
* item ^definition = "A claim line. Either a simple  product or service or a 'group' of details which can each be a simple items or groups of sub-details provided."
* item.unitPrice ^short = "Service Rate per Unit name"
* item.unitPrice ^definition = "The rate of one unit for a service."
* item.unitPrice ^mustSupport = false
* item.unitPrice ^isModifier = false
* item.net ^short = "Total Cost of Service"
* item.net ^definition = "The total cost of a service for the plan."
* item.net ^mustSupport = false
* item.net ^isModifier = false
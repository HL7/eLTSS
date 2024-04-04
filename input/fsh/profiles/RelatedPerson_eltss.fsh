Profile: RelatedPerson_eltss
Parent: $us-core-relatedperson
Id: RelatedPerson-eltss
Title: "eLTSS RelatedPerson Profile"
Description: "This profile sets minimum expectations for the RelatedPerson resource to record, search, and fetch basic administrative information about persons with a legal or familial relationship to a patient. It is patterned off of USCORE."
* ^status = #active
//* obeys us-core-14
* active 1.. MS
* patient only Reference(Patient_eltss)
* patient MS
* relationship MS
* relationship ^condition = "us-core-14"
* name MS
* name ^condition = "us-core-14"
* name.family MS
* name.given MS

* telecom MS
* telecom.value MS
* telecom.system MS
* address MS
* address.

//Invariant: us-core-14
//Description: "Either a name or a relationship SHALL be provided (or both)"
//Severity: #error
//Expression: "name.exists() or relationship.exists()"
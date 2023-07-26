Instance: Inline-Instance-for-practitioner-planner1-1
InstanceOf: Practitioner_eltss
Usage: #inline
* id = "planner1"
* identifier[0].system = "http://hl7.org.fhir/sid/us-npi"
* identifier[=].value = "9941339108"
* identifier[+].system = "http://www.acme.org/practitioners"
* identifier[=].value = "25456"
* name.text = "Mark Planner"
* name.family = "Planner"
* name.given = "Mark"
* telecom.system = #phone
* telecom.value = "(678) 555 1221"
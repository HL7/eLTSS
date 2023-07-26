Instance: planner1
InstanceOf: Practitioner_eltss
Usage: #inline
* identifier[0].system = "http://fhir.hl7.org/sid/us-npi"
* identifier[=].value = "9941339108"
* identifier[+].system = "http://www.acme.org/practitioners"
* identifier[=].value = "25456"
* name.text = "Mark Planner"
* name.family = "Planner"
* name.given = "Mark"
* telecom.system = #phone
* telecom.value = "(212) 555 1221"
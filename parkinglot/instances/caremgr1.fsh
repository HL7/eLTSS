Instance: caremgr1
InstanceOf: Practitioner_eltss
Usage: #inline
* identifier[0].system = "http://hl7.org.fhir/sid/us-npi"
* identifier[=].value = "9941339109"
* identifier[+].system = "http://www.acme.org/practitioners"
* identifier[=].value = "25457"
* name.text = "Sam Monitor"
* name.family = "Monitor"
* name.given = "Sam"
* telecom.system = #phone
* telecom.value = "(770) 224 1599"
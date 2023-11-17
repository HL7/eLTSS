Instance: eltss-client
InstanceOf: CapabilityStatement
Usage: #definition
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n      <p>eLTSS IG Client.      </p>\n      <p>This is a profile on the US Core Implementation Guide and adheres to the requirements </p>\n    </div>"
* url = "http://hl7.org/fhir/us/eltss/CapabilityStatement/eltss-client"
* name = "ELTSS_Client"
* title = "eLTSS Client"
* status = #active
* date = "2019-02-08T00:00:00-05:00"
* publisher = "HL7 CBCP"
* contact.telecom.system = #other
* contact.telecom.value = "http://www.hl7.org/SpecialCommittees/usrealm/index.cfm"
* description = "This profile defines the expected capabilities of the eLTSS Client."
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-client"
* fhirVersion = #4.0.0
* format[0] = #xml
* format[+] = #json
* rest.mode = #client
* rest.resource.type = #CarePlan
* rest.resource.supportedProfile = "http://hl7.org/fhir/us/eltss/StructureDefinition/CarePlan-eltss"
* rest.resource.interaction[0].code = #search-type
* rest.resource.interaction[+].code = #read
* rest.resource.interaction[+].code = #history-instance
* rest.resource.interaction[+].code = #vread
Instance: eltss-server
InstanceOf: CapabilityStatement
Usage: #definition
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n      <p>eLTSS IG Server.</p>\n    </div>"
* url = "http://hl7.org/fhir/us/eLTSS/CapabilityStatement/eltss-server"
* name = "ELTSS_Server"
* title = "eLTSS Server"
* status = #active
* date = "2019-02-08T00:00:00-05:00"
* publisher = "HL7 CBCP"
* contact.telecom.system = #other
* contact.telecom.value = "http://www.hl7.org/SpecialCommittees/usrealm/index.cfm"
* description = "This profile defines the expected capabilities of the eLTSS Server."
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server"
* fhirVersion = #4.0.0
* format[0] = urn:ietf:bcp:13#xml
* format[+] = urn:ietf:bcp:13#json
* rest.mode = #server
* rest.resource.type = #CarePlan
* rest.resource.supportedProfile = "http://hl7.org/fhir/us/eLTSS/StructureDefinition/CarePlan-eltss"
* rest.resource.interaction[0].code = #search-type
* rest.resource.interaction[+].code = #read
* rest.resource.interaction[+].code = #history-instance
* rest.resource.interaction[+].code = #vread
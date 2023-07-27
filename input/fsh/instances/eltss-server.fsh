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
* description = "This profile defines the expected capabilities of the eLTSS Server. Any system which will send (i.e. be the target of a Read or Search) eLTSS data, or from which other systems will access or modify data (write), is considered a server. The CapabilityStatement indicates implementation of several other implementation guides, reflecting the nature of eLTSS data. The core data item addressed in this guide is the CarePlan."
* jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* jurisdiction.text = "United States"
* copyright = "Used by permission of HL7 International, all rights reserved Creative Commons License"
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server"
* fhirVersion = #4.0.1
* format[0] = #json
* format[+] = #xml
* patchFormat = #application/json-patch+json
* implementationGuide[0] = "http://hl7.org/fhir/us/mcc/ImplementationGuide/hl7.fhir.us.mcc"
* implementationGuide[+] = "http://hl7.org/fhir/us/core/ImplementationGuide/hl7.fhir.us.core"
* implementationGuide[+] = "http://hl7.org/fhir/smart-app-launch/ImplementationGuide/hl7.fhir.uv.smart-app-launch"
* implementationGuide[+] = "http://hl7.org/fhir/uv/bulkdata/ImplementationGuide/hl7.fhir.uv.bulkdata"
* implementationGuide[+] = "https://hl7.org/fhir/us/sdoh-clinicalcare/"
* implementationGuide[+] = "http://hl7.org/fhir/uv/bulkdata/ImplementationGuide/hl7.fhir.uv.bulkdata"
* rest.mode = #server
* rest.resource.type = #CarePlan
* rest.resource.supportedProfile = "http://hl7.org/fhir/us/eLTSS/StructureDefinition/CarePlan-eltss"
* rest.resource.interaction[0].code = #search-type
* rest.resource.interaction[+].code = #read
* rest.resource.interaction[+].code = #history-instance
* rest.resource.interaction[+].code = #vread
Profile: Location_eltss
Parent: $us-core-location
Id: Location-eltss
Description: "Location for eLTSS. This profile should only be used for Service Delivery Address when the service or support is provided outside the person's home address. Use Person.address when service or support is provided in the person's residence."
* ^status = #draft
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* . ^definition = "Details and position information for a physical place where services are provided and resources and participants may be stored, found, contained, and/or accommodated."
* address ^definition = "Physical or geographical location."
* address.district MS
* address.district ^short = "County"
* address.district ^definition = "Country where service is provided."
* address.district ^isModifier = false
* partOf only Reference(Location_eltss)
* partOf ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy"
* partOf ^type.extension.valueBoolean = true
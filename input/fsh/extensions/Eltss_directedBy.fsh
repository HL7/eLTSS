Extension: Eltss_directedBy
Id: eltss-directedBy
Description: "Indicates whether the individual chose to self-direct the service."
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* ^context.type = #element
* ^context.expression = "ServiceRequest"
//* . ..1
* . ^short = "Self-Directed Service Indicator"
* . ^definition = "Indicates whether the individual chose to  self-direct the service."
* . ^comment = "Can be populated with the value \"self\" to indicate that this service is self-directed."
* . ^isModifier = false
* url only uri
* value[x] only CodeableConcept
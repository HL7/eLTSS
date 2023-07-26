Instance: service2
InstanceOf: ServiceRequest_eltss
Usage: #inline
* extension.url = "http://hl7.org/fhir/us/eLTSS/StructureDefinition/eltss-directedBy"
* extension.valueCodeableConcept.text = "self"
* status = #active
* intent = #plan
* code = urn:oid:2.16.840.1.113883.6.14#T2003
* code.text = "Non-emergency transportation; encounter/trip"
* quantityQuantity.value = 10
* quantityQuantity.unit = "trips"
* subject = Reference(patient1)
* occurrencePeriod.start = "2018-07-01"
* occurrencePeriod.end = "2018-12-31"
* performer = Reference(provider2)
* insurance = Reference(coverage1)
* supportingInfo = Reference(claim1)
* note.text = "Service provider will provide a reminder the business day before the trip, and will call when on the way."
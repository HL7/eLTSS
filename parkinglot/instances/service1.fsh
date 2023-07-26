Instance: service1
InstanceOf: ServiceRequest_eltss
Usage: #inline
* status = #active
* intent = #plan
* code = urn:oid:2.16.840.1.113883.6.14#T1019
* code.text = "Personal care services, per 15 minutes"
* quantityRatio.numerator.value = 5
* quantityRatio.numerator.unit = "quarter hour"
* quantityRatio.denominator.value = 1
* quantityRatio.denominator.unit = "week"
* subject = Reference(patient1)
* occurrencePeriod.start = "2018-05-01"
* occurrencePeriod.end = "2018-12-31"
* performer = Reference(provider1)
* locationReference = Reference(location1)
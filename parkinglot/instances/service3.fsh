Instance: service3
InstanceOf: ServiceRequest_eltss
Usage: #inline
* status = #active
* intent = #plan
* code.text = "House cleaning"
* quantityRatio.numerator.value = 1
* quantityRatio.numerator.unit = "visit"
* quantityRatio.denominator.value = 1
* quantityRatio.denominator.unit = "week"
* subject = Reference(patient1)
* occurrencePeriod.start = "2018-05-01"
* occurrencePeriod.end = "2018-12-31"
* performer = Reference(daughter1)
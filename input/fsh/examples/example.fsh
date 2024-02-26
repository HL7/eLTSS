Instance: patientBSJ1
InstanceOf: Patient
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Patient-eltss"
* active = true
* name.text = "Betsy Smith-Johnson"
* name.given = "Betsy"
* name.family = "Smith-Johnson"
* gender = #female
* birthDate = "1950-11-01"
* maritalStatus = http://terminology.hl7.org/CodeSystem/v3-MaritalStatus#U "unmarried"
* maritalStatus.text = "Not married"
* identifier.use = #usual
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#MR "Medical Record Number"
* identifier.system = "http://hl7.org/fhir/sid/us-medicare"
* identifier.value = "10A3D58WH1600"
* extension[0].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2106-3 "White"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "White"

* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2186-5 "Not Hispanic or Latino"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "Not Hispanic or Latino"

* telecom.system = #phone
* telecom.value = "210-222-1111"
* telecom.use = #mobile
* address.text = "111 Maple Ct, San Antonio, TX 78212"
* address.line = "111 Maple Ct"
* address.city = "San Antonio"
* address.district = "Bexar"
* address.state = "TX"
* address.postalCode = "78212"
* communication.language = urn:ietf:bcp:47#en "English"
* communication.language.text = "US"
* communication.preferred = true
* contact[0].name.text = "Charles Johnson"
* contact[=].name.given = "Charles"
* contact[=].name.family = "Johnson"
* contact[=].relationship[0] = http://terminology.hl7.org/CodeSystem/v3-RoleCode#SONC "Son"
* contact[=].relationship[+] = http://terminology.hl7.org/CodeSystem/v2-0131#C "Emergency Contact"
* contact[=].relationship[+] = http://terminology.hl7.org/CodeSystem/v3-RoleCode#GUARD "Guardian"
* contact[=].address.text = "100 Montana St., San Antonio, TX 78203"
* contact[=].telecom.system = #phone
* contact[=].telecom.value = "(210) 222-3333"
* contact[+].name.text = "Debra Johnson"
* contact[=].name.given = "Debra"
* contact[=].name.family = "Johnson"
* contact[=].relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#DAUC "Daughter"
* contact[=].address.text = "333 W. Camden St., Baltimore, MD 21201"
* contact[=].telecom.system = #phone
* contact[=].telecom.value = "(410) 444-5555"


Instance: careplan1
InstanceOf: CarePlan
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/CarePlan-eltss"
* status = #active
* intent = #plan
* category = $careplan-category#assess-plan
* title = "Betsy Smith Johnson's Services and Supports Plan"
* description = "A service and support plan that outlines Betsy's assessed needs, goals, strengths, preferences, and services/providers to meet those needs and goals."
* subject = Reference(Patient/patientBSJ1)

* period.start = "2020-05-01"
* period.end = "2020-12-31"
* author = Reference(planner1)
* addresses[0] = Reference(need1)
* addresses[+] = Reference(need2)
* addresses[+] = Reference(need3)
* addresses[+] = Reference(need4)
* supportingInfo[0] = Reference(strength1)
* supportingInfo[+] = Reference(strength2)
* supportingInfo[+] = Reference(pref1)
* supportingInfo[+] = Reference(questionnaireresponse1)
* supportingInfo[+] = Reference(contract1)
* supportingInfo[+] = Reference(risk1)
* goal[0] = Reference(goal1)
* goal[+] = Reference(goal2)
* activity[+].reference = Reference(service1)
* activity[+].reference = Reference(service2)
* activity[+].reference = Reference(service3)
* activity[+].reference = Reference(service4)
* activity[+].reference = Reference(Task1)
* activity[=].progress.time = "2020-05-10"
* activity[=].progress.text = "Betsy will start doing balance exercises"
* activity[+].reference = Reference(Task2)
* activity[=].progress.time = "2020-05-10"
* activity[=].progress.text = "Betsy working on mobility to dance at son's upcoming wedding" 

Instance: Task1
InstanceOf: Task
Usage: #example
* status = #ready "Ready"
* intent = #order
* priority = #routine
* extension.url = "http://hl7.org/fhir/StructureDefinition/resource-pertainsToGoal"
* extension.valueReference = Reference(Goal/goal1)
* code = http://hl7.org/fhir/CodeSystem/task-code#fulfill "Fulfill the focal request"
* description = "Perform exercises to improve balance skills."
* for = Reference(Patient/patientBSJ1) "Betsy"
* requester = Reference(Practitioner/planner1) "Mark Planner"
* owner = Reference(Patient/patientBSJ1) "Betsy"


Instance: Task2
InstanceOf: Task
Usage: #example
* status = #ready "Ready"
* intent = #order
* priority = #routine
* extension.url = "http://hl7.org/fhir/StructureDefinition/resource-pertainsToGoal"
* extension.valueReference = Reference(Goal/goal2)
* code = http://hl7.org/fhir/CodeSystem/task-code#fulfill "Fulfill the focal request"
* description = "Son working with Besty to work on mobility to dance at son's upcoming wedding."
* for = Reference(Patient/patientBSJ1) "Betsy" 
* requester = Reference(Practitioner/planner1) "Mark Planner"
* owner = Reference(RelatedPerson/son1) "Charles - Betsy's son"

Instance: goal2
InstanceOf: Goal
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Goal-eltss"
* lifecycleStatus = #accepted

* description.text = "Dance at son's upcoming wedding"
* subject = Reference(Patient/patientBSJ1)

Instance: goal1
InstanceOf: Goal
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Goal-eltss"
* lifecycleStatus = #accepted

* description.text = "Improve balance skills"
* subject = Reference(Patient/patientBSJ1)

Instance: planner1
InstanceOf: Practitioner
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Practitioner-eltss"

* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[=].value = "9941339100"    
* identifier[+].system = "http://www.acme.org/practitioners"
* identifier[=].value = "25456"

* name.text = "Mark Planner"
* name.family = "Planner"
* name.given = "Mark"

* telecom.system = #phone
* telecom.value = "(210) 555 1221"



Instance: service2
InstanceOf: ServiceRequest
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/ServiceRequest-eltss"
* status = #active
* intent = #plan

* code = http://terminology.hl7.org/CodeSystem/HCPCS-all-codes#T2003
* code.text = "Non-emergency transportation; encounter/trip"

* quantityRatio.numerator.value = 2
* quantityRatio.numerator.unit = "trips"
* quantityRatio.numerator.system = $nct
* quantityRatio.numerator.code = #C141286 //Transportation

* quantityRatio.denominator.value = 1
* quantityRatio.denominator.unit = "month"
* quantityRatio.denominator.system = $ucum
* quantityRatio.denominator.code = #mo //Month
	
* subject = Reference(Patient/patientBSJ1)
* occurrencePeriod.start = "2020-07-01"

* occurrencePeriod.end = "2020-12-31"

* performer = Reference(provider2a)
* reasonReference = Reference(need1)
* insurance = Reference(coverage1)
* supportingInfo = Reference(claim1)

* note.text = "Service provider will provide a reminder the business day before the trip, and will call when on the way."

Instance: service3
InstanceOf: ServiceRequest
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/ServiceRequest-eltss"
* status = #active
* intent = #plan

* code = http://terminology.hl7.org/CodeSystem/HCPCS-all-codes#G0108
* code.text = "Diabetes outpatient self-management training services, individual, per 30 minutes"

* quantityRatio.numerator.value = 1
* quantityRatio.numerator.unit = "visit"
* quantityRatio.numerator.system = $nct
* quantityRatio.numerator.code = #C25716 //Visit

* quantityRatio.denominator.value = 1
* quantityRatio.denominator.unit = "week"
* quantityRatio.denominator.system = $ucum
* quantityRatio.denominator.code = #wk //Week


* subject = Reference(Patient/patientBSJ1)
* occurrencePeriod.start = "2020-05-01"

* occurrencePeriod.end = "2020-08-01"

* performer = Reference(provider3)
* reasonReference = Reference(need2)
* supportingInfo = Reference(claim2)

Instance: service4
InstanceOf: ServiceRequest
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/ServiceRequest-eltss"
* status = #active
* intent = #plan

* code = http://www.ama-assn.org/go/cpt#97110
* code.text = "therapeutic exercises to improve balance skills"

* quantityRatio.numerator.value = 1
* quantityRatio.numerator.unit = "visit"
* quantityRatio.numerator.system = $nct
* quantityRatio.numerator.code = #C25716 //Visit

* quantityRatio.denominator.value = 1
* quantityRatio.denominator.unit = "week"
* quantityRatio.denominator.system = $ucum
* quantityRatio.denominator.code = #wk //Week

* subject = Reference(Patient/patientBSJ1)
* occurrencePeriod.start = "2020-05-01"

* occurrencePeriod.end = "2020-08-01"

* performer = Reference(provider4)
* reasonReference = Reference(need1)
* supportingInfo[0] = Reference(goal1)
* supportingInfo[+] = Reference(goal2)
* supportingInfo[+] = Reference(claim3)

Instance: son1
InstanceOf: RelatedPerson
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/RelatedPerson-eltss"
* active = true
* patient = Reference(Patient/patientBSJ1)
* relationship.coding = $v3-RoleCode#SONC
* name.text = "Charles Johnson"
* name.family = "Charles"
* name.given = "Johnson"

Instance: strength1
InstanceOf: Observation
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Observation-eltss"
* status = #final
* code = $eltss-observation-code#strength "Strength"
* effectiveDateTime = "2013-04-02T10:30:10+01:00"
* issued = "2013-04-03T15:30:10+01:00"
* performer = Reference(Practitioner/caremgr1) "Care Manager"
* subject = Reference(Patient/patientBSJ1)
* valueString = "Able to manage her bills."

Instance: strength2
InstanceOf: Observation
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Observation-eltss"
* status = #final
* code = $eltss-observation-code#strength "Strength"
* effectiveDateTime = "2013-04-02T10:30:10+01:00"
* issued = "2013-04-03T15:30:10+01:00"
* performer = Reference(Practitioner/caremgr1) "Care Manager"
* subject = Reference(Patient/patientBSJ1)
* valueString = "Independent walking with cane."

Instance: caremgr1
InstanceOf: Practitioner
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Practitioner-eltss"

* identifier[+].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[=].value = "9941339109"
* identifier[+].system = "http://www.acme.org/practitioners"
* identifier[=].value = "25457"

* name.text = "Sam Monitor"
* name.family = "Monitor"
* name.given = "Sam"

* telecom.system = #phone
* telecom.value = "(210) 224 1599"

Instance: careplan2
InstanceOf: CarePlan
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/CarePlan-eltss"

* partOf = Reference(careplan1)
* status = #active
* intent = #plan
* category = $careplan-category#assess-plan
* description = "Weather Emergency: A shelf-stable meal is delivered to Meals On Wheels clients. It is to be eaten in the unlikely event of cancellation. Weather meals are donated by the Sheboygan Service Club."
* subject = Reference(Patient/patientBSJ1)

Instance: claim1
InstanceOf: Claim
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Claim-eltss"
* status = #active
* type = $claim-type#professional
* use = #claim
* patient = Reference(Patient/patientBSJ1)
* created = "2020-05-01"
* provider = Reference(funding1)
* priority = $processpriority#normal
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(coverage1)
* item.sequence = 1
* item.productOrService = http://terminology.hl7.org/CodeSystem/HCPCS-all-codes#T2003

* item.unitPrice.value = 60
* item.currency = #USD

* item.net.value = 600
* item.currency = #USD

Instance: claim2
InstanceOf: Claim
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Claim-eltss"
* status = #active
* type = $claim-type#professional
* use = #claim
* patient = Reference(Patient/patientBSJ1)
* created = "2020-05-01"
* provider = Reference(funding1)
* priority = $processpriority#normal
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(coverage1)
* item.sequence = 1
* item.productOrService = http://terminology.hl7.org/CodeSystem/HCPCS-all-codes#G0108

* item.unitPrice.value = 55
* item.currency = #USD

* item.net.value = 660
* item.currency = #USD

Instance: claim3
InstanceOf: Claim
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Claim-eltss"
* status = #active
* type = $claim-type#professional
* use = #claim
* patient = Reference(Patient/patientBSJ1)
* created = "2020-05-01"
* provider = Reference(funding1)
* priority = $processpriority#normal
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(coverage1)
* item.sequence = 1
* item.productOrService = http://www.ama-assn.org/go/cpt#97110

* item.unitPrice.value = 65
* item.currency = #USD

* item.net.value = 780
* item.currency = #USD

Instance: contract1
InstanceOf: Contract
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Contract-eltss"

* signer[+].type = $contractsignertypecodes#PAT
* signer[=].party = Reference(Patient/patientBSJ1)
* signer[=].signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.7
* signer[=].signature.when = "2020-04-02T03:00:00Z"
* signer[=].signature.who = Reference(Patient/patientBSJ1)
* signer[=].signature.data = "R0lGODlhIAAgALMAADNmmWNjnGOcnJycnJzOnM7OnP///////////////////////////////////////yH5BAEAAAUALAAAAAAgACAAAARosMhJq704680l6OD0fSFHFmd5pai6vi7FerGYzWAK7HKs8zYVazcUVojH0gyZzFmYvQ4OGtXgUMDn5kqtwlZZLeaKJXOtYbG31lrXdKb0lyySi+l1PE1v5CtpbE0eRISFhod+gYoXEQAAOw=="



* signer[+].type = $contractsignertypecodes#GUARD
* signer[=].party = Reference(guardian1)
* signer[=].signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.7
* signer[=].signature.when = "2020-04-02T03:00:00Z"
* signer[=].signature.who = Reference(guardian1)
* signer[=].signature.data = "R0lGODlhIAAgALMAADNmmWNjnGOcnJycnJzOnM7OnP///////////////////////////////////////yH5BAEAAAUALAAAAAAgACAAAARosMhJq704680l6OD0fSFHFmd5pai6vi7FerGYzWAK7HKs8zYVazcUVojH0gyZzFmYvQ4OGtXgUMDn5kqtwlZZLeaKJXOtYbG31lrXdKb0lyySi+l1PE1v5CtpbE0eRISFhod+gYoXEQAAOw=="


* signer[+].type = $contractsignertypecodes#AUT
* signer[=].party = Reference(planner1)
* signer[=].signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.1
* signer[=].signature.when = "2020-04-02T03:00:00Z"
* signer[=].signature.who = Reference(planner1)
* signer[=].signature.data = "R0lGODlhIAAgALMAADNmmWNjnGOcnJycnJzOnM7OnP///////////////////////////////////////yH5BAEAAAUALAAAAAAgACAAAARosMhJq704680l6OD0fSFHFmd5pai6vi7FerGYzWAK7HKs8zYVazcUVojH0gyZzFmYvQ4OGtXgUMDn5kqtwlZZLeaKJXOtYbG31lrXdKb0lyySi+l1PE1v5CtpbE0eRISFhod+gYoXEQAAOw=="


* signer[+].type = $contractsignertypecodes#COAUTH
* signer[=].party = Reference(caremgr1)
* signer[=].signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.1
* signer[=].signature.when = "2020-04-02T03:00:00Z"
* signer[=].signature.who = Reference(caremgr1)
* signer[=].signature.data = "R0lGODlhIAAgALMAADNmmWNjnGOcnJycnJzOnM7OnP///////////////////////////////////////yH5BAEAAAUALAAAAAAgACAAAARosMhJq704680l6OD0fSFHFmd5pai6vi7FerGYzWAK7HKs8zYVazcUVojH0gyZzFmYvQ4OGtXgUMDn5kqtwlZZLeaKJXOtYbG31lrXdKb0lyySi+l1PE1v5CtpbE0eRISFhod+gYoXEQAAOw=="



* signer[+].type = $contractsignertypecodes#HPROV
* signer[=].party = Reference(provider3)
* signer[=].signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.7
* signer[=].signature.when = "2020-04-02T03:00:00Z"
* signer[=].signature.who = Reference(provider3)
* signer[=].signature.data = "R0lGODlhIAAgALMAADNmmWNjnGOcnJycnJzOnM7OnP///////////////////////////////////////yH5BAEAAAUALAAAAAAgACAAAARosMhJq704680l6OD0fSFHFmd5pai6vi7FerGYzWAK7HKs8zYVazcUVojH0gyZzFmYvQ4OGtXgUMDn5kqtwlZZLeaKJXOtYbG31lrXdKb0lyySi+l1PE1v5CtpbE0eRISFhod+gYoXEQAAOw=="



* signer[+].type = $contractsignertypecodes#HPROV
* signer[=].party = Reference(provider2b)
* signer[=].signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.7
* signer[=].signature.when = "2020-04-02T03:00:00Z"

* signer[=].signature.who = Reference(provider2b)
* signer[=].signature.data = "R0lGODlhIAAgALMAADNmmWNjnGOcnJycnJzOnM7OnP///////////////////////////////////////yH5BAEAAAUALAAAAAAgACAAAARosMhJq704680l6OD0fSFHFmd5pai6vi7FerGYzWAK7HKs8zYVazcUVojH0gyZzFmYvQ4OGtXgUMDn5kqtwlZZLeaKJXOtYbG31lrXdKb0lyySi+l1PE1v5CtpbE0eRISFhod+gYoXEQAAOw=="



* signer[+].type = $contractsignertypecodes#HPROV
* signer[=].party = Reference(son1)
* signer[=].signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.7
* signer[=].signature.when = "2020-04-02T03:00:00Z"
* signer[=].signature.who = Reference(son1)
* signer[=].signature.data = "R0lGODlhIAAgALMAADNmmWNjnGOcnJycnJzOnM7OnP///////////////////////////////////////yH5BAEAAAUALAAAAAAgACAAAARosMhJq704680l6OD0fSFHFmd5pai6vi7FerGYzWAK7HKs8zYVazcUVojH0gyZzFmYvQ4OGtXgUMDn5kqtwlZZLeaKJXOtYbG31lrXdKb0lyySi+l1PE1v5CtpbE0eRISFhod+gYoXEQAAOw=="



* signer[+].type = $contractsignertypecodes#HPROV
* signer[=].party = Reference(provider4)
* signer[=].signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.7
* signer[=].signature.when = "2020-04-02T03:00:00Z"
* signer[=].signature.who = Reference(provider4)
* signer[=].signature.data = "R0lGODlhIAAgALMAADNmmWNjnGOcnJycnJzOnM7OnP///////////////////////////////////////yH5BAEAAAUALAAAAAAgACAAAARosMhJq704680l6OD0fSFHFmd5pai6vi7FerGYzWAK7HKs8zYVazcUVojH0gyZzFmYvQ4OGtXgUMDn5kqtwlZZLeaKJXOtYbG31lrXdKb0lyySi+l1PE1v5CtpbE0eRISFhod+gYoXEQAAOw=="




Instance: coverage1
InstanceOf: Coverage
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* status = #active

* beneficiary = Reference(Patient/patientBSJ1)
* payor = Reference(funding1)

Instance: episode1
InstanceOf: EpisodeOfCare
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/EpisodeOfCare-eltss"
* status = #active
* patient = Reference(Patient/patientBSJ1)
* careManager = Reference(caremgr1)

Instance: funding1
InstanceOf: Organization
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = $us-core-organization
* active = true
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[=].value = "9941339101"    
* identifier[+].system = "urn:oid:2.16.840.1.113883.4.7"
* identifier[=].value = "25456"
* identifier.value = "ICWP"
* name = "Texas Department of Community Health"
* address.text = "7430 Louis Pasteur Dr, San Antonio, TX 78229"

Instance: guardian1
InstanceOf: RelatedPerson
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/RelatedPerson-eltss"
* active = true
* patient = Reference(Patient/patientBSJ1)
//comes from the R5 version of the value set https://hl7.org/fhir/valueset-relatedperson-relationshiptype.html
//valid
* relationship = $v3-RoleCode#GUARD
* name.text = "Charles Johnson"
* name.family = "Charles"
* name.given = "Johnson"

Instance: location1
InstanceOf: Location
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Location-eltss"
* name = "In Home"

* address.text = "111 Maple Ct, San Antonio, TX 78212"

Instance: need1
InstanceOf: Condition
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Condition-eltss"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* category = http://hl7.org/fhir/us/core/CodeSystem/condition-category#health-concern "Health Concern"
* code = $sct#713458007 "Lack of access to transportation (finding)"
* code.text = "Needs transportation"
* subject = Reference(Patient/patientBSJ1)

Instance: need2
InstanceOf: Condition
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Condition-eltss"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* category = http://hl7.org/fhir/us/core/CodeSystem/condition-category#health-concern "Health Concern"
* code = $sct#734920002 "Diabetes mellitus education service"
* code.text = "Needs health / nutrition education for diabetes"
* subject = Reference(Patient/patientBSJ1)

Instance: need3
InstanceOf: Condition
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Condition-eltss"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* category = http://hl7.org/fhir/us/core/CodeSystem/condition-category#health-concern "Health Concern"
* code = $sct#35489007 "Depressive disorder (disorder)"
* code.text = "Depression (on treatment)"
* subject = Reference(Patient/patientBSJ1)

Instance: need4
InstanceOf: Condition
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Condition-eltss"
* extension.url = "http://hl7.org/fhir/us/eltss/StructureDefinition/eltss-dueTo"
* extension.valueReference = Reference(Condition/need3)
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* category = http://hl7.org/fhir/us/core/CodeSystem/condition-category#health-concern "Health Concern"
* code = $sct#183301007 "Physical exercises (regime/therapy)"
* code.text = "Needs physical exercises"
* subject = Reference(Patient/patientBSJ1)

Instance: pref1
InstanceOf: Observation
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Observation-eltss"
* status = #final
* code = $lnc#95541-9 "Care experience preference"
* effectiveDateTime = "2013-04-02T10:30:10+01:00"
* issued = "2013-04-03T15:30:10+01:00"
* performer = Reference(Practitioner/caremgr1) "Care Manager"
* subject = Reference(Patient/patientBSJ1)
* valueString = "Accessing the ICWP Waiver for her current service needs, and would like to remain on ICWP and continue with her current services."

Instance: provider2a
InstanceOf: Organization
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = $us-core-organization
* active = true
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[=].value = "9941339101"    
* identifier[+].system = "urn:oid:2.16.840.1.113883.4.7"
* identifier[=].value = "25456"
* identifier.system = "http://www.acme.org/practitioners"
* identifier.value = "24680"
* name = "The Transporter, Inc."
* telecom.system = #phone
* telecom.value = "(210) 555 1313"
* address.text = "111 Business Street, San Antonio, TX 78212"

Instance: provider2b
InstanceOf: Practitioner
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Practitioner-eltss"
* identifier.system = "http://www.acme.org/practitioners"
* identifier.value = "11223344"
* name.text = "Bill Driver"
* name.family = "Driver"
* name.given = "Bill"
* telecom.system = #phone
* telecom.value = "(210) 111 2222"

Instance: provider3
InstanceOf: Practitioner
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Practitioner-eltss"
* identifier.system = "http://www.acme.org/practitioners"
* identifier.value = "987654"
* name.text = "Lisa Educator"
* name.family = "Educator"
* name.given = "Lisa"
* telecom.system = #phone
* telecom.value = "(210) 555 1213"

Instance: provider4
InstanceOf: Practitioner
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Practitioner-eltss"
* identifier.system = "http://www.acme.org/practitioners"
* identifier.value = "987657"
* name.text = "Norma Trainer"
* name.family = "Trainer"
* name.given = "Norma"
* telecom.system = #phone
* telecom.value = "(210) 555 1214"

Instance: PractitionerRole-1
InstanceOf: PractitionerRole
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/PractitionerRole-eltss"
* practitioner = Reference(Practitioner/caremgr1) "Sam Monitor"
* organization = Reference(Organization/funding1) "Texas Department of Community Health"
* code.coding[0] = $provider-taxonomy#172V00000X "Community Health Worker"
* specialty = $provider-taxonomy#171M00000X "Case Manager/Care Coordinator"
* location = Reference(Location/communitysite) "Health Level Seven International"
* telecom.system = #phone
* telecom.value = "(210) 555 1222"

Instance: communitysite
InstanceOf: Location
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Location-eltss"
* name = "In Home"
* address.text = "7430 Louis Pasteur Dr, San Antonio, TX 78229"


Instance: questionnaire1
InstanceOf: Questionnaire
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Questionnaire-eltss"
* name = "Questionnaire1"
* status = #active
* item[0].linkId = "q1"
* item[=].text = "Did you choose the setting in which you reside?"
* item[=].type = #boolean
* item[+].linkId = "q2"
* item[=].text = "What alternative home and community-based settings were considered?"
* item[=].type = #string
* item[+].linkId = "q3"
* item[=].text = "Were you given a choice of services outlined in the plan?"
* item[=].type = #boolean
* item[+].linkId = "q4"
* item[=].text = "Did you participate in the selection of services outlined in the plan?"
* item[=].type = #boolean
* item[+].linkId = "q5"
* item[=].text = "Do you agree to the services outlined in the plan?"
* item[=].type = #boolean
* item[+].linkId = "q6"
* item[=].text = "Were you offered a choice of providers for each service?"
* item[=].type = #boolean
* item[+].linkId = "q7"
* item[=].text = "Do you feel you made an informed choice in selecting the provider for each service?"
* item[=].type = #boolean

Instance: questionnaireresponse1
InstanceOf: QuestionnaireResponse
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/QuestionnaireResponse-eltss"
//should this be the versioned one: http://hl7.org/fhir/us/eltss/Questionnaire/questionnaire1#2.0.0
//the current Questionnaire is for STU2.0
* questionnaire = "http://hl7.org/fhir/us/eltss/Questionnaire/questionnaire1"
* status = #completed
* subject = Reference(Patient/patientBSJ1)

* item[+].linkId = "q1"
* item[=].answer.valueBoolean = true

* item[+].linkId = "q2"
* item[=].answer.valueString = "Assisted living facility"

* item[+].linkId = "q3"
* item[=].answer.valueBoolean = true

* item[+].linkId = "q4"
* item[=].answer.valueBoolean = true

* item[+].linkId = "q5"
* item[=].answer.valueBoolean = true

* item[+].linkId = "q6"
* item[=].answer.valueBoolean = true

* item[+].linkId = "q7"
* item[=].answer.valueBoolean = true

Instance: risk1
InstanceOf: RiskAssessment
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/RiskAssessment-eltss"
* extension.url = "http://hl7.org/fhir/us/eltss/StructureDefinition/eltss-RiskPlan"
* extension.valueReference.display = "This points to a management plan for any risks. This is not the backup plan, which is an alternative plan for the CarePlan. The risk management plan is meant to help avoid needing the backup plan."
* status = #final
* subject = Reference(Patient/patientBSJ1)
* prediction[+].outcome.coding = $sct#129839007
* prediction[=].outcome.text = "At risk for falls (finding)"
* prediction[+].outcome.coding = $sct#35489007
* prediction[=].outcome.text = "Depressive disorder (disorder)"
* prediction[=].outcome.coding = $sct#866240007
* prediction[=].outcome.text = "At risk of stroke"
* mitigation = "Betsy is at risk for falls and of having a stroke. Her risk is increased due to her depression medication. She has grab bars installed in the shower and is working on her balance with a trainer."


Instance: service1
InstanceOf: ServiceRequest
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-09-03T10:16:03.512-04:00"
* meta.source = "#KZ0jzPjXDrhCiMif"
* meta.profile = "http://hl7.org/fhir/us/eltss/StructureDefinition/ServiceRequest-eltss"
* extension.url = "http://hl7.org/fhir/us/eltss/StructureDefinition/eltss-directedBy"
* extension.valueCodeableConcept.text = "self"
* status = #active
* intent = #plan

* code = http://terminology.hl7.org/CodeSystem/HCPCS-all-codes#E0241
* code.text = "Bath tub wall rail, each"

* quantityQuantity.value = 1
* quantityQuantity.unit = "install" 
* quantityQuantity.system = $nct
* quantityQuantity.code = #C81906 //Deploy

* subject = Reference(Patient/patientBSJ1)
* occurrencePeriod.start = "2020-05-01"

* occurrencePeriod.end = "2020-12-31"

* performer = Reference(son1)

* locationReference = Reference(location1)
* supportingInfo = Reference(risk1)
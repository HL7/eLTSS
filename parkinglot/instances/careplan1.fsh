Instance: careplan1
InstanceOf: CarePlan_eltss
Usage: #inline

* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t\t<p>\r\n\t\t<b>Sally Person's Long Term Services and Supports (LTSS) Service Plan</b>\r\n\t\t</p>\r\n\t\t<p><b>Plan Effective Date:</b> 2018-05-01 - 2018-12-31</p>\r\n\t\t<strong>Assessment</strong>\t\t\t\r\n\t\tPatient would like to dance at daughter's wedding but has difficulty in bathing, dressing and transportation. She is Able to manage her bills and has strong family support. Accessing the ICWP Waiver for her current service needs, and would like to remain on ICWP and continue with her current services.<p><b>Step or Action:</b> client action - manage diet</p>\r\n\t\t<p><b>Step or Action:</b> client action - exercise and join a fitness club</p><p><b>Step or Action:</b>Personal care services, housecleaning and non-emergency transportation have been requested.</p>\r\n\t\t</div>"

//* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><br>\r\n\t\t<p><br>\r\n\t\t<b>Sally Person's Long Term Services and Supports (LTSS) Service Plan</b><br>\r\n\t\t</p><br>\r\n\t\t<p><b>Plan Effective Date:</b> 2018-05-01 - 2018-12-31</p><br>\r\n\t\t<strong>Assessment</strong><br>\t\t\t<br>\r\n\t\tPatient would like to dance at daughter's wedding but has difficulty in bathing, dressing and transportation. She is Able to manage her bills and has strong family support. Accessing the ICWP Waiver for her current service needs, and would like to remain on ICWP and continue with her current services.<br><p><b>Step or Action:</b> client action - manage diet</p><br>\r\n\t\t<p><b>Step or Action:</b> client action - exercise and join a fitness club</p><br><p><b>Step or Action:</b>Personal care services, housecleaning and non-emergency transportation have been requested.</p><br>\r\n\t\t</div>"
//* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t\tCapabilityStatement for Client Actor in the IHE IT Infrastructure Technical Framework Supplement\r\n\t\t\t<a href=\"https://profiles.ihe.net/ITI/TF/Volume1/ch-38.html\">FooBar</a>\r\n\t\tThe IHE Profile text is Normative, this conformance resource is Informative.</div>"

//&emsp;&emsp;

* text.status = #additional
* status = #active
* intent = #plan
* category[+] = $careplan-category#assess-plan
* subject = Reference(patient1)
* period.start = "2018-05-01"
* period.end = "2018-12-31"
* author = Reference(planner1)
* addresses[0] = Reference(need1)
* addresses[+] = Reference(need2)
* addresses[+] = Reference(need3)
* supportingInfo[0] = Reference(strength1)
* supportingInfo[+] = Reference(questionnaireresponse1)
* supportingInfo[+] = Reference(contract1)
* supportingInfo[+] = Reference(risk1)
* goal[0] = Reference(goal1)
* goal[+] = Reference(goal2)
* activity[0].detail.goal = Reference(goal1)
* activity[=].detail.status = #not-started
* activity[=].detail.description = "manage diet"
* activity[+].detail.goal = Reference(goal2)
* activity[=].detail.status = #not-started
* activity[=].detail.description = "exercise / join a fitness club"
* activity[+].reference = Reference(service1)
* activity[+].reference = Reference(service2)
* activity[+].reference = Reference(service3)

//* text.status = #additional
//* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t\tCapabilityStatement for Client Actor in the IHE IT Infrastructure Technical Framework Supplement\r\n\t\t\t<a href=\"https://profiles.ihe.net/ITI/TF/Volume1/ch-38.html\">FooBar</a>\r\n\t\tThe IHE Profile text is Normative, this conformance resource is Informative.</div>"

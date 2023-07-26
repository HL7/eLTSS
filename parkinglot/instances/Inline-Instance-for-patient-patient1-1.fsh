Instance: Inline-Instance-for-patient-patient1-1
InstanceOf: Patient_eltss
Usage: #inline
* id = "patient1"
* identifier.type = $v2-0203#MR
* identifier.type.text = "MRN"
* identifier.system = "http://www.example.org/Codesystem"
* identifier.value = "123456ABC"
* name.text = "Sally Person"
* name.family = "Person"
* name.given = "Sally"
* telecom.system = #phone
* telecom.value = "(404) 555 1212"
* gender = #female
* birthDate = "1935-05-01"
* address.text = "2222 Peachtree Street, Atlanta GA, 30318"
* address.line = "2222 Peachtree Street"
* address.city = "Atlanta"
* address.district = "Fulton"
* address.state = "GA"
* address.postalCode = "30318"
* contact.relationship[0] = $v2-0131#C
* contact.relationship[+] = $v3-RoleCode#DAUC
* contact.name.text = "Jane Daughter"
* contact.name.family = "Daughter"
* contact.name.given = "Jane"
* contact.telecom.system = #phone
* contact.telecom.value = "(770) 224 1544"
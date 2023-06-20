Instance: contractA
InstanceOf: Contract_eltss
Usage: #inline
//* id = "contractA"
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n            <p>eLTSS Signature in Contract form [eLTSS Support Planner Signature], [eLTSS Support Planner Printed Name], [eLTSS Support Planner Signature Date]  </p>\n          </div>"
* signer[0].type = $contractsignertypecodes#AUT
* signer[=].party = Reference(planner1)
* signer[=].signature.type.code = #1.2.840.10065.1.12.1.1
* signer[=].signature.when = "2018-04-02T03:00:00Z"
* signer[=].signature.who = Reference(planner1)
* signer[=].signature.sigFormat = #image/jpeg
* signer[=].signature.data = "R0lGODlhIAAgALMAADNmmWNjnGOcnJycnJzOnM7OnP///////////////////////////////////////yH5BAEAAAUALAAAAAAgACAAAARosMhJq704680l6OD0fSFHFmd5pai6vi7FerGYzWAK7HKs8zYVazcUVojH0gyZzFmYvQ4OGtXgUMDn5kqtwlZZLeaKJXOtYbG31lrXdKb0lyySi+l1PE1v5CtpbE0eRISFhod+gYoXEQAAOw=="
* signer[+].type = $contractsignertypecodes#HPROV
* signer[=].party = Reference(provider1)
* signer[=].signature.type.code = #1.2.840.10065.1.12.1.7
* signer[=].signature.when = "2018-04-02T03:00:00Z"
* signer[=].signature.who = Reference(provider1)
* signer[=].signature.sigFormat = #image/jpeg
* signer[=].signature.data = "R0lGODlhIAAgALMAADNmmWNjnGOcnJycnJzOnM7OnP///////////////////////////////////////yH5BAEAAAUALAAAAAAgACAAAARosMhJq704680l6OD0fSFHFmd5pai6vi7FerGYzWAK7HKs8zYVazcUVojH0gyZzFmYvQ4OGtXgUMDn5kqtwlZZLeaKJXOtYbG31lrXdKb0lyySi+l1PE1v5CtpbE0eRISFhod+gYoXEQAAOw=="
* signer[+].type = $contractsignertypecodes#HPROV
* signer[=].party = Reference(provider2)
* signer[=].signature.type.code = #1.2.840.10065.1.12.1.7
* signer[=].signature.when = "2018-04-02T03:00:00Z"
* signer[=].signature.who = Reference(provider3)
* signer[=].signature.sigFormat = #image/jpeg
* signer[=].signature.data = "R0lGODlhIAAgALMAADNmmWNjnGOcnJycnJzOnM7OnP///////////////////////////////////////yH5BAEAAAUALAAAAAAgACAAAARosMhJq704680l6OD0fSFHFmd5pai6vi7FerGYzWAK7HKs8zYVazcUVojH0gyZzFmYvQ4OGtXgUMDn5kqtwlZZLeaKJXOtYbG31lrXdKb0lyySi+l1PE1v5CtpbE0eRISFhod+gYoXEQAAOw=="
Profile: PractitionerRole_eltss
Parent: $us-core-practitionerrole
Id: PractitionerRole-eltss
Title: "eLTSS PractitionerRole Profile"
Description: "PractitionerRole for eLTSS"
* ^status = #draft
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* . ^definition = "This is basic constraint on provider role for use in eLTSS resources."
* telecom MS
* telecom.value MS
* telecom.system MS
* practitioner only Reference(Practitioner_eltss)
* location only Reference(Location_eltss)
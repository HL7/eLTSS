Profile: Practitioner_eltss
Parent: $us-core-practitioner
Id: Practitioner-eltss
Description: "Practitioner for eLTSS"
* ^status = #draft
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* . ^definition = "This is basic constraint on provider for use in eLTSS resources."
* telecom MS
* telecom.value MS
* telecom.system MS

* address ^definition = "Address(es) of the practitioner that are not role specific  (typically home address). \rWork addresses are not typically entered in this property as they are usually role dependent."
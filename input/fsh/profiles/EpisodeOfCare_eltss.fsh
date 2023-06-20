Profile: EpisodeOfCare_eltss
Parent: EpisodeOfCare
Id: EpisodeOfCare-eltss
Description: "EpisodeOfCare for eLTSS"
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* . ^short = "An association of a Patient with an Organization and Healthcare Provider(s) for a period of time that the Organization assumes some level of responsibility"
* . ^mustSupport = false
* . ^isModifier = false
* patient only Reference(Patient_eltss)
* referralRequest only Reference(ServiceRequest_eltss)
* careManager only Reference(Practitioner_eltss)
* careManager ^short = "Plan Monitor"
* careManager ^definition = "The person responsible for monitoring the plan."
* careManager ^mustSupport = false
* careManager ^isModifier = false
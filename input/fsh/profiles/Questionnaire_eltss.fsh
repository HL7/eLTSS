Profile: Questionnaire_eltss
Parent: $sdc-questionnaire
Id: Questionnaire-eltss
Description: "Questionnaire resource mapping for eLTSS"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"


* item ^definition = "One of:\nPerson Setting Choice Indicator\nPerson Setting Choice Options\nService Options Given Indicator\nService Selection Indicator\nService Plan Agreement Indicator\nService Provider Options Given Indicator\nService Provider Selection Agreement Indicator."
* item ^mustSupport = true
* item.type ^mustSupport = true

Extension: ELTSS_dueTo
Id: eltss-dueTo
Title: "ELTSS-dueTo"
Description: "Further conditions, problems, diagnoses, procedures or events or the substance that caused/triggered this Condition."
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = false
* ^date = "2019-02-16T19:00:00-05:00"
* ^publisher = "HL7 CBCP"
* ^context.type = #element
* ^context.expression = "Condition"
* . ^short = "Causes for this Condition"
* . ^definition = "Further conditions, problems, diagnoses, procedures or events or the substance that caused/triggered this Condition."
* . ^comment = "Although a condition may be caused by a substance, this is not intended to be used to record allergies or adverse reactions to substances."
* . ^isModifier = false
* url only uri
* value[x] only Reference(Condition_eltss)
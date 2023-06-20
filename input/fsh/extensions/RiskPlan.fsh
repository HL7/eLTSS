//eltss data set element Risk Management Plan	
Extension: RiskPlan
Id: eltss-RiskPlan
Description: "Risk Management Plan eLTSS data set element"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2019-09-12T13:05:35-04:00"
* ^context.type = #element
* ^context.expression = "RiskAssessment"
* obeys ext-1
* . ^short = "Optional Extensions Element"
* . ^definition = "Optional Extension Element - found in all resources."
* value[x] 1..
* value[x] only Reference($us-core-documentreference)
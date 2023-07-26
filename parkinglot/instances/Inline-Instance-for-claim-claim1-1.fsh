Instance: Inline-Instance-for-claim-claim1-1
InstanceOf: Claim_eltss
Usage: #inline
* id = "claim1"
* status = #active
* type = $claim-type#professional
* use = #claim
* patient = Reference(patient2)
* created = "2019-01-01"
* provider = Reference(funding1)
* priority = $processpriority#normal
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(coverage1)
* item.sequence = 1
* item.productOrService = $ex-USCLS#1101
* item.unitPrice.value = 60
* item.net.value = 600
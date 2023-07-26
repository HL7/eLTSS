Instance: need3
InstanceOf: Condition_eltss
Usage: #inline
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* category = ELTSS_Condition_Category_Codes#assessed-need
* code = $sct#284972002 "Difficulty performing dressing activity (finding)"
* code.text = "difficulty in dressing"
* subject = Reference(patient1)
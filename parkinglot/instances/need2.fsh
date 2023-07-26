Instance: need2
InstanceOf: Condition_eltss
Usage: #inline
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* category = ELTSS_Condition_Category_Codes#assessed-need
* code = $sct#284807005 "Difficulty bathing self (finding)"
* code.text = "difficulty in bathing"
* subject = Reference(patient1)
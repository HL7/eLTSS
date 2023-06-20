Instance: need1
InstanceOf: Condition_eltss
Usage: #inline
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* category = ELTSS_Condition_Category_Codes#assessed-need
* code = $sct#713458007 "Lack of access to transportation (finding)"
* code.text = "lack of transportation"
* subject = Reference(patient1)
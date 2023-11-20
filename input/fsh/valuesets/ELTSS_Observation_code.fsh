ValueSet: ELTSS_Observation_code
Id: eltss-observation-code
Title: "Observation Code Value Set"
Description: "This value set includes the Strength and Preference codes."
* ^status = #draft
* ^experimental = true
* ^date = "2019-09-12T13:05:35-04:00"
* ^publisher = "HL7 CBCP"

//364665006 | Ability to perform function / activity (observable entity) |

//* $sct#248536006 "Finding of functional performance and activity (finding)"
* $lnc#95541-9 "Care experience preference"
//* $sct#225773000 "Preferences (qualifier value)"
* $eltss-observation-code#strength "Strength"
//* ELTSS_Observation_Codes#preference "Preference"
//* #strength "Strength" "A favorable attribute of oneself, his/her support network, environment and/or elements of his/her life."
//* #preference "Preference" "Presents the person's personal thoughts about something he or she feels is relevant to his or her life experience and may be pertinent when planning."
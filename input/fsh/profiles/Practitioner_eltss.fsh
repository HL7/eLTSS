Profile: Practitioner_eltss
Parent: $us-core-practitioner
Id: Practitioner-eltss
Description: "Pratitioner for eLTSS"
* ^status = #draft
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* . ^definition = "This is basic constraint on provider for use in eLTSS resources."

* extension ^label = "Label"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^mustSupport = false
* extension contains
    $resource-pertainsToGoal named resource-pertainsToGoal 0..* MS
* extension[resource-pertainsToGoal] ^short = "The resource-pertainsToGoal relates the resource to the goal(s) that pertain to it. Whenever there is a goal associated with a health concern or problem, this extension should be present and populated in activity (event or intent) resources."

* address ^definition = "Address(es) of the practitioner that are not role specific  (typically home address). \rWork addresses are not typically entered in this property as they are usually role dependent."
* address.type ^comment = "The definition of Address states that \"address is intended to describe postal addresses, not physical locations\". However, many applications track whether an address has a dual purpose of being a location that can be visited as well as being a valid delivery destination, and Postal addresses are often used as proxies for physical locations (also see the Location resource)."
* address.district MS
* address.district ^short = "County"
* address.district ^definition = "Country where service is provided."
* address.district ^isModifier = false
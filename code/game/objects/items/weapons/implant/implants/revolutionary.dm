/obj/item/weapon/implant/revolution
	name = "communication implant"
	implant_color = "r"
	allowed_organs = list(BP_HEAD)

	var/antag_id = null
	var/faction_id = null


/obj/item/weapon/implant/revolution/can_install(var/mob/living/carbon/human/target, var/obj/item/organ/external/E)
	if(!istype(target) || !target.mind)
		return FALSE

	for(var/datum/antagonist/A in target.mind.antagonist)
		if(A.id == antag_id)
			return FALSE

	return antag_id && faction_id


/obj/item/weapon/implant/revolution/on_install()
	var/datum/faction/F = get_faction_by_id(faction_id)

	if(!wearer || !wearer.mind)
		return

	make_antagonist_faction(wearer.mind, antag_id, F)


/obj/item/weapon/implant/revolution/on_uninstall()
	if(!istype(wearer) || !wearer.mind)
		return

	for(var/datum/antagonist/A in wearer.mind.antagonist)
		if(A.id == antag_id)
			A.remove_antagonist()

	if(prob(33))
		wearer.adjustBrainLoss(200)
		wearer.death()
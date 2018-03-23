/datum/antagonist/revolutionary
	id = ROLE_EXCELSIOR_REV
	role_text = "Infiltrator"
	role_text_plural = "Infiltrators"
	role_type = "Excelsior Infiltrator"
	welcome_text = "Viva la revolution!"

/datum/antagonist/revolutionary/excelsior/can_become_antag(var/datum/mind/M)
	if(!..() || !owner.current.get_complant())
		return FALSE
	return TRUE


/datum/faction/revolutionary/excelsior
	id = FACTION_EXCELSIOR
	name = "Excelsior"
	antag = "infiltrator"
	antag_plural = "infiltrators"
	welcome_text = ""

	possible_antags = list(ROLE_EXCELSIOR_REV)
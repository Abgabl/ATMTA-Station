/////////////////////////////////////////////////////////////////////////////////////////
// Research
/////////////////////////////////////////////////////////////////////////////////////////

// MAXIMUM SCIENCE
/datum/job_objective/maximize_research/get_description()
	var/desc = "��������� ������������ �� ���� ��������, � ��������� �� �� R&D ������!"
	desc += "([units_completed] �������� �����������.)"
	return sanitize_local(desc)

/datum/job_objective/maximize_research/check_for_completion()
	var/obj/machinery/r_n_d/server/server = null
	for(var/obj/machinery/r_n_d/server/serber in machines)
		if(serber.name == "Core R&D Server")
			server=serber
			break
	if(!server)
	// This was just used for testing.
	//world << "UNABLE TO FIND A GODDAMN RND SERVER. FUCK."
		return
	for(var/datum/tech/T in server.files.possible_tech)
		if(T.max_level==0) // Ignore illegal tech, etc
			continue
		var/datum/tech/KT  = locate(T.type, server.files.known_tech)
		if(!KT)
			return 0 // Obviously haven't maxed everything if we don't know a tech.
		if(KT.level<T.max_level)
			return 0
		else
			units_completed++
	return 1

/* //some science
//Materials
/datum/job_objective/materials_research/get_description()
	var/desc = "��������� ������ ������������ � ������� ����������"
	desc += "([units_completed] ������� ������������ ���������.)"
	return sanitize_local(desc)

/datum/job_objective/materials_research/check_for_completion()
	var/obj/machinery/r_n_d/server/server = null
	for(var/obj/machinery/r_n_d/server/serber in machines)
		if(serber.name == "Core R&D Server")
			server=serber
			break
	if(!server)
	// This was just used for testing.
	//world << "UNABLE TO FIND A GODDAMN RND SERVER. FUCK."
		return
	for(var/datum/tech/materials/T in server.files.possible_tech)
		var/datum/tech/materials/KT  = locate(T.type, server.files.known_tech)
		if(!KT)
			return 0 // Obviously haven't maxed everything if we don't know a tech.
		units_completed = KT.level
		if(KT.level<T.max_level)
			return 0
	return 1

//Engineering
/datum/job_objective/engineering_research/get_description()
	var/desc = "��������� ������ ������������ � ������� ����������� ����"
	desc += "([units_completed] ������� ������������ ���������.)"
	return sanitize_local(desc)

/datum/job_objective/engineering_research/check_for_completion()
	var/obj/machinery/r_n_d/server/server = null
	for(var/obj/machinery/r_n_d/server/serber in machines)
		if(serber.name == "Core R&D Server")
			server=serber
			break
	if(!server)
	// This was just used for testing.
	//world << "UNABLE TO FIND A GODDAMN RND SERVER. FUCK."
		return
	for(var/datum/tech/engineering/T in server.files.possible_tech)
		var/datum/tech/engineering/KT  = locate(T.type, server.files.known_tech)
		if(!KT)
			return 0 // Obviously haven't maxed everything if we don't know a tech.
		units_completed = KT.level
		if(KT.level<T.max_level)
			return 0
	return 1

//Plasma
/datum/job_objective/plasmatech_research/get_description()
	var/desc = "��������� ������ ������������ � ������� ����������� ����"
	desc += "([units_completed] ������� ������������ ���������.)"
	return sanitize_local(desc)

/datum/job_objective/plasmatech_research/check_for_completion()
	var/obj/machinery/r_n_d/server/server = null
	for(var/obj/machinery/r_n_d/server/serber in machines)
		if(serber.name == "Core R&D Server")
			server=serber
			break
	if(!server)
	// This was just used for testing.
	//world << "UNABLE TO FIND A GODDAMN RND SERVER. FUCK."
		return
	for(var/datum/tech/plasmatech/T in server.files.possible_tech)
		var/datum/tech/plasmatech/KT  = locate(T.type, server.files.known_tech)
		if(!KT)
			return 0 // Obviously haven't maxed everything if we don't know a tech.
		units_completed = KT.level
		if(KT.level<T.max_level)
			return 0
	return 1 */

/////////////////////////////////////////////////////////////////////////////////////////
// Robotics
/////////////////////////////////////////////////////////////////////////////////////////

//Cyborgs
/datum/job_objective/make_cyborg/get_description()
	var/desc = "�������� �������."
	desc += "([units_completed] �������.)"
	return sanitize_local(desc)



//Mechas! RIPLEY
/datum/job_objective/make_ripley/New()
	units_requested = rand(3,5)

/datum/job_objective/make_ripley/get_description()
	var/desc = "�������� [units_requested] �������������� ������ Ripley ��� Firefighter."
	desc += "([units_completed] �������.)"
	return sanitize_local(desc)

//ODYSSEUS
/datum/job_objective/make_odysseus/New()
	units_requested = rand(3,5)

/datum/job_objective/make_odysseus/get_description()
	var/desc = "�������� [units_requested] �������������� ������ Odysseus."
	desc += "([units_completed] �������.)"
	return sanitize_local(desc)

//DURAND
/datum/job_objective/make_durand/New()
	units_requested = rand(3,5)

/datum/job_objective/make_durand/get_description()
	var/desc = "�������� [units_requested] �������������� ������ Durand."
	desc += "([units_completed] �������.)"
	return sanitize_local(desc)

//HONKER
/datum/job_objective/make_honker/New()
	units_requested = rand(3,5)

/datum/job_objective/make_honker/get_description()
	var/desc = "�������� [units_requested] �������������� ������ H.O.N.K."
	desc += "([units_completed] �������.)"
	return sanitize_local(desc)

//GYGAX
/datum/job_objective/make_gygax/New()
	units_requested = rand(3,5)

/datum/job_objective/make_gygax/get_description()
	var/desc = "�������� [units_requested] �������������� ������ Gygax"
	desc += "([units_completed] �������.)"
	return sanitize_local(desc)

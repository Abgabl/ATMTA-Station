/datum/mind/var/list/job_objectives = list()

#define FINDJOBTASK_DEFAULT_NEW 1 // Make a new task of this type if one can't be found.
/datum/mind/proc/findJobTask(var/typepath, var/options = 0)
	var/datum/job_objective/task = locate(typepath) in job_objectives
	if(!istype(task,typepath))
		if(options & FINDJOBTASK_DEFAULT_NEW)
			task = new typepath()
			job_objectives += task
	return task

/datum/job_objective
	var/datum/mind/owner = null			//Who owns the objective.
	var/completed = 0					//currently only used for custom objectives.
	var/over = 0							//currently only used for round-end objectives.
	var/units_completed = 0
	var/units_requested = 1
	var/explanation_text = "Placeholder Objective"

/datum/job_objective/New(var/datum/mind/new_owner)
	owner = new_owner
	owner.job_objectives += src


/datum/job_objective/proc/get_description()
	var/desc = explanation_text
	return sanitize_local(desc)

/datum/job_objective/proc/unit_completed(var/count=1)
	units_completed += count

/datum/job_objective/proc/is_completed()
	if(!completed)
		completed = check_for_completion()
	return completed

/datum/job_objective/proc/check_for_completion()
	if(units_completed >= units_requested)
		return 1
	return 0

/datum/job_objective/proc/is_over()
	if(!over)
		over = check_in_the_end()
	return over

/datum/job_objective/proc/check_in_the_end()
	if(units_completed > 0)
		return 1
	return 0

/datum/game_mode/proc/declare_job_completion()
	var/text = "<hr><b><u>Job objective completion:</u></b>"

	for(var/datum/mind/employee in ticker.minds)

		if(!employee.job_objectives.len)//If the employee had no objectives, don't need to process this.
			continue

		if(!employee.assigned_role=="MODE")//If the employee is a gamemode thing, skip.
			continue

		var/tasks_completed=0

		text += "<br><b>[employee.name] was a [employee.assigned_role]:</b><hr>"

		var/count = 1
		for(var/datum/job_objective/objective in employee.job_objectives)
			if(objective.is_completed(1) || objective.is_over(1))
				text += "<br>&nbsp;-&nbsp;<B>Task #[count]</B>: [objective.get_description()] <font color='green'><B>SUCCESS!</B></font>"
				feedback_add_details("employee_objective","[objective.type]|�����")
				tasks_completed++
			else
				text += "<br>&nbsp;-&nbsp;<B>Task #[count]</B>: [objective.get_description()] <font color='red'><b>FAIL.</b></font>"
				feedback_add_details("employee_objective","[objective.type]|������")
			count++

		if(tasks_completed >= 1)
			text += "<br>&nbsp;<font color='green'><B>[employee.name] did their fucking job!</B></font>"
			feedback_add_details("employee_success","SUCCESS")
		else
			feedback_add_details("employee_success","FAIL")

	return sanitize_local(text)

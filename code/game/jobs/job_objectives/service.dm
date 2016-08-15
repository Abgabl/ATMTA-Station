/////////////////////////////////////////////////////////////////////////////////////////
//Service
/////////////////////////////////////////////////////////////////////////////////////////

// Janitor
/datum/job_objective/ultraclean/get_description()
	var/desc = "��������� ���������� ������� �� �������"
	return sanitize_local(desc)

/datum/job_objective/ultraclean/check_in_the_end()
	if(!score_mess)
		return 1
	else return 0

/datum/job_objective/harvest/get_description()
	var/desc = "������� ������ �� ����� ��� � 30 �������� (������� [score_stuffharvested])"
	return sanitize_local(desc)

/datum/job_objective/harvest/check_in_the_end()
  if(score_stuffharvested < 30)
    return 0
  else return 1

/datum/job_objective/funeral/get_description()
	var/desc = "�����/����������� ��� ������� ����."
	return sanitize_local(desc)

/datum/job_objective/funeral/check_in_the_end()
  if(score_deadcrew)
    return 0
  else return 1

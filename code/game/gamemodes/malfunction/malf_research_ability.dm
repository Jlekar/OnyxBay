/datum/malf_research_ability
	var/ability = null 									// Path to verb which will be given to the AI when researched.
	var/name = "Unknown Ability"						// Name of this ability
	var/price = 0										// Amount of CPU time needed to unlock this ability.
	var/invested = 0 									// Amount of CPU time already used to research this ability. When larger or equal to price unlocks the ability.
	var/unlocked = 0									// Changed to 1 when fully researched.
	var/datum/malf_research_ability/next = null			// Next research (if applicable).


/datum/malf_research_ability/proc/process(time = 0)
	invested += time
	if(invested >= price)
		unlocked = 1

/datum/malf_research_ability/proc/research_finished(mob/living/silicon/ai/user)
	if(!user)
		return
	if(ability)
		grant_verb(user.verbs, ability)

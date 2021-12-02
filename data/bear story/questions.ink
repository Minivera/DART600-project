=== questions
    -> wtf_bears -> group -> polar_bear -> honey_badger -> isidor_role -> bosse_ingen_role -> gryta_role -> bosse_descriptor -> reveal -> bear_roll -> criminal_roll -> stats -> stat_change ->->

VAR wtf_bears_answered = false
= wtf_bears
    # needs=bears_studied_humans,role_brains
    The story talks about bears doing crazy things. What's up with that? What makes the bears do these human-like things? # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - wtf_bears_answered || validate_2_clues(-> clues.bears_studied_humans, -> clues.role_brains): 
        ~ wtf_bears_answered = true
        ~ wtf_bears_answer()
        ~ reset_clues()
    - has_selected_clue() && not validate_2_clues(-> clues.bears_studied_humans, -> clues.role_brains): 
        -> bad_clues_selected -> clues(-> wtf_bears)
    - else:
        -> clues(-> wtf_bears)
    }
    ->->

VAR group_answered = false
= group
    # needs=bosse_title,vet_title,ojsan_title,gryta_title
    What does the group look like, before Isidor joins? Since all the bears are acting like they're in a heist movie, what is the role of each bear? # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - group_answered || validate_4_clues(-> clues.bosse_title, -> clues.vet_title, -> clues.ojsan_title, -> clues.gryta_title): 
        ~ group_answered = true
        ~ group_answer()
        ~ reset_clues()
    - has_selected_clue() && not validate_4_clues(-> clues.bosse_title, -> clues.vet_title, -> clues.ojsan_title, -> clues.gryta_title):
        -> bad_clues_selected -> clues(-> group)
    - else:
        -> clues(-> group)
    }
    ->->

VAR polar_bear_answered = false
= polar_bear
    # needs=ojsan_poodle_cut,polar_bear_swim
    What can polar bear do exactly? What makes them different from the other type of bears and why are certain characters polar bears? # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - polar_bear_answered || validate_2_clues(-> clues.ojsan_poodle_cut, -> clues.polar_bear_swim): 
        ~ polar_bear_answered = true
        ~ polar_bear_answer()
        ~ reset_clues()
    - has_selected_clue() && not validate_2_clues(-> clues.ojsan_poodle_cut, -> clues.polar_bear_swim): 
        -> bad_clues_selected -> clues(-> polar_bear)
    - else:
        -> clues(-> polar_bear)
    }
    ->->

VAR honey_badger_answered = false
= honey_badger
    # needs=honey_badger_mayhem
    What can honey badger do that other bears cannot do? I doubt a normal group of bears would allow any honey badger in their group. # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - honey_badger_answered || validate_1_clue(-> clues.honey_badger_mayhem): 
        ~ honey_badger_answered = true
        ~ honey_badger_answer()
        ~ reset_clues()
    - has_selected_clue() && not validate_1_clue(-> clues.honey_badger_mayhem): 
        -> bad_clues_selected -> clues(-> honey_badger)
    - else:
        -> clues(-> honey_badger)
    }
    ->->

VAR isidor_role_answered = false
= isidor_role
    # needs=isidor_muscles,isidor_title,isidor_muscles_role
    What is Isidor's role in the group? Why did they have them join? # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - isidor_role_answered || validate_3_clues(-> clues.isidor_muscles, -> clues.isidor_title, -> clues.isidor_muscles_role): 
        ~ isidor_role_answered = true
        ~ isidor_role_answer()
        ~ reset_clues()
    - has_selected_clue() && validate_3_clues(-> clues.isidor_muscles, -> clues.isidor_title, -> clues.isidor_muscles_role):
        -> bad_clues_selected -> clues(-> isidor_role)
    - else:
        -> clues(-> isidor_role)
    }
    ->->

VAR bosse_ingen_role_answered = false
= bosse_ingen_role
    # needs=ingen_bosse_thief
    Ingen and Bosse have a lot of common, being mentor and student. What's their role in the group? # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - bosse_ingen_role_answered || validate_1_clue(-> clues.ingen_bosse_thief): 
        ~ bosse_ingen_role_answered = true
        ~ bosse_ingen_role_answer()
        ~ reset_clues()
    - has_selected_clue() && validate_1_clue(-> clues.ingen_bosse_thief):
        -> bad_clues_selected -> clues(-> bosse_ingen_role)
    - else:
        -> clues(-> bosse_ingen_role)
    }
    ->->

VAR gryta_role_answered = false
= gryta_role
    # needs=gryta_can_hack,gryta_successful_hack,gryta_hacker
    What is Gryta's role in the group? They seem to have a very different role than all the others. # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - gryta_role_answered || validate_3_clues(-> clues.gryta_can_hack, -> clues.gryta_successful_hack, -> clues.gryta_hacker): 
        ~ gryta_role_answered = true
        ~ gryta_role_answer()
        ~ reset_clues()
    - has_selected_clue() && validate_3_clues(-> clues.gryta_can_hack, -> clues.gryta_successful_hack, -> clues.gryta_hacker):
        -> bad_clues_selected -> clues(-> gryta_role)
    - else:
        -> clues(-> gryta_role)
    }
    ->->

VAR bosse_descriptor_answered = false
= bosse_descriptor
    # needs=bosse_retired
    What differentites Bosse from Ingen? They seem to have a specific descriptor that had them act differently. # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - bosse_descriptor_answered || validate_1_clue(-> clues.bosse_retired): 
        ~ bosse_descriptor_answered = true
        ~ bosse_descriptor_answer()
        ~ reset_clues()
    - has_selected_clue() && validate_1_clue(-> clues.bosse_retired):
        -> bad_clues_selected -> clues(-> bosse_descriptor)
    - else:
        -> clues(-> bosse_descriptor)
    }
    ->->

VAR reveal_answered = false
= reveal
    # needs=sloth_bear_suspicious
    There were clear signs in the story that Albert was suspicious, what were they? # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - reveal_answered || validate_1_clue(-> clues.sloth_bear_suspicious): 
        ~ reveal_answered = true
        ~ reveal_answer()
        ~ reset_clues()
    - has_selected_clue() && validate_1_clue(-> clues.sloth_bear_suspicious):
        -> bad_clues_selected -> clues(-> reveal)
    - else:
        -> clues(-> reveal)
    }
    ->->

VAR bear_roll_answered = false
= bear_roll
    # needs=bear_roll_fail,successful_bear_roll,failed_bear_roll
    There were a few signs that some external force made the bear fail or succeed at bear-like actions. What were they? # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - bear_roll_answered || validate_3_clues(-> clues.bear_roll_fail, -> clues.successful_bear_roll, -> clues.failed_bear_roll): 
        ~ bear_roll_answered = true
        ~ bear_roll_answer()
        ~ reset_clues()
    - has_selected_clue() && validate_3_clues(-> clues.bear_roll_fail, -> clues.successful_bear_roll, -> clues.failed_bear_roll):
        -> bad_clues_selected -> clues(-> bear_roll)
    - else:
        -> clues(-> bear_roll)
    }
    ->->

VAR criminal_roll_answered = false
= criminal_roll
    # needs=successful_criminal_check,other_successful_criminal_check
    There were a few signs that some external force made the bear fail or succeed at bear-like actions. What were they? # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - criminal_roll_answered || validate_2_clues(-> clues.successful_criminal_check, -> clues.other_successful_criminal_check): 
        ~ criminal_roll_answered = true
        ~ criminal_roll_answer()
        ~ reset_clues()
    - has_selected_clue() && validate_2_clues(-> clues.successful_criminal_check, -> clues.other_successful_criminal_check):
        -> bad_clues_selected -> clues(-> criminal_roll)
    - else:
        -> clues(-> criminal_roll)
    }
    ->->

VAR stats_answered = false
= stats
    # needs=ingen_high_criminal
    There was one mention of the different "statistics" the bears might have that made them good or bad at specific things. What was it? # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - bosse_descriptor_answered || validate_1_clue(-> clues.ingen_high_criminal): 
        ~ stats_answered = true
        ~ stats_answer()
        ~ reset_clues()
    - has_selected_clue() && validate_1_clue(-> clues.ingen_high_criminal):
        -> bad_clues_selected -> clues(-> stats)
    - else:
        -> clues(-> stats)
    }
    ->->

VAR stat_change_answered = false
= stat_change
    # needs=ojsan_frustration,bosse_and_honey,isidor_frustration,isidor_flashback
    If there were "statistics" for the bears, there wre some instances of those statistics shifting. What were they? # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - stat_change_answered || validate_4_clues(-> clues.ojsan_frustration, -> clues.bosse_and_honey, -> clues.isidor_frustration, -> clues.isidor_flashback): 
        ~ stat_change_answered = true
        ~ stat_change_answer()
        ~ reset_clues()
    - has_selected_clue() && not validate_4_clues(-> clues.ojsan_frustration, -> clues.bosse_and_honey, -> clues.isidor_frustration, -> clues.isidor_flashback):
        -> bad_clues_selected -> clues(-> stat_change)
    - else:
        -> clues(-> stat_change)
    }
    ->->

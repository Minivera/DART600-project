=== act_1_questions
    -> gronk_race -> gronk_class -> clarisse_race -> clarisse_class -> henry_race -> henry_class -> sophia_class -> kobolds -> saving_throw -> persuasion_check ->->

VAR act_1_gronk_race_answered = false
= gronk_race
    # needs=gronk_race_trunk,gronk_race_sounds
    TODO: Gronk race question
    Question, select the right clues # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - act_1_gronk_race_answered || validate_2_clues(-> act_1_clues.gronk_race_trunk, -> act_1_clues.gronk_race_sounds): 
        ~ act_1_gronk_race_answered = true
        ~ act_1_gronk_race()
        ~ reset_clues()
    - has_selected_clue() && not validate_2_clues(-> act_1_clues.gronk_race_trunk, -> act_1_clues.gronk_race_sounds):
        -> bad_clues_selected -> act_1_clues(-> gronk_race)
    - else:
        -> act_1_clues(-> gronk_race)
    }
    ->->
    
VAR act_1_gronk_class_answered = false
= gronk_class
    # needs=gronk_class_berserker
    TODO: Gronk class question
    Question 2, select the right clues # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - act_1_gronk_class_answered || validate_1_clue(-> act_1_clues.gronk_class_berserker): 
        ~ act_1_gronk_class_answered = true
        ~ act_1_gronk_class()
        ~ reset_clues()
    - has_selected_clue() && not validate_1_clue(-> act_1_clues.gronk_class_berserker):
        -> bad_clues_selected -> act_1_clues(-> gronk_class) ->->
    - else:
        -> act_1_clues(-> gronk_class) ->->
    }
    ->->
    
VAR act_1_clarisse_race_answered = false
= clarisse_race
    # needs=clarisse_race_horns,clarisse_race_red,clarisse_race_birth
    TODO: Clarisse race question
    Question 3, select the right clues # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - act_1_clarisse_race_answered || validate_3_clues(-> act_1_clues.clarisse_race_horns, -> act_1_clues.clarisse_race_red, -> act_1_clues.clarisse_race_birth): 
        ~ act_1_clarisse_race_answered = true
        ~ act_1_clarisse_race()
        ~ reset_clues()
    - has_selected_clue() && not validate_3_clues(-> act_1_clues.clarisse_race_horns, -> act_1_clues.clarisse_race_red, -> act_1_clues.clarisse_race_birth):
        -> bad_clues_selected -> act_1_clues(-> clarisse_race)
    - else:
        -> act_1_clues(-> clarisse_race)
    }
    {act_1_clarisse_race_answered: 
        ~ act_1_clarisse_race()
    }
    ->->
    
VAR act_1_clarisse_class_answered = false
= clarisse_class
    # needs=clarisse_class_luth,clarisse_class_luth_magic
    TODO: Clarisse class question
    Question 4, select the right clues # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - act_1_clarisse_class_answered || validate_2_clues(-> act_1_clues.clarisse_class_luth, -> act_1_clues.clarisse_class_luth_magic): 
        ~ act_1_clarisse_class_answered = true
        ~ act_1_clarisse_class()
        ~ reset_clues()
    - has_selected_clue() && not validate_2_clues(-> act_1_clues.clarisse_class_luth, -> act_1_clues.clarisse_class_luth_magic):
        -> bad_clues_selected -> act_1_clues(-> clarisse_class)
    - else:
        -> act_1_clues(-> clarisse_class)
    }
    {act_1_clarisse_class_answered: 
        ~ act_1_clarisse_class()
    }
    ->->

VAR act_1_henry_race_answered = false
= henry_race
    # needs=henry_race_ears
    TODO: Henry race question
    Question 5, select the right clues # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - act_1_henry_race_answered || validate_1_clue(-> act_1_clues.henry_race_ears): 
        ~ act_1_henry_race_answered = true
        ~ act_1_henry_race()
        ~ reset_clues()
    - has_selected_clue() && not validate_1_clue(-> act_1_clues.henry_race_ears):
        -> bad_clues_selected -> act_1_clues(-> henry_race)
    - else:
        -> act_1_clues(-> henry_race)
    }
    {act_1_henry_race_answered: 
        ~ act_1_henry_race()
    }
    ->->
    
VAR act_1_henry_class_answered = false
= henry_class
    # needs=henry_class_tyr
    TODO: Henry class question
    Question 6, select the right clues # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - act_1_henry_race_answered || validate_1_clue(-> act_1_clues.henry_class_tyr): 
        ~ act_1_henry_class_answered = true
        ~ act_1_henry_class()
        ~ reset_clues()
    - has_selected_clue() && not validate_1_clue(-> act_1_clues.henry_class_tyr):
        -> bad_clues_selected -> act_1_clues(-> henry_class)
    - else:
        -> act_1_clues(-> henry_class)
    }
    {act_1_henry_class_answered: 
        ~ act_1_henry_class()
    }
    ->->

VAR act_1_sophia_class_answered = false
= sophia_class
    # needs=sophia_class_knows_kobolds,sophia_class_knows_nature
    TODO: Sophia class question
    Question 7, select the right clues # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - act_1_sophia_class_answered || validate_2_clues(-> act_1_clues.sophia_class_knows_kobolds, -> act_1_clues.sophia_class_knows_nature): 
        ~ act_1_sophia_class_answered = true
        ~ act_1_sophia_class()
        ~ reset_clues()
    - has_selected_clue() && not validate_2_clues(-> act_1_clues.sophia_class_knows_kobolds, -> act_1_clues.sophia_class_knows_nature):
        -> bad_clues_selected -> act_1_clues(-> sophia_class)
    - else:
        -> act_1_clues(-> sophia_class)
    }
    {act_1_sophia_class_answered: 
        ~ act_1_sophia_class()
    }
    ->->
    
VAR act_1_kobolds_answered = false
= kobolds
    # needs=kobolds_appearance,kobolds_weapons,kobolds_pacific
    TODO: Kobolds question
    Question 8, select the right clues # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - act_1_kobolds_answered || validate_3_clues(-> act_1_clues.kobolds_appearance, -> act_1_clues.kobolds_weapons, -> act_1_clues.kobolds_pacific): 
        ~ act_1_kobolds_answered = true
        ~ act_1_kobolds()
        ~ reset_clues()
    - has_selected_clue() && not validate_3_clues(-> act_1_clues.kobolds_appearance, -> act_1_clues.kobolds_weapons, -> act_1_clues.kobolds_pacific):
        -> bad_clues_selected -> act_1_clues(-> kobolds)
    - else:
        -> act_1_clues(-> kobolds)
    }
    {act_1_kobolds_answered: 
        ~ act_1_kobolds()
    }
    ->->
    
VAR act_1_saving_throw_answered = false
= saving_throw
    # needs=check_alcool_saving_throw
    TODO: Saving Throw question
    Question 9, select the right clues # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - act_1_saving_throw_answered || validate_1_clue(-> act_1_clues.check_alcool_saving_throw): 
        ~ act_1_saving_throw_answered = true
        ~ act_1_saving_throw()
        ~ reset_clues()
    - has_selected_clue() && not validate_1_clue(-> act_1_clues.check_alcool_saving_throw):
        -> bad_clues_selected -> act_1_clues(-> saving_throw)
    - else:
        -> act_1_clues(-> saving_throw)
    }
    {act_1_saving_throw_answered: 
        ~ act_1_saving_throw()
    }
    ->->
    
VAR act_1_persuasion_check_answered = false
= persuasion_check
    # needs=check_persuasion_fail,check_help_persuasion_success
    TODO: Persuasion check question
    Question 10, select the right clues # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - act_1_persuasion_check_answered || validate_2_clues(-> act_1_clues.check_persuasion_fail, -> act_1_clues.check_help_persuasion_success): 
        ~ act_1_persuasion_check_answered = true
        ~ act_1_persuasion_check()
        ~ reset_clues()
    - has_selected_clue() && not validate_2_clues(-> act_1_clues.check_persuasion_fail, -> act_1_clues.check_help_persuasion_success):
        -> bad_clues_selected -> act_1_clues(-> persuasion_check)
    - else:
        -> act_1_clues(-> persuasion_check)
    }
    {act_1_persuasion_check_answered: 
        ~ act_1_persuasion_check()
    }
    ->->
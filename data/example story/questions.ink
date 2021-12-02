=== questions
    -> one_clue -> multiple_clues ->->

VAR one_clue_answered = false
= one_clue
    # needs=some_clue
    Each question has a list of clues it needs to be answered. They may have from 1 to 4 clues each. Drag the "clue" clue from the list into the box under this questions to get started. # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - one_clue_answered || validate_1_clue(-> clues.some_clue): 
        ~ one_clue_answered = true
        ~ one_clue_result()
        ~ reset_clues()
    - has_selected_clue() && not validate_1_clue(-> clues.some_clue):
        -> bad_clues_selected -> clues(-> one_clue)
    - else:
        -> clues(-> one_clue)
    }
    ->->
    
VAR multiple_clues_answered = false
= multiple_clues
    # needs=some_other_clue,third_clue
    Questions with multiple clues can have the clues added in any order. Drag the remaining clues into the boxes under this question to finish the quiz. # question
    {has_selected_clue(): 
        # selected_start
        Selected clues:
        <- print_clues()
        # selected_end
    }
    {
    - multiple_clues_answered || validate_2_clues(-> clues.some_other_clue, -> clues.third_clue): 
        ~ multiple_clues_answered = true
        ~ multiple_clues_result()
        ~ reset_clues()
    - has_selected_clue() && not validate_2_clues(-> clues.some_other_clue, -> clues.third_clue): 
        -> bad_clues_selected -> clues(-> multiple_clues) ->->
    - else:
        -> clues(-> multiple_clues) ->->
    }
    ->->
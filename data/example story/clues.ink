=== print_clue_option(-> option) ===
    -> option ->->

VAR at_least_one_activated_clue = false
=== function has_clues_activated() ===
    ~ return at_least_one_activated_clue

=== clues(-> loop_knot) ===
    # clues_start
    <- some_clue_question(loop_knot)
    <- some_other_clue_question(loop_knot)
    <- third_clue_question(loop_knot)
    +   {has_selected_clue()} [Reset]
        ~ reset_clues()
        -> reset_loop -> loop_knot
    +   [Refresh]
        -> loop_knot
    # clues_end
    ->->

VAR some_clue_activated = false
VAR some_clue_text = "\"clue\" -- When a clue is added, the clue's test and a small description are added as a card in your list of clues."
= some_clue 
    {some_clue_text}
    -> DONE

= some_clue_question(-> loop_knot)
    # towards=questions.one_clue name=some_clue
    + (some_clue_selected) {some_clue_activated && not one_clue_answered && new_this_loop(->some_clue_selected)} [{some_clue_text}]
        ~ select_clue(->clues.some_clue)
        -> loop_knot
    -> DONE
    
VAR some_other_clue_activated = false
VAR some_other_clue_text = "\"Other clues\" -- Each clue helps you discover more about the story and answer the questions."
= some_other_clue 
    {some_other_clue_text}
    -> DONE

= some_other_clue_question(-> loop_knot)
    # towards=questions.multiple_clues name=some_other_clue
    + (some_other_clue_selected) {some_other_clue_activated && not multiple_clues_answered && new_this_loop(->some_other_clue_selected)} [{some_other_clue_text}]
        ~ select_clue(->clues.some_other_clue)
        -> loop_knot
    -> DONE
    
VAR third_clue_activated = false
VAR third_clue_text = "\"more than one clue\" -- Take the time to read the clues carefully to answer the questions."
= third_clue 
    {some_clue_text}
    -> DONE

= third_clue_question(-> loop_knot)
    # towards=questions.multiple_clues name=third_clue
    + (third_clue_selected) {third_clue_activated && not multiple_clues_answered && new_this_loop(->third_clue_selected)} [{third_clue_text}]
        ~ select_clue(->clues.third_clue)
        -> loop_knot
    -> DONE
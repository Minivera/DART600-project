=== function new_this_loop(-> x)
    {  
        // only fail if we've seen both at all...
        - reset_loop && TURNS_SINCE(x) >= 0:
        // and we saw the choice more recently than the reset
        { TURNS_SINCE(x) < TURNS_SINCE(-> reset_loop):
            ~ return false
        }
    }
    ~ return true
    
VAR selected_clue_1 = -> reset_loop
VAR selected_clue_2 = -> reset_loop
VAR selected_clue_3 = -> reset_loop
VAR selected_clue_4 = -> reset_loop
=== function select_clue(-> x) ===
    {selected_clue_1 == -> reset_loop:
        ~ selected_clue_1 = x
        ~ return true
    }
    {selected_clue_2 == -> reset_loop:
        ~ selected_clue_2 = x
        ~ return true
    }
    {selected_clue_3 == -> reset_loop:
        ~ selected_clue_3 = x
        ~ return true
    }
    {selected_clue_4 == -> reset_loop:
        ~ selected_clue_4 = x
        ~ return true
    }
    
=== function reset_clues() ===
    ~ selected_clue_1 = -> reset_loop
    ~ selected_clue_2 = -> reset_loop
    ~ selected_clue_3 = -> reset_loop
    ~ selected_clue_4 = -> reset_loop
    
=== print_clues ===
    {selected_clue_1 != -> reset_loop: <- selected_clue_1}
    {selected_clue_2 != -> reset_loop: <- selected_clue_2}
    {selected_clue_3 != -> reset_loop: <- selected_clue_3}
    {selected_clue_4 != -> reset_loop: <- selected_clue_4}
    -> DONE
    
=== bad_clues_selected ===
    This doesn't seem right? # result
    ->->
    
=== function has_selected_clue() ===
    {selected_clue_1 != -> reset_loop || selected_clue_2 != -> reset_loop || selected_clue_3 != -> reset_loop || selected_clue_4 != -> reset_loop:
        ~ return true
    }
    ~ return false
    
=== function validate_1_clue(-> clue_1) ===
    {selected_clue_1 == clue_1 && selected_clue_2 == -> reset_loop && selected_clue_3 == -> reset_loop && selected_clue_4 == -> reset_loop:
        ~ return true
    }
    ~ return false
    
=== function validate_2_clues(-> clue_1, -> clue_2) ===
    {
        - selected_clue_1 == clue_1 && selected_clue_2 == clue_2 && selected_clue_3 == -> reset_loop && selected_clue_4 == -> reset_loop:
            ~ return true
        - selected_clue_1 == clue_2 && selected_clue_2 == clue_1 && selected_clue_3 == -> reset_loop && selected_clue_4 == -> reset_loop:
            ~ return true
    }
    ~ return false
    
=== function validate_3_clues(-> clue_1, -> clue_2, -> clue_3) ===
    {
        - selected_clue_1 == clue_1 && selected_clue_2 == clue_2 && selected_clue_3 == clue_3 && selected_clue_4 == -> reset_loop:
            ~ return true
        - selected_clue_1 == clue_1 && selected_clue_2 == clue_3 && selected_clue_3 == clue_2 && selected_clue_4 == -> reset_loop:
            ~ return true
        - selected_clue_1 == clue_2 && selected_clue_2 == clue_1 && selected_clue_3 == clue_3 && selected_clue_4 == -> reset_loop:
            ~ return true
        - selected_clue_1 == clue_2 && selected_clue_2 == clue_3 && selected_clue_3 == clue_1 && selected_clue_4 == -> reset_loop:
            ~ return true
        - selected_clue_1 == clue_3 && selected_clue_2 == clue_1 && selected_clue_3 == clue_2 && selected_clue_4 == -> reset_loop:
            ~ return true
        - selected_clue_1 == clue_3 && selected_clue_2 == clue_2 && selected_clue_3 == clue_1 && selected_clue_4 == -> reset_loop:
            ~ return true
    }
    ~ return false
    
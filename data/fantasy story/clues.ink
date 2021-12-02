=== print_clue_option(-> option) ===
    -> option ->->

VAR at_least_one_activated_clue = false
=== function has_clues_activated() ===
    ~ return at_least_one_activated_clue

=== act_1_clues(-> loop_knot) ===
    # clues_start
    <- gronk_race_trunk_question(loop_knot)
    <- gronk_race_sounds_question(loop_knot)
    <- gronk_class_berserker_question(loop_knot)
    <- clarisse_race_horns_question(loop_knot)
    <- clarisse_race_red_question(loop_knot)
    <- clarisse_race_birth_question(loop_knot)
    <- clarisse_class_luth_question(loop_knot)
    <- clarisse_class_luth_magic_question(loop_knot)
    <- henry_race_ears_question(loop_knot)
    <- henry_class_tyr_question(loop_knot)
    <- sophia_class_knows_kobolds_question(loop_knot)
    <- sophia_class_knows_nature_question(loop_knot)
    <- kobolds_appearance_question(loop_knot)
    <- kobolds_weapons_question(loop_knot)
    <- kobolds_pacific_question(loop_knot)
    <- check_alcool_saving_throw_question(loop_knot)
    <- check_persuasion_fail_question(loop_knot)
    <- check_help_persuasion_success_question(loop_knot)
    +   {has_selected_clue()} [Reset]
        ~ reset_clues()
        -> reset_loop -> loop_knot
    +   [Refresh]
        -> loop_knot
    # clues_end
    ->->

VAR act_1_gronk_race_trunk_activated = false
VAR act_1_gronk_race_trunk_text = "\"Removing its <b>trunk</b> from one of the kegs, it starts speaking in a loud voice, seeming like it is screaming each word\" -- Trunk? What could that mean? It looks like this character is some sort of elephant like creature."
= gronk_race_trunk 
    {act_1_gronk_race_trunk_text}
    -> DONE

= gronk_race_trunk_question(-> loop_knot)
    # towards=act_1_question.gronk_race name=gronk_race_trunk
    + (gronk_race_trunk_selected) {act_1_gronk_race_trunk_activated && not act_1_gronk_race_answered && new_this_loop(->gronk_race_trunk_selected)} [{act_1_gronk_race_trunk_text}]
        ~ select_clue(->act_1_clues.gronk_race_trunk)
        -> loop_knot
    -> DONE
    
VAR act_1_gronk_race_sounds_activated = false
VAR act_1_gronk_race_sounds_text = "\"he starts swinging his trunk widely and singing songs in an unknown language, <b>sounding almost like trumpet sounds</b>\" -- Trumpet sounds? What kind of creature would make a trumpet sound with a trunk?"
= gronk_race_sounds 
    {act_1_gronk_race_sounds_text}
    -> DONE

= gronk_race_sounds_question(-> loop_knot)
    # towards=act_1_gronk_race_question name=gronk_race_sounds
    + (gronk_race_sounds_selected) {act_1_gronk_race_sounds_activated && not act_1_gronk_race_answered && new_this_loop(->gronk_race_sounds_selected)} [{act_1_gronk_race_sounds_text}]
        ~ select_clue(->act_1_clues.gronk_race_sounds)
        -> loop_knot
    -> DONE
    
VAR act_1_gronk_class_berserker_activated = false
VAR act_1_gronk_class_berserker_text = "\"Gronk: And Gronk’s maul! <b>For the Berserker clan</b>!\" -- It look like Gronk was raised in a clan? Though that clan sounds very warlike."
= gronk_class_berserker 
    {act_1_gronk_class_berserker_text}
    -> DONE

= gronk_class_berserker_question(-> loop_knot)
    # towards=act_1_gronk_class_question name=gronk_class_berserker
    + (gronk_class_berserker_selected) {act_1_gronk_class_berserker_activated && not act_1_gronk_class_answered && new_this_loop(->gronk_class_berserker_selected)} [{act_1_gronk_class_berserker_text}]
        ~ select_clue(->act_1_clues.gronk_class_berserker)
        -> loop_knot
    -> DONE
    
VAR act_1_clarisse_race_horns_activated = false
VAR act_1_clarisse_race_horns_text = "\"Clarisse places her long black hair against one of <b>her horns</b> and faces the wizard.\" -- Horns? Another non-human character I assume, but what kind of race has horns in D&D?"
= clarisse_race_horns 
    {act_1_clarisse_race_horns_text}
    -> DONE

= clarisse_race_horns_question(-> loop_knot)
    # towards=act_1_clarisse_race_question name=clarisse_race_horns
    + (clarisse_race_horns_selected) {act_1_clarisse_race_horns_activated && not act_1_clarisse_race_answered && new_this_loop(->clarisse_race_horns_selected)} [{act_1_clarisse_race_horns_text}]
        ~ select_clue(->act_1_clues.clarisse_race_horns)
        -> loop_knot
    -> DONE
    
VAR act_1_clarisse_race_red_activated = false
VAR act_1_clarisse_race_red_text = "\"Sandar, talking to Clarisse about the red lizard-like creatures: [...] <b>Not too dissimilar from you</b>, not to sound too disrespectful.\" -- Clarisse was asking about the creatures being red humanoids. Does this mean that Clarisse also has a red skin?"
= clarisse_race_red
    {act_1_clarisse_race_red_text}
    -> DONE

= clarisse_race_red_question(-> loop_knot)
    # towards=act_1_clarisse_race_question name=clarisse_race_red
    + (clarisse_race_red_selected) {act_1_clarisse_race_red_activated && not act_1_clarisse_race_answered && new_this_loop(->clarisse_race_red_selected)} [{act_1_clarisse_race_red_text}]
        ~ select_clue(->act_1_clues.clarisse_race_red)
        -> loop_knot
    -> DONE
    
VAR act_1_clarisse_race_birth_activated = false
VAR act_1_clarisse_race_birth_text = "\"Sandar, talking to Clarisse about the red lizard-like creatures: [...] <b>Not too dissimilar from you</b>, not to sound too disrespectful.\" -- Clarisse was asking about the creatures being red humanoids. Does this mean that Clarisse also has a red skin?"
= clarisse_race_birth
    {act_1_clarisse_race_birth_text}
    -> DONE

= clarisse_race_birth_question(-> loop_knot)
    # towards=act_1_clarisse_race_question name=clarisse_race_birth
    + (clarisse_race_birth_selected) {act_1_clarisse_race_birth_activated && not act_1_clarisse_race_answered && new_this_loop(->clarisse_race_birth_selected)} [{act_1_clarisse_race_birth_text}]
        ~ select_clue(->act_1_clues.clarisse_race_birth)
        -> loop_knot
    -> DONE
    
VAR act_1_clarisse_class_luth_activated = false
VAR act_1_clarisse_class_luth_text = "\"Gronk: [...] <b>Luth Girl</b>, you’re the one who said we should come here, where is that wizard?\" -- Gronk addresses a character said to own a luth. Maybe some kind of ministrel?"
= clarisse_class_luth
    {act_1_clarisse_class_luth_text}
    -> DONE

= clarisse_class_luth_question(-> loop_knot)
    # towards=act_1_clarisse_class_question name=clarisse_class_luth
    + (clarisse_class_luth_selected) {act_1_clarisse_class_luth_activated && not act_1_clarisse_class_answered && new_this_loop(->clarisse_class_luth_selected)} [{act_1_clarisse_class_luth_text}]
        ~ select_clue(->act_1_clues.clarisse_class_luth)
        -> loop_knot
    -> DONE
    
VAR act_1_clarisse_class_luth_magic_activated = false
VAR act_1_clarisse_class_luth_magic_text = "\"Clarisse, showing a beaming smile as she <b>takes up her luth</b>, stands up and starts playing some random notes. It is as if the music ringed a chord with Sandar as he immediately starts smiling and looking far friendlier.\" -- Why did Clarisse start randoly playing music before she spoke? And why did the wizard look so friendly after she did?"
= clarisse_class_luth_magic
    {act_1_clarisse_class_luth_magic_text}
    -> DONE

= clarisse_class_luth_magic_question(-> loop_knot)
    # towards=act_1_clarisse_class_question name=clarisse_class_luth_magic
    + (clarisse_class_luth_magic_selected) {act_1_clarisse_class_luth_magic_activated && not act_1_clarisse_class_answered && new_this_loop(->clarisse_class_luth_magic_selected)} [{act_1_clarisse_class_luth_magic_text}]
        ~ select_clue(->act_1_clues.clarisse_class_luth_magic)
        -> loop_knot
    -> DONE
    
VAR act_1_henry_race_ears_activated = false
VAR act_1_henry_race_ears_text = "\"Henry, noticing his blunder, bows quickly to Clarisse and stays silent, his <b>long ears</b> slightly reddened by the embarrassment.\" -- Henry has long ears, likely an elf? Though I hear there are many kind of eles in D&D."
= henry_race_ears
    {act_1_henry_race_ears_text}
    -> DONE

= henry_race_ears_question(-> loop_knot)
    # towards=act_1_henry_race_question name=henry_race_ears
    + (henry_race_ears_selected) {act_1_henry_race_ears_activated && not act_1_henry_race_answered && new_this_loop(->henry_race_ears_selected)} [{act_1_henry_race_ears_text}]
        ~ select_clue(->act_1_clues.henry_race_ears)
        -> loop_knot
    -> DONE
    
VAR act_1_henry_class_tyr_activated = false
VAR act_1_henry_class_tyr_text = "\"Henry: Indeed, I give my promise as well. <b>Followers of Tyr</b> never break a promise.\" -- It sounds like Tyr is some kind of God in D&D. Though Henry's claim make him sound very devout. He might be a priest?"
= henry_class_tyr
    {act_1_henry_class_tyr_text}
    -> DONE

= henry_class_tyr_question(-> loop_knot)
    # towards=act_1_henry_class_question name=henry_class_tyr
    + (henry_class_tyr_selected) {act_1_henry_class_tyr_activated && not act_1_henry_class_answered && new_this_loop(->henry_class_tyr_selected)} [{act_1_henry_class_tyr_text}]
        ~ select_clue(->act_1_clues.henry_class_tyr)
        -> loop_knot
    -> DONE
    
VAR act_1_sophia_class_knows_kobolds_activated = false
VAR act_1_sophia_class_knows_kobolds_text = "\"Henry: Indeed, I give my promise as well. <b>Followers of Tyr</b> never break a promise.\" -- It sounds like Tyr is some kind of God in D&D. Though Henry's claim make him sound very devout. He might be a priest?"
= sophia_class_knows_kobolds
    {act_1_sophia_class_knows_kobolds_text}
    -> DONE

= sophia_class_knows_kobolds_question(-> loop_knot)
    # towards=act_1_sophia_class_question name=sophia_class_knows_kobolds
    + (sophia_class_knows_kobolds_selected) {act_1_sophia_class_knows_kobolds_activated && not act_1_sophia_class_answered && new_this_loop(->sophia_class_knows_kobolds_selected)} [{act_1_sophia_class_knows_kobolds_text}]
        ~ select_clue(->act_1_clues.sophia_class_knows_kobolds)
        -> loop_knot
    -> DONE
    
VAR act_1_sophia_class_knows_nature_activated = false
VAR act_1_sophia_class_knows_nature_text = "\"Sophia: <b>I know a lot about nature</b> I am sure we will figure something up.\" -- This sound like Sophia had specific training to know what she knows. Maybe as some kind of hunter?"
= sophia_class_knows_nature
    {act_1_sophia_class_knows_nature_text}
    -> DONE

= sophia_class_knows_nature_question(-> loop_knot)
    # towards=act_1_sophia_class_question name=sophia_class_knows_nature
    + (sophia_class_knows_nature_selected) {act_1_sophia_class_knows_nature_activated && not act_1_sophia_class_answered && new_this_loop(->sophia_class_knows_nature_selected)} [{act_1_sophia_class_knows_nature_text}]
        ~ select_clue(->act_1_clues.sophia_class_knows_nature)
        -> loop_knot
    -> DONE
    
VAR act_1_kobolds_appearance_activated = false
VAR act_1_kobolds_appearance_text = "\"Yet, it seems a group of <b>small red lizard-like creatures</b> have used this to their advantage\" -- Red, lizard-like creatures? Like salamanders maybe?"
= kobolds_appearance
    {act_1_kobolds_appearance_text}
    -> DONE

= kobolds_appearance_question(-> loop_knot)
    # towards=act_1_kobolds_question name=kobolds_appearance
    + (kobolds_appearance_selected) {act_1_kobolds_appearance_activated && not act_1_kobolds_answered && new_this_loop(->kobolds_appearance_selected)} [{act_1_kobolds_appearance_text}]
        ~ select_clue(->act_1_clues.kobolds_appearance)
        -> loop_knot
    -> DONE
    
VAR act_1_kobolds_weapons_activated = false
VAR act_1_kobolds_weapons_text = "\"Many farmers have reported livestock being slaughtered, <b>killed with primitive weapons</b>\" -- Sounds like an intelligent or civilized creature. I wonder what they look like."
= kobolds_weapons
    {act_1_kobolds_weapons_text}
    -> DONE

= kobolds_weapons_question(-> loop_knot)
    # towards=act_1_kobolds_question name=kobolds_weapons
    + (kobolds_weapons_selected) {act_1_kobolds_weapons_activated && not act_1_kobolds_answered && new_this_loop(->kobolds_weapons_selected)} [{act_1_kobolds_weapons_text}]
        ~ select_clue(->act_1_clues.kobolds_weapons)
        -> loop_knot
    -> DONE
    
VAR act_1_kobolds_pacific_activated = false
VAR act_1_kobolds_pacific_text = "\"Sophia: <b>I have learned that Kobolds are pacific creatures</b>, they don’t attack without reason.\" -- What kind of culture or civilization would Kobolds have? What do they look like?"
= kobolds_pacific
    {act_1_kobolds_pacific_text}
    -> DONE

= kobolds_pacific_question(-> loop_knot)
    # towards=act_1_kobolds_question name=kobolds_pacific
    + (kobolds_pacific_selected) {act_1_kobolds_pacific_activated && not act_1_kobolds_answered && new_this_loop(->kobolds_pacific_selected)} [{act_1_kobolds_pacific_text}]
        ~ select_clue(->act_1_clues.kobolds_pacific)
        -> loop_knot
    -> DONE
    
VAR act_1_check_alcool_saving_throw_activated = false
VAR act_1_check_alcool_saving_throw_text = "\"Gronk simply shrugs and resumes his drinking session. <b>It looks like the alcohol is getting to him</b>\" -- I'm not sure why Gronk would suddenly become drunk. It seems jaring in the story, I wonder if some factor caused that?"
= check_alcool_saving_throw
    {act_1_check_alcool_saving_throw_text}
    -> DONE

= check_alcool_saving_throw_question(-> loop_knot)
    # towards=act_1_saving_throw_question name=check_alcool_saving_throw
    + (check_alcool_saving_throw_selected) {act_1_check_alcool_saving_throw_activated && not act_1_saving_throw_answered && new_this_loop(->check_alcool_saving_throw_selected)} [{act_1_check_alcool_saving_throw_text}]
        ~ select_clue(->act_1_clues.check_alcool_saving_throw)
        -> loop_knot
    -> DONE
    
VAR act_1_check_persuasion_fail_activated = false
VAR act_1_check_persuasion_fail_text = "\"Sandar: Hum, <b>I don’t think that will be enough</b>. They might come back.\" -- Why did Sandar refuse to be convinced? It seems like he should have said yes. Maybe there is more to this."
= check_persuasion_fail
    {act_1_check_persuasion_fail_text}
    -> DONE

= check_persuasion_fail_question(-> loop_knot)
    # towards=act_1_persuasion_check_question name=check_persuasion_fail
    + (check_persuasion_fail_selected) {act_1_check_persuasion_fail_activated && not act_1_persuasion_check_answered && new_this_loop(->check_persuasion_fail_selected)} [{act_1_check_persuasion_fail_text}]
        ~ select_clue(->act_1_clues.check_persuasion_fail)
        -> loop_knot
    -> DONE
    
VAR act_1_check_help_persuasion_success_activated = false
VAR act_1_check_help_persuasion_success_text = "\"the group’s promise seems to <b>have reassured the wizard</b>.\" -- And now Sandar has changed his mind? What could have caused this?"
= check_help_persuasion_success
    {act_1_check_help_persuasion_success_text}
    -> DONE

= check_help_persuasion_success_question(-> loop_knot)
    # towards=act_1_persuasion_check_question name=check_help_persuasion_success
    + (check_help_persuasion_success_selected) {act_1_check_help_persuasion_success_activated && not act_1_persuasion_check_answered && new_this_loop(->check_help_persuasion_success_selected)} [{act_1_check_help_persuasion_success_text}]
        ~ select_clue(->act_1_clues.check_help_persuasion_success)
        -> loop_knot
    -> DONE
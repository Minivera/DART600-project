=== print_clue_option(-> option) ===
    -> option ->->

VAR at_least_one_activated_clue = false
=== function has_clues_activated() ===
    ~ return at_least_one_activated_clue

/*
wtf_bears
    They have studied humans, learned their mannerisms, their speech, and how to be like them@bears_studied_humans
    If only the group had a brain@role_brains
    
polar_bear
    Ojsan [...] shave their hair into a poodle cut. A very, very large poodle.@ojsan_poodle_cut
    they were a polar bear, they could swim effortlessly@polar_bear_swim
    
honey_badger
    As a honey badger, they are very well suited to creating mayhem@honey_badger_mayhem

group
    Bosse "Potatisnäsan”, Potato Nose, a retired Sun Bear@bosse_title
    the young Ingen Vet [...] though the unhinged attitude of the Honey Badger makes teaching difficult@vet_title
    Ojsan was known as the greatest polar bear truck driver in all of the north during their prime@ojsan_title
    Gryta [...] a middle aged and slick grizzly, who is looking for a chance to meet humans@gryta_title
    
isidor_role
    They seem to be all about muscles@isidor_muscles
    They’re a bit for a rookie, but their polar bear nature makes them a perfect addition to your team.@isidor_title
    They are a hired muscles after all@isidor_muscles
    
bosse_role
    great thief training from Bosse@ingen_bosse_thief
    
ingen_role
    Ingen took this chance to peek at the code and succeeded, thanks to their great thief training from Bosse@ingen_bosse_thief
    
gryta_role
    Gryta initially wanted to hack themselves to become an ant@gryta_can_hack
    Gryta decides to hack the boat using their watch. Strangely, they succeed in doing just that@gryta_successful_hack
    If only Gryta the Hacker was here@gryta_hacker
    
bosse_descriptor
    The old bear had a hard time holding two jars at the same time@bosse_retired

reveal
    Albert smiles again [...] never met any sloth bears who participated in honey heists@sloth_bear_suspicious
    
bear_roll
    nearly drowning almost six times@bear_roll_fail
    Gryta rushed up the staircase [...] their bear agility allowed them to narrowly evade the dart@successful_bear_roll
    Ojsan decided to play dead, but failing to successfully appear as a dead bear@failed_bear_roll
    
criminal_roll
    Not noticing the giant bears in front of them@successful_criminal_check
    The couple never suspected anything@other_successful_criminal_check

stats
    Ingen, being the most human-like of them all@ingen_high_criminal

stat_change
    Ojsna finds it difficult to row the boat to safety and, in their frustration, gently crashes into the beach behind the tents instead@ojsan_frustration
    fills with as much honey as possible, resisting their bear urges and focusing on the mission@bosse_and_honey
    Isidor, trying to act as much as a poodle as possible, throws boxes around to cover their friend’s retreat@isidor_frustration
    Isidor reminds the group of their planning session [...] resisting their bear instincts@isidor_flashback
    
    
*/

=== clues(-> loop_knot) ===
    # clues_start
    <- bears_studied_humans_question(loop_knot)
    <- role_brains_question(loop_knot)
    <- ojsan_poodle_cut_question(loop_knot)
    <- polar_bear_swim_question(loop_knot)
    <- honey_badger_mayhem_question(loop_knot)
    <- bosse_title_question(loop_knot)
    <- vet_title_question(loop_knot)
    <- ojsan_title_question(loop_knot)
    <- gryta_title_question(loop_knot)
    <- isidor_muscles_question(loop_knot)
    <- isidor_title_question(loop_knot)
    <- isidor_muscles_role_question(loop_knot)
    <- ingen_bosse_thief_question(loop_knot)
    <- gryta_can_hack_question(loop_knot)
    <- gryta_successful_hack_question(loop_knot)
    <- gryta_hacker_question(loop_knot)
    <- bosse_retired_question(loop_knot)
    <- sloth_bear_suspicious_question(loop_knot)
    <- successful_bear_roll_question(loop_knot)
    <- failed_bear_roll_question(loop_knot)
    <- successful_criminal_check_question(loop_knot)
    <- other_successful_criminal_check_question(loop_knot)
    <- ingen_high_criminal_question(loop_knot)
    <- ojsan_frustration_question(loop_knot)
    <- bosse_and_honey_question(loop_knot)
    <- isidor_frustration_question(loop_knot)
    <- isidor_flashback_question(loop_knot)
    +   {has_selected_clue()} [Reset]
        ~ reset_clues()
        -> reset_loop -> loop_knot
    +   [Refresh]
        -> loop_knot
    # clues_end
    ->->

VAR bears_studied_humans_activated = false
VAR bears_studied_humans_text = "\"They have studied humans, learned their mannerisms, their speech, and how to be like them\" -- How come bears have learned to be human? How did they do that?"
= bears_studied_humans 
    {bears_studied_humans_text}
    -> DONE

= bears_studied_humans_question(-> loop_knot)
    # towards=questions.wtf_bears name=bears_studied_humans
    + (bears_studied_humans_selected) {bears_studied_humans_activated && not wtf_bears_answered && new_this_loop(->bears_studied_humans_selected)} [{bears_studied_humans_text}]
        ~ select_clue(->clues.bears_studied_humans)
        -> loop_knot
    -> DONE
    
VAR role_brains_activated = false
VAR role_brains_text = "\"If only the group had a brain\" -- I think brain here means the 'brains' of the team, the one coming up with the plan. Can bears even get that organized?"
= role_brains 
    {role_brains_text}
    -> DONE

= role_brains_question(-> loop_knot)
    # towards=questions.wtf_bears name=role_brains
    + (role_brains_selected) {role_brains_activated && not wtf_bears_answered && new_this_loop(->role_brains_selected)} [{role_brains_text}]
        ~ select_clue(->clues.role_brains)
        -> loop_knot
    -> DONE
    
VAR ojsan_poodle_cut_activated = false
VAR ojsan_poodle_cut_text = "\"Ojsan [...] shave their hair into a poodle cut. A very, very large poodle.\" -- Poodle have many colors, but they're often seen white. What kind of bear could cut their hair to look like a white poodle?"
= ojsan_poodle_cut 
    {ojsan_poodle_cut_text}
    -> DONE

= ojsan_poodle_cut_question(-> loop_knot)
    # towards=questions.polar_bear name=ojsan_poodle_cut
    + (ojsan_poodle_cut_selected) {ojsan_poodle_cut_activated && not polar_bear_answered && new_this_loop(->ojsan_poodle_cut_selected)} [{ojsan_poodle_cut_text}]
        ~ select_clue(->clues.ojsan_poodle_cut)
        -> loop_knot
    -> DONE
    
VAR polar_bear_swim_activated = false
VAR polar_bear_swim_text = "\"they were a polar bear, they could swim effortlessly\" -- Gryta curses the fact the're not polar bear. Swimming might be a polar bear's ability or something?"
= polar_bear_swim 
    {polar_bear_swim_text}
    -> DONE

= polar_bear_swim_question(-> loop_knot)
    # towards=questions.polar_bear name=polar_bear_swim
    + (polar_bear_swim_selected) {polar_bear_swim_activated && not polar_bear_answered && new_this_loop(->polar_bear_swim_selected)} [{polar_bear_swim_text}]
        ~ select_clue(->clues.polar_bear_swim)
        -> loop_knot
    -> DONE
    
VAR honey_badger_mayhem_activated = false
VAR honey_badger_mayhem_text = "\"As a honey badger, they are very well suited to creating mayhem\" -- Another mention of a special ability. I assume this might be a honey badger's special ability?"
= honey_badger_mayhem 
    {polar_bear_swim_text}
    -> DONE

= honey_badger_mayhem_question(-> loop_knot)
    # towards=questions.honey_badger name=honey_badger_mayhem
    + (honey_badger_mayhem_selected) {honey_badger_mayhem_activated && not honey_badger_answered && new_this_loop(->honey_badger_mayhem_selected)} [{honey_badger_mayhem_text}]
        ~ select_clue(->clues.honey_badger_mayhem)
        -> loop_knot
    -> DONE
    
VAR bosse_title_activated = false
VAR bosse_title_text = "\"Bosse 'Potatisnäsan', Potato Nose, a retired Sun Bear\" -- Bosse is a retired Sun bear? Retired from what?"
= bosse_title 
    {bosse_title_text}
    -> DONE

= bosse_title_question(-> loop_knot)
    # towards=questions.group name=bosse_title
    + (bosse_title_selected) {bosse_title_activated && not group_answered && new_this_loop(->bosse_title_selected)} [{bosse_title_text}]
        ~ select_clue(->clues.bosse_title)
        -> loop_knot
    -> DONE
    
VAR vet_title_activated = false
VAR vet_title_text = "\"the young Ingen Vet [...] though the unhinged attitude of the Honey Badger makes teaching difficult\" -- Is the mention of 'unhinged' here meant to describe honey badgers in general?"
= vet_title 
    {vet_title_text}
    -> DONE

= vet_title_question(-> loop_knot)
    # towards=questions.group name=vet_title
    + (vet_title_selected) {vet_title_activated && not group_answered && new_this_loop(->vet_title_selected)} [{vet_title_text}]
        ~ select_clue(->clues.vet_title)
        -> loop_knot
    -> DONE
    
VAR ojsan_title_activated = false
VAR ojsan_title_text = "\"Ojsan was known as the greatest polar bear truck driver in all of the north during their prime\" -- A breat truck driver?! The story also mention they're unhinged, like Ingen."
= ojsan_title 
    {ojsan_title_text}
    -> DONE

= ojsan_title_question(-> loop_knot)
    # towards=questions.group name=ojsan_title
    + (ojsan_title_selected) {ojsan_title_activated && not group_answered && new_this_loop(->ojsan_title_selected)} [{ojsan_title_text}]
        ~ select_clue(->clues.ojsan_title)
        -> loop_knot
    -> DONE
    
VAR gryta_title_activated = false
VAR gryta_title_text = "\"Gryta [...] a middle aged and slick grizzly, who is looking for a chance to meet humans\" -- Finally a normal bear, though the menton of slick is odd."
= gryta_title 
    {gryta_title_text}
    -> DONE

= gryta_title_question(-> loop_knot)
    # towards=questions.group name=gryta_title
    + (gryta_title_selected) {gryta_title_activated && not group_answered && new_this_loop(->gryta_title_selected)} [{gryta_title_text}]
        ~ select_clue(->clues.gryta_title)
        -> loop_knot
    -> DONE
    
VAR isidor_muscles_activated = false
VAR isidor_muscles_text = "\"They seem to be all about muscles\" -- That's a very human trait to give to a bear, I never though bears could care about their shape."
= isidor_muscles 
    {isidor_muscles_text}
    -> DONE

= isidor_muscles_question(-> loop_knot)
    # towards=questions.isidor_role name=isidor_muscles
    + (isidor_muscles_selected) {isidor_muscles_activated && not isidor_role_answered && new_this_loop(->isidor_muscles_selected)} [{isidor_muscles_text}]
        ~ select_clue(->clues.isidor_muscles)
        -> loop_knot
    
VAR isidor_title_activated = false
VAR isidor_title_text = "\"They’re a bit for a rookie, but their polar bear nature makes them a perfect addition to your team.\" -- They're a rookie polar bear? Rookie from what?"
= isidor_title 
    {isidor_title_text}
    -> DONE

= isidor_title_question(-> loop_knot)
    # towards=questions.isidor_role name=isidor_title
    + (isidor_title_selected) {isidor_title_activated && not isidor_role_answered && new_this_loop(->isidor_title_selected)} [{isidor_title_text}]
        ~ select_clue(->clues.isidor_title)
        -> loop_knot
    -> DONE
    
VAR isidor_muscles_role_activated = false
VAR isidor_muscles_role_text = "\"They are a hired muscles after all\" -- Hired muscles is a term used for mercenaries or though people hired to beat someone up. That doesn't seem very bear-like."
= isidor_muscles_role 
    {isidor_muscles_role_text}
    -> DONE

= isidor_muscles_role_question(-> loop_knot)
    # towards=questions.isidor_role name=isidor_muscles_role
    + (isidor_muscles_role_selected) {isidor_muscles_role_activated && not isidor_role_answered && new_this_loop(->isidor_muscles_role_selected)} [{isidor_muscles_role_text}]
        ~ select_clue(->clues.isidor_muscles_role)
        -> loop_knot
    -> DONE
    
VAR ingen_bosse_thief_activated = false
VAR ingen_bosse_thief_text = "\"Ingen took this chance to peek at the code and succeeded, thanks to their great thief training from Bosse\" -- This implies that both Ingen and Bosse are thiefs. Bosse would be the mentor here? Though what they steal is still unsure."
= ingen_bosse_thief 
    {ingen_bosse_thief_text}
    -> DONE

= ingen_bosse_thief_question(-> loop_knot)
    # towards=questions.bosse_ingen_role name=ingen_bosse_thief
    + (ingen_bosse_thief_selected) {ingen_bosse_thief_activated && not bosse_ingen_role_answered && new_this_loop(->ingen_bosse_thief_selected)} [{ingen_bosse_thief_text}]
        ~ select_clue(->clues.ingen_bosse_thief)
        -> loop_knot
    -> DONE
    
VAR gryta_can_hack_activated = false
VAR gryta_can_hack_text = "\"Gryta initially wanted to hack themselves to become an ant\" -- Wait, a bear hacking? And hacking themselves into an ant? That makes no sense."
= gryta_can_hack 
    {gryta_can_hack_text}
    -> DONE

= gryta_can_hack_question(-> loop_knot)
    # towards=questions.gryta_role name=gryta_can_hack
    + (gryta_can_hack_selected) {gryta_can_hack_activated && not gryta_role_answered && new_this_loop(->gryta_can_hack_selected)} [{gryta_can_hack_text}]
        ~ select_clue(->clues.gryta_can_hack)
        -> loop_knot
    -> DONE
    
VAR gryta_successful_hack_activated = false
VAR gryta_successful_hack_text = "\"Gryta decides to hack the boat using their watch. Strangely, they succeed in doing just that\" -- And now they've successfully hacked something? With a watch?"
= gryta_successful_hack 
    {gryta_successful_hack_text}
    -> DONE

= gryta_successful_hack_question(-> loop_knot)
    # towards=questions.gryta_role name=gryta_successful_hack
    + (gryta_successful_hack_selected) {gryta_successful_hack_activated && not gryta_role_answered && new_this_loop(->gryta_successful_hack_selected)} [{gryta_successful_hack_text}]
        ~ select_clue(->clues.gryta_successful_hack)
        -> loop_knot
    -> DONE
    
VAR gryta_hacker_activated = false
VAR gryta_hacker_text = "\"If only Gryta the Hacker was here\" -- This seems to confirm all bears see Gryta as a hacker, which is very strange."
= gryta_hacker 
    {gryta_hacker_text}
    -> DONE

= gryta_hacker_question(-> loop_knot)
    # towards=questions.gryta_role name=gryta_hacker
    + (gryta_hacker_selected) {gryta_hacker_activated && not gryta_role_answered && new_this_loop(->gryta_hacker_selected)} [{gryta_hacker_text}]
        ~ select_clue(->clues.gryta_hacker)
        -> loop_knot
    -> DONE
    
VAR bosse_retired_activated = false
VAR bosse_retired_text = "\"The old bear had a hard time holding two jars at the same time\" -- Bosse was called a retired bear earlier, maybe that means they are old and not retired from something?"
= bosse_retired 
    {bosse_retired_text}
    -> DONE

= bosse_retired_question(-> loop_knot)
    # towards=questions.bosse_descriptor name=bosse_retired
    + (bosse_retired_selected) {bosse_retired_activated && not bosse_descriptor_answered && new_this_loop(->bosse_retired_selected)} [{bosse_retired_text}]
        ~ select_clue(->clues.bosse_retired)
        -> loop_knot
    -> DONE
    
VAR sloth_bear_suspicious_activated = false
VAR sloth_bear_suspicious_text = "\"Albert smiles again [...] never met any sloth bears who participated in honey heists\" -- The story seems to suggest that I should suspect Albert. What could a sloth bear reveal?"
= sloth_bear_suspicious 
    {sloth_bear_suspicious_text}
    -> DONE

= sloth_bear_suspicious_question(-> loop_knot)
    # towards=questions.reveal name=sloth_bear_suspicious
    + (sloth_bear_suspicious_selected) {sloth_bear_suspicious_activated && not reveal_answered && new_this_loop(->sloth_bear_suspicious_selected)} [{sloth_bear_suspicious_text}]
        ~ select_clue(->clues.sloth_bear_suspicious)
        -> loop_knot
    -> DONE
    
VAR bear_roll_fail_activated = false
VAR bear_roll_fail_text = "\"nearly drowning almost six times\" -- It seems strange for even a grizzly to not be able to swim this much. It also derails the story. Why did this happen?"
= bear_roll_fail 
    {bear_roll_fail_text}
    -> DONE

= bear_roll_fail_question(-> loop_knot)
    # towards=questions.bear_roll name=bear_roll_fail
    + (bear_roll_fail_selected) {bear_roll_fail_activated && not bear_roll_answered && new_this_loop(->bear_roll_fail_selected)} [{bear_roll_fail_text}]
        ~ select_clue(->clues.bear_roll_fail)
        -> loop_knot
    -> DONE
    
VAR successful_bear_roll_activated = false
VAR successful_bear_roll_text = "\"Gryta rushed up the staircase [...] their bear agility allowed them to narrowly evade the dart\" -- And here Gryta success without problem? Why the earlier failure and this success?"
= successful_bear_roll 
    {successful_bear_roll_text}
    -> DONE

= successful_bear_roll_question(-> loop_knot)
    # towards=questions.bear_roll name=successful_bear_roll
    + (successful_bear_roll_selected) {successful_bear_roll_activated && not bear_roll_answered && new_this_loop(->successful_bear_roll_selected)} [{successful_bear_roll_text}]
        ~ select_clue(->clues.successful_bear_roll)
        -> loop_knot
    -> DONE
    
VAR failed_bear_roll_activated = false
VAR failed_bear_roll_text = "\"Ojsan decided to play dead, but failing to successfully appear as a dead bear\" -- While it makes sense for this to fail, why did Ojsan ever try this in the first place only to fail?"
= failed_bear_roll 
    {failed_bear_roll_text}
    -> DONE

= failed_bear_roll_question(-> loop_knot)
    # towards=questions.bear_roll name=failed_bear_roll
    + (failed_bear_roll_selected) {failed_bear_roll_activated && not bear_roll_answered && new_this_loop(->failed_bear_roll_selected)} [{failed_bear_roll_text}]
        ~ select_clue(->clues.failed_bear_roll)
        -> loop_knot
    -> DONE
    
VAR successful_criminal_check_activated = false
VAR successful_criminal_check_text = "\"Not noticing the giant bears in front of them\" -- How come someone can miss a bear in front of them? That seems impossible. It's like an outside force decided this."
= successful_criminal_check 
    {successful_criminal_check_text}
    -> DONE

= successful_criminal_check_question(-> loop_knot)
    # towards=questions.criminal_roll name=successful_criminal_check
    + (successful_criminal_check_selected) {successful_criminal_check_activated && not criminal_roll_answered && new_this_loop(->successful_criminal_check_selected)} [{successful_criminal_check_text}]
        ~ select_clue(->clues.successful_criminal_check)
        -> loop_knot
    -> DONE
    
VAR other_successful_criminal_check_activated = false
VAR other_successful_criminal_check_text = "\"The couple never suspected anything\" -- How can you not notice bears stealing something from you?"
= other_successful_criminal_check 
    {other_successful_criminal_check_text}
    -> DONE

= other_successful_criminal_check_question(-> loop_knot)
    # towards=questions.criminal_roll name=other_successful_criminal_check
    + (other_successful_criminal_check_selected) {other_successful_criminal_check_activated && not criminal_roll_answered && new_this_loop(->other_successful_criminal_check_selected)} [{other_successful_criminal_check_text}]
        ~ select_clue(->clues.other_successful_criminal_check)
        -> loop_knot
    -> DONE
    
VAR ingen_high_criminal_activated = false
VAR ingen_high_criminal_text = "\"Ingen, being the most human-like of them all\" -- But Ingen is a honey badger, probably the less human-like of the bears?"
= ingen_high_criminal 
    {ingen_high_criminal_text}
    -> DONE

= ingen_high_criminal_question(-> loop_knot)
    # towards=questions.stats name=ingen_high_criminal
    + (ingen_high_criminal_selected) {ingen_high_criminal_activated && not stats_answered && new_this_loop(->ingen_high_criminal_selected)} [{ingen_high_criminal_text}]
        ~ select_clue(->clues.ingen_high_criminal)
        -> loop_knot
    -> DONE
    
VAR ojsan_frustration_activated = false
VAR ojsan_frustration_text = "\"Ojsna finds it difficult to row the boat to safety and, in their frustration, gently crashes into the beach behind the tents instead\" -- It sounds like frustation towards the plan make bears be more aggressive?"
= ojsan_frustration 
    {ojsan_frustration_text}
    -> DONE

= ojsan_frustration_question(-> loop_knot)
    # towards=questions.stat_change name=ojsan_frustration_question
    + (ojsan_frustration_selected) {ojsan_frustration_activated && not stat_change_answered && new_this_loop(->ojsan_frustration_selected)} [{ojsan_frustration_text}]
        ~ select_clue(->clues.ojsan_frustration)
        -> loop_knot
    -> DONE
    
VAR bosse_and_honey_activated = false
VAR bosse_and_honey_text = "\"fills with as much honey as possible, resisting their bear urges and focusing on the mission\" -- Honey seems to also potentially make bears more bear-like?"
= bosse_and_honey 
    {bosse_and_honey_text}
    -> DONE

= bosse_and_honey_question(-> loop_knot)
    # towards=questions.stat_change name=bosse_and_honey
    + (bosse_and_honey_selected) {bosse_and_honey_activated && not stat_change_answered && new_this_loop(->bosse_and_honey_selected)} [{bosse_and_honey_text}]
        ~ select_clue(->clues.bosse_and_honey)
        -> loop_knot
    -> DONE
    
VAR isidor_frustration_activated = false
VAR isidor_frustration_text = "\"Isidor, trying to act as much as a poodle as possible, throws boxes around to cover their friend’s retreat\" -- Another instance of frustration making bears more aggressive, which is more bear-like I suppose?"
= isidor_frustration 
    {isidor_frustration_text}
    -> DONE

= isidor_frustration_question(-> loop_knot)
    # towards=questions.stat_change name=isidor_frustration
    + (isidor_frustration_selected) {isidor_frustration_activated && not stat_change_answered && new_this_loop(->isidor_frustration_selected)} [{isidor_frustration_text}]
        ~ select_clue(->clues.isidor_frustration)
        -> loop_knot
    -> DONE
    
VAR isidor_flashback_activated = false
VAR isidor_flashback_text = "\"Isidor reminds the group of their planning session [...] resisting their bear instincts\" -- It almost sounds like a cinematic flashback make everyone less bear-like."
= isidor_flashback 
    {isidor_flashback_text}
    -> DONE

= isidor_flashback_question(-> loop_knot)
    # towards=questions.stat_change name=isidor_flashback
    + (isidor_flashback_selected) {isidor_flashback_activated && not stat_change_answered && new_this_loop(->isidor_flashback_selected)} [{isidor_flashback_text}]
        ~ select_clue(->clues.isidor_flashback)
        -> loop_knot
    -> DONE
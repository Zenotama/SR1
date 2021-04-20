
-- CONSTANTS ----------------------------

-- GLOBAL VARIABLES ---------------------

-- FUNCTIONS ----------------------------

function tss05_cleanup()
	-- unregister functions
end

function tss05_success()
end

function tss05_win()
	cutscene_in("final_cutscene_2")
	achievement_award()
	party_dismiss_all()
	cutscene_play("final_cutscene_2", true)

	--credits_full_roll_do(true)
	--handle = audio_play_do("NEWS_HUGHES_EXP", "music", false, true)

	-- since the above call pauses the game we only need to yield the thread
	-- it won't return until the game is unpaused, i.e. when credits are done
	--thread_yield();

	-- Stop the audio.
	--if (audio_is_playing(handle)) then
	--	audio_stop(handle)
	--end

	game_quit_to_main_menu()
	--mission_end_success("tss05")
end

function tss05_start()
	set_mission_author("Sandeep Shekar")
	
	tss05_win()
end

function tss05_warp()
	--teleport("#PLAYER#", "tss02_$execute lua script000")
end
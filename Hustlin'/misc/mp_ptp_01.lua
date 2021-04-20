--Globals
Spawn_process_handle		= 0		-- Thread handle for the spawn process thread

function mp_ptp_01_init()

end

function mp_ptp_01_main()
Spawn_process_handle = thread_new("mptest")
end

-- Monitors Goods (mostly to deal with their timers).
--
function mptest()
	
	-- Do this until the thread gets killed.
	while true do
	delay(5)
	mp_chat_msg("MSN_BOX_DELIVERED")
    end
end
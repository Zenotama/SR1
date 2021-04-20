

	-- PROFILING --

-- Globals --

function profiling_destroy_all_groups()
	destroy_group("profiling_sr_01")
	destroy_group("profiling_sr_02")
	destroy_group("profiling_sr_03")
	destroy_group("profiling_sr_04")
	destroy_group("profiling_sr_05")
end

function profiling_cleanup()
	profiling_destroy_all_groups()
end

function profiling_start()

end

function profiling_init_sr_01()
	profiling_destroy_all_groups()
	create_group("profiling_sr_01", true)
end

function profiling_init_sr_02()
	profiling_destroy_all_groups()
	create_group("profiling_sr_02", true)
end

function profiling_init_sr_03()
	profiling_destroy_all_groups()
	create_group("profiling_sr_03", true)
end

function profiling_init_sr_04()
	profiling_destroy_all_groups()
	create_group("profiling_sr_04", true)
end

function profiling_init_sr_05()
	profiling_destroy_all_groups()
	create_group("profiling_sr_05", true)
end
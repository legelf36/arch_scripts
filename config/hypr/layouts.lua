hl.config({
	dwindle = {
		preserve_split = true,
	},
	scrolling = {
		fullscreen_on_one_column = true,
		follow_focus = true,
		direction = "up",
	},
	-- Master layout is handled here if needed
	master = {
		-- new_status = "master" -- Commented out due to compatibility reasons
	},

	binds = {
		workspace_back_and_forth = false,
		allow_workspace_cycles = true,
		pass_mouse_when_bound = false,
	},
})

-- New "Input" lua configuration file
-- called from "hyprland.lua" configuration file
hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:escape",
		kb_rules = "",
		follow_mouse = 1,
		numlock_by_default = true,
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
		touchpad = {
			natural_scroll = false,
			scroll_factor = 0.2, -- slow down scrolling on laptop touchpad
		},
	},
})

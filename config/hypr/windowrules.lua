hl.window_rule({ match = { workspace = 1 }, float = true })
hl.window_rule({ match = { workspace = 6 }, float = true })
hl.window_rule({ match = { class = "org.freecad.FreeCAD" }, workspace = 3 })
hl.window_rule({ match = { class = "steam" }, workspace = 5 })
hl.window_rule({ match = { class = "Google Earth Pro" }, workspace = 4 })

hl.window_rule({
	match = {
		class = "^(conky)$",
	},
	workspace = 1,
	float = true,
	move = { 415, 65 },
})
hl.window_rule({
	match = {
		class = "^(Conky)$",
	},
	workspace = 1,
	float = true,
	move = { 560, 90 },
})
hl.window_rule({
	match = {
		class = "^(brave-browser)$",
	},
	workspace = 2,
})
hl.window_rule({
	match = {
		class = "^(zen)$",
	},
	workspace = 2,
})

hl.window_rule({
	match = {
		class = "^(brave-browser)$",
		initial_title = "New Private Tab - Brave",
	},
	--	workspace = 9,
})
hl.window_rule({
	match = {
		class = "^(zen)$",
		title = "(Zen Browser Private Browsing)",
	},
	workspace = 9,
})

hl.window_rule({
	match = {
		initial_title = "^(Ghostty)$",
	},
	float = true,
	no_shadow = true,
	persistent_size = true,
	size = { 1100, 950 },
	move = { 415, 65 },
})
hl.window_rule({
	match = {
		class = "^(kitty)$",
	},
	float = true,
	no_shadow = true,
	size = { 800, 900 },
	move = { 415, 65 },
})
hl.window_rule({
	match = {
		class = ".*",
	},
	name = "suppress-maximize-events",
	suppress_event = "maximize",
})
hl.window_rule({
	name = "fix-xwayland-drags",
	match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
	no_focus = true,
})
hl.window_rule({
	match = {
		class = "^(gimp)$",
		initial_title = "^(Sharpen (Unsharp Mask))",
	},
	move = { 55, 450 },
})

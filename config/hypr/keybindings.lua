local terminal = "ghostty"
local fileManager = "nemo"
local launcher = 'rofi -modes "run,drun,ssh" -width 10 -show drun'
local runner = "rofi -show run -width 10"
local mainMod = "SUPER"
local secondMod = "SUPER + SHIFT"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(launcher))
hl.bind(secondMod .. " + D", hl.dsp.exec_cmd(runner))

hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("freecad"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("QT_QPA_PLATFORM=xcb google-earth-pro"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("kate"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + n", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + l", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("brave --force-device-scale-factor=1.0"))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("zen-browser"))
hl.bind(secondMod .. "+ B", hl.dsp.exec_cmd("brave --incognito --force-device-scale-factor=1.0"))
hl.bind(secondMod .. "+ Y", hl.dsp.exec_cmd("zen-browser --private-window"), { workspace = "9" })
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(secondMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

hl.bind(
	mainMod .. " + E",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")
)
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(
	mainMod .. " + A",
	hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }),
	{ description = "Toggle Fullscreen" }
)
hl.bind(
	mainMod .. " + Z",
	hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }),
	{ description = "Toggle Maximize Window" }
)
hl.bind(mainMod .. " + v", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle Floating" })

hl.bind(mainMod .. " + X", hl.dsp.workspace.toggle_special("magic"))
hl.bind(secondMod .. " + X", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Switch to next workspace" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "Switch to previous workspace" })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window with the mouse" })
hl.bind(
	mainMod .. " + mouse:273",
	hl.dsp.window.resize(),
	{ mouse = true, description = "Resize window with the mouse" }
)

-- move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }), { description = "Move focus left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Move focus right" })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }), { description = "Move focus up" })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }), { description = "Move focus down" })

-- resize window
hl.bind(
	secondMod .. " + right",
	hl.dsp.window.resize({ x = 100, y = 0, relative = true }),
	{ repeating = true },
	{ description = "Increase window width with keyboard" }
)
hl.bind(
	secondMod .. " + left",
	hl.dsp.window.resize({ x = -100, y = 0, relative = true }),
	{ repeating = true },
	{ description = "Reduce window width with keyboard" }
)
hl.bind(
	secondMod .. " + down",
	hl.dsp.window.resize({ x = 0, y = 100, relative = true }),
	{ repeating = true },
	{ description = "Increase window height with keyboard" }
)
hl.bind(
	secondMod .. " + up",
	hl.dsp.window.resize({ x = 0, y = -100, relative = true }),
	{ repeating = true },
	{ description = "Reduce window height with keyboard" }
)

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Focus workspace " .. i })
	hl.bind(
		secondMod .. " + " .. key,
		hl.dsp.window.move({ workspace = i }),
		{ description = "Move window to workspace " .. i }
	)
end

--  multimedia keys for volume
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(
		'wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+ && notify-send "$(wpctl get-volume @DEFAULT_AUDIO_SINK@)%" -h string:x-canonical-private-synchronous:test'
	),
	{ locked = true, repeating = true, description = "Raise volume" }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd(
		'wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%- && notify-send "$(wpctl get-volume @DEFAULT_AUDIO_SINK@)%" -h string:x-canonical-private-synchronous:test'
	),
	{ locked = true, repeating = true, description = "Lower volume" }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true, description = "Mute audio" }
)

-- requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, description = "Next track" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Pause audio" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Play audio" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, description = "Previous track" })

hl.bind("SUPER + escape", hl.dsp.submap("logout"))

hl.on("keybinds.submap", function(name)
	if name == "logout" then
		hl.notification.create({
			text = "c - reload\ne - exit\nr - reboot\ns - suspend\nS - poweroff\nl - lock",
			duration = 4500,
			color = "rgb(34E2E2)",
			font_size = 18,
		})
	end
end)

hl.define_submap("logout", function()
	hl.bind("C", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl reload"))
	end)
	hl.bind("E", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.exit())
	end)
	hl.bind("S", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.exec_cmd("systemctl suspend"))
	end)
	hl.bind("R", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.exec_cmd("systemctl reboot"))
	end)
	hl.bind("SHIFT + S", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.exec_cmd("systemctl poweroff -i"))
	end)
	hl.bind("L", function()
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.exec_cmd("~/.local/bin/lock"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)
	hl.bind("escape", function()
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)
	hl.bind("Return", function()
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)
end)

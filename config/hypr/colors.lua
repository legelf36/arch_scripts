local function add_alpha(hex_color, alpha)
	-- Remove '#' if present
	local clean_color = hex_color:gsub("#", "")
	-- Return new string with alpha appended
	return "#" .. clean_color .. alpha
end

local wal_colors_path = os.getenv("HOME") .. "/.cache/wal/colors-hyprland.lua"
local loader, err = loadfile(wal_colors_path)

if loader then
	loader()
	local opaque = "FF"
	local transparent = "CC" -- ~80%
	hl.config({
		general = {
			col = {
				inactive_border = add_alpha(background, opaque),
				active_border = {
					colors = { add_alpha(color1, transparent), add_alpha(color4, transparent) },
					angle = 45,
				},
			},
		},
		decoration = {
			shadow = {
				enabled = true,
				color = "rgba(000000ff)",
			},
		},
	})
else
	print("Failed to load Pywal colors: " .. err)
	hl.config({
		general = {
			col = {
				active_border = "rgba(33ccffee)",
				inactive_border = "rgba(595959aa)",
			},
		},
	})
end

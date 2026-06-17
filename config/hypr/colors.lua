local function add_alpha(hex_color, alpha)
	-- Remove '#' if present
	local clean_color = hex_color:gsub("#", "")

	-- Ensure alpha is a number between 0 and 1
	local alpha_val = tonumber(alpha)
	if not alpha_val then
		return hex_color
	end -- Fallback if alpha is invalid

	-- Convert float (0.0-1.0) to integer (0-255)
	local alpha_int = math.floor(alpha_val * 255 + 0.5)

	-- Clamp value between 0 and 255
	if alpha_int > 255 then
		alpha_int = 255
	end
	if alpha_int < 0 then
		alpha_int = 0
	end

	-- Format as two-digit hex and append
	return string.format("#%s%02x", clean_color, alpha_int)
end

local wal_colors_path = "/home/kim/.cache/wal/colors-hyprland.lua"
local loader, err = loadfile(wal_colors_path)

if not loader then
	print("Failed to load Pywal colors: " .. err)
	hl.config({
		general = {
			col = {
				active_border = "rgba(33ccffee)",
				inactive_border = "rgba(595959aa)",
			},
		},
	})
else
	loader()
	local opaque = 1.0
	local transparent = 0.8 -- ~80%
	hl.config({
		general = {
			col = {
				inactive_border = add_alpha(background, opaque),
				active_border = {
					colors = { add_alpha(color1, transparent), add_alpha(color14, transparent) },
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
end

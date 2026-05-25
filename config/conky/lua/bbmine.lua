require("cairo_xlib")
require("cairo")
require("imlib2")

local function rgb_to_r_g_b(colour, alpha) -- extract r g b values from hexidecimal color(0x000000).
	return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function conky_main() -- conky main (lua posthook).
	if conky_window == nil then
		return
	end -- check for conky window
	if tonumber(conky_parse("$updates")) < 20 then
		return
	end -- check for # of updates
	local cs = cairo_xlib_surface_create(
		conky_window.display,
		conky_window.drawable,
		conky_window.visual,
		conky_window.width,
		conky_window.height
	)
	local display = cairo_create(cs)

	cairo_destroy(display)
	cairo_surface_destroy(cs)
	display = nil
end

function conky_background() -- draw conky background(lua prehook).
	if conky_window == nil then
		return
	end
	if tonumber(conky_parse("$updates")) < 20 then
		return
	end -- check for # of updates
	local cs = cairo_xlib_surface_create(
		conky_window.display,
		conky_window.drawable,
		conky_window.visual,
		conky_window.width,
		conky_window.height
	)
	local display = cairo_create(cs)
	local corner_r = 20 -- Set the corner radius of the background.
	local bg_colour = 0x000000 -- Set the colour and transparency (alpha) of your background.
	local line_color = 0x000000
	local bg_alpha = 0.45
	local line_alpha = 0.5
	local w = conky_window.width
	local h = conky_window.height
	cairo_move_to(display, corner_r, 0)
	cairo_line_to(display, w - corner_r, 0)
	cairo_curve_to(display, w, 0, w, 0, w, corner_r)
	cairo_line_to(display, w, h - corner_r)
	cairo_curve_to(display, w, h, w, h, w - corner_r, h)
	cairo_line_to(display, corner_r, h)
	cairo_curve_to(display, 0, h, 0, h, 0, h - corner_r)
	cairo_line_to(display, 0, corner_r)
	cairo_curve_to(display, 0, 0, 0, 0, corner_r, 0)
	cairo_close_path(display)
	cairo_set_source_rgba(display, rgb_to_r_g_b(bg_colour, bg_alpha))
	cairo_fill_preserve(display)
	cairo_set_source_rgba(display, rgb_to_r_g_b(line_color, line_alpha))
	--cairo_stroke(display)
	cairo_destroy(display)
	cairo_surface_destroy(cs)
	display = nil
end

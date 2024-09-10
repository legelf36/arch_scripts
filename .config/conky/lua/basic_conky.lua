
require 'cairo'

local cores = {
{
    name='cpu',             arg='cpu1',
},
{
    name='cpu',             arg='cpu2',
},
}
-- Set the corner radius of the background.
local corner_r=40
-- Set the colour and transparency (alpha) of your background.
local bg_colour=0x000000
local bg_alpha=0.1
-- extract values from hexidecimal color(0x000000).
local function rgb_to_r_g_b(colour, alpha)
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end
-- convert angles to positions.
local function angle_to_position(start_angle, current_angle)
    local pos = current_angle + start_angle
    return ( ( pos * (2 * math.pi / 360) ) - (math.pi / 2) )
end
-- draw function.
local function draw_func1(display,data,value)

    local name, arg = data['name'], data['arg']

end

local function go_func(display)

    local function load_func(display, data)
        local str, value = '', 0
        str = string.format('${%s %s}',data['name'], data['arg'])
        str = conky_parse(str)
        value = tonumber(str)/100
        draw_func1(display, data, value)
    end

    for i in pairs(cores) do
        load_func(display, cores[i])
    end

end
-- conky main.
function conky_main()

    if conky_window == nil then return end -- check for conky window
    if tonumber(conky_parse("$updates"))<5 then return end -- check for # of updates

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local display = cairo_create(cs)

    go_func(display)

    cairo_surface_destroy(cs)
    cairo_destroy(display)
end
-- draw conky background(lua prehook).
function conky_background()

    if conky_window == nil then return  end

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local display = cairo_create(cs)

	  local w=conky_window.width
	  local h=conky_window.height

	  cairo_move_to(display,corner_r,0)
	  cairo_line_to(display,w-corner_r,0)
	  cairo_curve_to(display,w,0,w,0,w,corner_r)
	  cairo_line_to(display,w,h-corner_r)
	  cairo_curve_to(display,w,h,w,h,w-corner_r,h)
	  cairo_line_to(display,corner_r,h)
	  cairo_curve_to(display,0,h,0,h,0,h-corner_r)
	  cairo_line_to(display,0,corner_r)
	  cairo_curve_to(display,0,0,0,0,corner_r,0)
	  cairo_close_path(display)

	  cairo_set_source_rgba(display,rgb_to_r_g_b(bg_colour,bg_alpha))
	  cairo_fill(display)

    cairo_surface_destroy(cs)
    cairo_destroy(display)
end

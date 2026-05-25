
require 'cairo'
require 'imlib2'

local cores = {
{
    name='cpu',             arg='cpu1',
},
{
    name='cpu',             arg='cpu2',
},
}
-- extract values from hexidecimal color(0x000000).
local function rgb_to_r_g_b(colour, alpha)

    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha

end
-- convert angles to positions.
local function angle_to_position(start_angle, current_angle)

    return math.rad(start_angle + current_angle)

end
-- draw function.
local function draw_func1(display,data,value)

    local name, arg = data.name, data.arg

end
-- initilization.
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

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height) --create surface
    local display = cairo_create(cs)                                    --create context for surface

    go_func(display)                                                    --initialization

    cairo_surface_destroy(cs)                                           --destroy surface
    cairo_destroy(display)                                              --destroy context

end
-- draw conky background(lua prehook).
function conky_background()

    local corner_r=40           -- Set the corner radius of the background.
    local bg_colour=0x000000    -- Set the colour and transparency (alpha) of your background.
    local bg_alpha=0.1

    if conky_window == nil then return  end

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height) --create surface
    local display = cairo_create(cs)                                   --create a context for surface

    local w=conky_window.width                                         --width
    local h=conky_window.height                                        --height

    cairo_move_to(display,corner_r,0)                                  --start path at top left
	cairo_line_to(display,w-corner_r,0)                                --line across top
	cairo_curve_to(display,w,0,w,0,w,corner_r)                         --curve down 90 degrees
	cairo_line_to(display,w,h-corner_r)                                --line down right side
	cairo_curve_to(display,w,h,w,h,w-corner_r,h)                       --curve left 90 degrees
	cairo_line_to(display,corner_r,h)                                  --line across bottom
	cairo_curve_to(display,0,h,0,h,0,h-corner_r)                       --curve up 90 degrees
	cairo_line_to(display,0,corner_r)                                  --line up the left side
	cairo_curve_to(display,0,0,0,0,corner_r,0)                         --curve right 90 degrees
	cairo_close_path(display)                                          --close the path created for the fill

	cairo_set_source_rgba(display,rgb_to_r_g_b(bg_colour,bg_alpha))    --set the colour
	cairo_fill(display)                                                --fill the path

    cairo_surface_destroy(cs)                                          --destroy the surface
    cairo_destroy(display)                                             --destroy the context
    display=nil                                                        --free context variable

end

require 'cairo'

box_data={
    --[[Main Box]]
{
    label=' Time : ',
    text=conky_parse('${time %l:%M}'),
    text2=conky_parse('  ${time %p}'),
    x=1,
    y=10,
    box_width=70,
    box_hieght=130,
    line_thickness=2,
    line_color=0xFFFFFF,
    corner_radius=5,
    },
{
    label=' Date : ',
    text=conky_parse('${time %d}'),
    x=221,
    y=10,
    box_width=70,
    box_hieght=150,
    line_thickness=2,
    line_color=0xFF00FF,
    corner_radius=5,
    }
}

function rgb_to_r_g_b(colour, alpha)
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

-------------------------------------------------------------------------------
--                                                            angle_to_position
-- convert degree to rad and rotate (0 degree is top/north)
--
function angle_to_position(start_angle, current_angle)
    local pos = current_angle + start_angle
    return ( ( pos * (2 * math.pi / 360) ) - (math.pi / 2) )
end


-------------------------------------------------------------------------------
--                                                              draw_gauge_ring
-- displays gauges
--
function draw_boxes(display, data)

    local linet = data.line_thickness
    local lx = data.x
    local ly = data.y
    local linec = data.line_color
    local liner = data.corner_radius
    local text = data.text
    local text2 = data.text2
    local label = data.label

    cairo_set_source_rgba(display, rgb_to_r_g_b(linec,1))
    cairo_set_line_width(display, linet)
    cairo_arc(display, lx+liner, ly+liner, liner, angle_to_position(270, 0), angle_to_position(0, 0))
    cairo_line_to(display,lx+10, ly)
    cairo_set_font_size(display,12)
    cairo_show_text (display, label)
    cairo_arc(display, lx+liner+200, ly+liner, liner, angle_to_position(0, 0), angle_to_position(90, 0))
    cairo_arc(display, lx+liner+200, ly+liner+40, liner, angle_to_position(90, 0), angle_to_position(180, 0)) 
    cairo_arc(display, lx+liner, ly+liner+40, liner, angle_to_position(180, 0), angle_to_position(270, 0))
    cairo_line_to(display,lx, ly+liner)
    cairo_move_to(display,lx+65,ly+35)
    cairo_set_font_size(display,24)
    cairo_show_text (display, text)
    cairo_set_font_size(display,8)
    cairo_show_text (display, text2)
    cairo_stroke(display)

end
    

function go_boxes(display)

    local function load_boxes(display, data)
        draw_boxes(display, data)
    end
    
    for i,v in pairs(box_data) do
        load_boxes(display, v)
    end

end

function conky_main()

    if conky_window == nil then return end
    if tonumber(conky_parse("$updates"))<3 then return end

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local display = cairo_create(cs)
    
    go_boxes(display)

    cairo_surface_destroy(cs)
    cairo_destroy(display)

end
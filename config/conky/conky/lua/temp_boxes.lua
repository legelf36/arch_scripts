require 'cairo'

text_data={

{   --Time
    label=' Time : ',
    style='Time',
    font='Ubuntu',
    font_slant='CAIRO_FONT_SLANT_NORMAL',
    font_weight='CAIRO_FONT_WEIGHT_NORMAL',
    font_size1=12,
    font_size2=48,
    text_str1='${time %l:%M}',
    text_str2=' ${time %p}',
    x=0,
    y=60,
    box_width=100,
    box_hieght=10,
    line_thickness=1,
    text_colour=0xbbbbbb,
    text_colour_alpha=0.55,
    corner_radius=5,
    },
{   --Date
    label=' Date : ',
    style='Date',
    font='Ubuntu',
    font_slant='CAIRO_FONT_SLANT_NORMAL',
    font_weight='CAIRO_FONT_WEIGHT_NORMAL',
    font_size1=16,
    font_size2=24,
    text_str1='${time %B}',
    text_str2='  ${time %d}',
    x=150,
    y=62,
    box_width=150,
    box_hieght=10,
    line_thickness=1,
    text_colour=0xFFff00,
    text_colour_alpha=0.65,
    corner_radius=5,
    },
{   --Filesystem
    label=' FS : ',
    style='FS',
    font='Ubuntu',
    font_slant='CAIRO_FONT_SLANT_NORMAL',
    font_weight='CAIRO_FONT_WEIGHT_NORMAL',
    font_size1=12,
    font_size2=14,
    text_str1='SSD  / : ${fs_free /}',
    text_str2='  /${fs_size /}',
    x=120,
    y=110,
    box_width=150,
    box_hieght=10,
    line_thickness=1,
    text_colour=0xFFbb66,
    text_colour_alpha=0.65,
    corner_radius=5,
    },
{   --Mem
    label=' Mem : ',
    style='Mem',
    font='Ubuntu',
    font_slant='CAIRO_FONT_SLANT_NORMAL',
    font_weight='CAIRO_FONT_WEIGHT_NORMAL',
    font_size1=12,
    font_size2=14,
    text_str1='MEM : $mem',
    text_str2='  /$memmax}',
    x=120,
    y=90,
    box_width=150,
    box_hieght=10,
    line_thickness=1,
    text_colour=0xFFbb66,
    text_colour_alpha=0.65,
    corner_radius=5,
    },
{   --CPU
    label=' CPU : ',
    style='CPU',
    font='Ubuntu',
    font_slant='CAIRO_FONT_SLANT_NORMAL',
    font_weight='CAIRO_FONT_WEIGHT_NORMAL',
    font_size1=18,
    font_size2=18,
    text_str1='CPU : ${cpu cpu0}%',
    text_str2='TEMP :${hwmon1 temp1}°',
    x=10,
    y=90,
    box_width=150,
    box_hieght=10,
    line_thickness=1,
    text_colour=0xFFbb00,
    text_colour_alpha=0.65,
    corner_radius=5,
}
}

function rgb_to_r_g_b(colour, alpha)
    -- input hexadecimal color code, returns its corresponding RGB+Alpha representation
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha -- convert RGB to R,G,B

end

function angle_to_position(start_angle, current_angle)
    -- convert degree to rad and rotate (0 degree is top/north)
    local pos = current_angle + start_angle
    return ( ( pos * (2 * math.pi / 360) ) - (math.pi / 2) ) 

end

function draw_text(display, data)

    local lx,ly = data.x,data.y
    local lt,lc,lca = data.line_thickness,data.text_colour,data.text_colour_alpha
    local tf,tfs,tfw = data.font,data.font_slant,data.font_weight
    local tfs1,tfs2 = data.font_size1,data.font_size2
    local t1,t2 = data.text_str1,data.text_str2
    local sty = data.style
    local tempn = conky_parse('${acpitemp}')
    

    if sty == 'Time' or sty =='FS' or sty =='Mem' then
        cairo_set_source_rgba(display, rgb_to_r_g_b(lc,lca))
        cairo_select_font_face(display,tf,tfs, tfw)
        cairo_set_font_size(display,tfs2)
        cairo_move_to(display,lx,ly)
        cairo_show_text (display, conky_parse(t1))
        cairo_set_font_size(display,tfs1)cairo_set_source_rgba(display, rgb_to_r_g_b(lc,lca))
        cairo_show_text (display, conky_parse(t2))
    end

    if sty == 'Date' then
        cairo_set_source_rgba(display,rgb_to_r_g_b(lc, lca))
        cairo_select_font_face(display,tf,tfs, tfw)
        cairo_set_font_size(display,tfs2)
        cairo_move_to(display,lx,ly-20)
        cairo_show_text (display, conky_parse(t1))
        cairo_set_font_size(display,tfs1)cairo_set_source_rgba(display, rgb_to_r_g_b(lc,lca))
        if conky_parse(t2) == 1 or conky_parse(t2) == 11 or conky_parse(t2) == 21 or conky_parse(t2) == 31 then
            cairo_move_to(display,lx-7,ly)
            cairo_show_text (display, conky_parse(t2))
            cairo_set_font_size(display,10)
            cairo_show_text (display, 'st')
            cairo_move_to(display,lx+40,ly)
            cairo_set_font_size(display,16)
            cairo_set_source_rgba(display,rgb_to_r_g_b(0x00ffff, 0.75))
            cairo_show_text (display, conky_parse('${time %A}'))
        elseif conky_parse(t2) == 2 or conky_parse(t2) == 12 or conky_parse(t2) == 22 then
            cairo_move_to(display,lx-7,ly)
            cairo_show_text (display, conky_parse(t2))
            cairo_set_font_size(display,10)
            cairo_show_text (display, 'nd')
            cairo_move_to(display,lx+40,ly)
            cairo_set_font_size(display,16)
            cairo_set_source_rgba(display,rgb_to_r_g_b(0x00ffff, 0.75))
            cairo_show_text (display, conky_parse('${time %A}'))
        elseif conky_parse(t2) == 3 or conky_parse(t2) == 13 or conky_parse(t2) == 23 then
            cairo_move_to(display,lx-7,ly)
            cairo_show_text (display, conky_parse(t2))
            cairo_set_font_size(display,10)
            cairo_show_text (display, 'rd')
            cairo_move_to(display,lx+40,ly)
            cairo_set_font_size(display,16)
            cairo_set_source_rgba(display,rgb_to_r_g_b(0x00ffff, 0.75))
            cairo_show_text (display, conky_parse('${time %A}'))
        else
            cairo_move_to(display,lx-7,ly)
            cairo_show_text (display, conky_parse(t2))
            cairo_set_font_size(display,10)
            cairo_show_text (display, ' th')
            cairo_move_to(display,lx+40,ly)
            cairo_set_font_size(display,16)
            cairo_set_source_rgba(display,rgb_to_r_g_b(0x00ffff, 0.75))
            cairo_show_text (display, conky_parse('${time %A}'))
        end
    end

    if sty == 'CPU' then
        local tc = 0xffffff
        if tonumber(tempn) >= 20 and tonumber(tempn) <= 58 then tc = 0x00ff00 end
        if tonumber(tempn) >= 59 and tonumber(tempn) <= 67 then tc = 0xffff00 end
        if tonumber(tempn) >= 68 and tonumber(tempn) <= 99 then tc = 0xff0000 end
        cairo_set_source_rgba(display,rgb_to_r_g_b(tc, lca))
        cairo_select_font_face(display,tf,tfs, tfw)
        cairo_set_font_size(display,tfs2)
        cairo_move_to(display,lx,ly)
        cairo_show_text (display, conky_parse(t1))
        cairo_move_to(display,lx,ly+20)
        cairo_show_text (display, conky_parse(t2))
    end

    cairo_save(display)
    cairo_stroke(display)
    cairo_restore(display)

end

function show_text(display)

    local function load_text(display, data)
        draw_text(display, data)
    end
    
    for i,v in pairs(text_data) do
        load_text(display, v)
    end

end

function show_graphics(display)

    local function load_graphics(display,data)
        draw_graphics(display,data)
    end

end

function conky_main()

    if conky_window == nil then return end
    if tonumber(conky_parse("$updates"))<3 then return end

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local display = cairo_create(cs)

    show_text(display)
    --show_graphics(display)

    cairo_destroy(display)
    cairo_surface_destroy(cs)
    
end

function explode(s)
    -- thanks to dasblinkenlight (stackoverflow)
    -- function explode splits the string at spaces and put them into a table
    -- @ s : string to explode
    -- # words : a table of words
    -- # count : the mumber of words
    local words = {};
    local count = 0;
  
    -- split the string
    for value in string.gmatch(s,"[%S]+") do
      count = count + 1;
      -- print(value);
      words[count] = value;
    end
  
    return count, words;
end
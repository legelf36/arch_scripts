--                                 conky_redux.lua
require 'cairo'
require 'imlib2'
local cpus = {-- gauge DATA.
{-- cpu1
    name='cpu',                     arg='cpu1',         max_value=100,
    x=22,           y=240,          x2=20,              y2=120,
    offsetx=5,      offsety=4,      w=20,               h=40,           c_r=2,
    graph_radius=12,                graph_thickness=4,
    graph_start_angle=180,          graph_unit_angle=2.7,               graph_unit_thickness=2.7,
    graph_bg_colour=0x0077AA,       graph_bg_alpha=0.3,
    graph_fg_colour=0xBBBB88,       graph_fg_alpha=0.5,
    hand_fg_colour=0xEF5A29,        hand_fg_alpha=1,
    shadow_colour=0x111111,         shadow_alpha=0,
    txt_radius=8,                   txt_weight=0,                       txt_size=8.0,
    txt_fg_colour=0xFFFFFF,         txt_fg_alpha=1,                     graduation_radius=12,
    graduation_thickness=5,         graduation_mark_thickness=1,        graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF,  graduation_fg_alpha=0.8,
    caption='',                     caption_weight=1,                   caption_size=8.0,
    caption_fg_colour=0xFFFFFF,     caption_fg_alpha=0.3,
},
{-- cpu2
    name='cpu',                     arg='cpu2',         max_value=100,
    x=22,           y=295,          x2=50,              y2=120,
    offsetx=5,      offsety=4,      w=20,               h=40,           c_r=2,
    graph_radius=12,                graph_thickness=4,
    graph_start_angle=180,          graph_unit_angle=2.7,               graph_unit_thickness=2.7,
    graph_bg_colour=0x0077AA,       graph_bg_alpha=0.3,
    graph_fg_colour=0xBBBB88,       graph_fg_alpha=0.5,
    hand_fg_colour=0xEF5A29,        hand_fg_alpha=1,
    shadow_colour=0x111111,         shadow_alpha=0,
    txt_radius=8,                   txt_weight=0,                   txt_size=8.0,
    txt_fg_colour=0xAAAAAA,         txt_fg_alpha=1,                 graduation_radius=12,
    graduation_thickness=5,         graduation_mark_thickness=1,    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF,  graduation_fg_alpha=0.8,
    caption='',                     caption_weight=1,               caption_size=8.0,
    caption_fg_colour=0xFFFFFF,     caption_fg_alpha=0.3,
},
{-- cpu3
    name='cpu',                     arg='cpu3',          max_value=100,
    x=22,           y=345,          x2=80,               y2=120,
    offsetx=5,      offsety=4,      w=20,                h=40,      c_r=2,
    graph_radius=12,                graph_thickness=4,
    graph_start_angle=180,          graph_unit_angle=2.7,           graph_unit_thickness=2.7,
    graph_bg_colour=0x0077AA,       graph_bg_alpha=0.3,
    graph_fg_colour=0xBBBB88,       graph_fg_alpha=0.5,
    hand_fg_colour=0xEF5A29,        hand_fg_alpha=1,
    shadow_colour=0x111111,         shadow_alpha=0,
    txt_radius=8,                   txt_weight=0,                   txt_size=8.0,
    txt_fg_colour=0xAAAAAA,         txt_fg_alpha=1,                 graduation_radius=12,
    graduation_thickness=5,         graduation_mark_thickness=1,    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF,  graduation_fg_alpha=0.8,
    caption='',                     caption_weight=1,               caption_size=8.0,
    caption_fg_colour=0xFFFFFF,     caption_fg_alpha=0.3,
},
{-- cpu4
    name='cpu',                    arg='cpu4',           max_value=100,
    x=22,          y=395,          x2=110,               y2=120,
    offsetx=5,     offsety=4,      w=20,                 h=40,      c_r=2,
    graph_radius=12,               graph_thickness=4,
    graph_start_angle=180,         graph_unit_angle=2.7,            graph_unit_thickness=2.7,
    graph_bg_colour=0x0099AA,      graph_bg_alpha=0.3,
    graph_fg_colour=0xBBBB88,      graph_fg_alpha=0.5,
    hand_fg_colour=0xEF5A29,       hand_fg_alpha=1,
    shadow_colour=0x111111,        shadow_alpha=0,
    txt_radius=8,                  txt_weight=0,                  txt_size=8.0,
    txt_fg_colour=0xAAAAAA,        txt_fg_alpha=1,                graduation_radius=12,
    graduation_thickness=5,        graduation_mark_thickness=1,   graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.8,
    caption='',                    caption_weight=1,              caption_size=8.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.3,
},
{-- cpu5
    name='cpu',                    arg='cpu5',                  max_value=100,
    x=380,         y=245,          x2=145,               y2=120,
    offsetx=5,     offsety=4,      w=20,                 h=40,      c_r=2,
    graph_radius=12,               graph_thickness=4,
    graph_start_angle=180,         graph_unit_angle=2.7,          graph_unit_thickness=2.7,
    graph_bg_colour=0x99AA00,      graph_bg_alpha=0.3,
    graph_fg_colour=0x999966,      graph_fg_alpha=1,
    hand_fg_colour=0xEF5A29,       hand_fg_alpha=1,
    shadow_colour=0x111111,        shadow_alpha=0,
    txt_radius=8,                  txt_weight=0,                  txt_size=8.0,
    txt_fg_colour=0xAAAAAA,        txt_fg_alpha=1,                graduation_radius=12,
    graduation_thickness=5,        graduation_mark_thickness=1,   graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.8,
    caption='',                    caption_weight=1,              caption_size=8.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.3,
},
{-- cpu6
    name='cpu',                    arg='cpu6',                  max_value=100,
    x=380,         y=295,          x2=175,               y2=120,
    offsetx=5,     offsety=4,      w=20,                 h=40,      c_r=2,
    graph_radius=12,               graph_thickness=4,
    graph_start_angle=180,         graph_unit_angle=2.7,          graph_unit_thickness=2.7,
    graph_bg_colour=0x99AA00,      graph_bg_alpha=0.3,
    graph_fg_colour=0x999966,      graph_fg_alpha=1,
    hand_fg_colour=0xEF5A29,       hand_fg_alpha=1,
    shadow_colour=0x111111,        shadow_alpha=0,
    txt_radius=8,                  txt_weight=0,                  txt_size=8.0,
    txt_fg_colour=0xAAAAAA,        txt_fg_alpha=1,                graduation_radius=12,
    graduation_thickness=5,        graduation_mark_thickness=1,   graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.8,
    caption='',                    caption_weight=1,              caption_size=8.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.3,
},
{-- cpu7
    name='cpu',                    arg='cpu7',                  max_value=100,
    x=380,         y=345,          x2=205,               y2=120,
    offsetx=5,     offsety=4,      w=20,                 h=40,      c_r=2,
    graph_radius=12,               graph_thickness=4,
    graph_start_angle=180,         graph_unit_angle=2.7,          graph_unit_thickness=2.7,
    graph_bg_colour=0x99AA00,      graph_bg_alpha=0.3,
    graph_fg_colour=0x999966,      graph_fg_alpha=1,
    hand_fg_colour=0xEF5A29,       hand_fg_alpha=1,
    shadow_colour=0x111111,        shadow_alpha=0,
    txt_radius=8,                  txt_weight=0,                  txt_size=8.0,
    txt_fg_colour=0xAAAAAA,        txt_fg_alpha=1,                graduation_radius=12,
    graduation_thickness=5,        graduation_mark_thickness=1,   graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.8,
    caption='',                    caption_weight=1,              caption_size=8.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.3,
},
{-- cpu8
    name='cpu',                    arg='cpu8',                  max_value=100,
    x=380,         y=395,          x2=235,               y2=120,
    offsetx=5,     offsety=4,      w=20,                 h=40,      c_r=2.25,
    graph_radius=12,               graph_thickness=4,
    graph_start_angle=180,         graph_unit_angle=2.7,          graph_unit_thickness=2.7,
    graph_bg_colour=0x99AA00,      graph_bg_alpha=0.3,
    graph_fg_colour=0x999966,      graph_fg_alpha=1,
    hand_fg_colour=0xEF5A29,       hand_fg_alpha=1,
    shadow_colour=0x111111,        shadow_alpha=0,
    txt_radius=8,                  txt_weight=0,                  txt_size=8.0,
    txt_fg_colour=0xAAAAAA,        txt_fg_alpha=1,                graduation_radius=12,
    graduation_thickness=5,        graduation_mark_thickness=1,   graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.8,
    caption='',                    caption_weight=1,              caption_size=8.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.3,
},
}
local txt_data = {-- txt DATA.
{ --current temp
    name='temp_cur',
    command="jq '.main.temp' ~/.cache/weather.json | awk '{print int($1+0.5)}'",
    x=205,                           y=47,
    font='Source Sans Pro Regular', font_size=22,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='°',
},
{ --humidity
    name='humidity',
    command="jq '.main.humidity' ~/.cache/weather.json | awk '{print int($1+0.5)}'",
    x=250,                           y=65,
    font='Source Sans Pro Regular', font_size=10,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xCCCCCC,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='% Humidity',
},
{ --pressure
    name='pressure',
    command="jq '.main.pressure' ~/.cache/weather.json | awk '{print int($1+0.5)/10}'",
    x=318,                           y=65,
    font='Source Sans Pro Regular', font_size=10,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xCCCCCC,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix=' ',                      suffix=' kpa',
},
{ --feels like
    name='temp_feel',
    command="jq '.main.feels_like' ~/.cache/weather.json | awk '{print int($1+0.5)}'",
    x=170,                           y=65,
    font='Source Sans Pro Regular', font_size=12,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xCCCCCC,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='feels like ',                      suffix='°',
},
{ --weather description
    name='desc_image',
    command="jq -r '.weather[0].description' ~/.cache/weather.json ",
    x=210,                           y=22,
    font='Source Sans Pro Regular', font_size=12,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='',
},
{ --windspeed
    name='wind_speed',
    command="jq '.wind.speed' ~/.cache/weather.json | awk '{print int($1+0.5)}' ",
    x=340,                           y=40,
    font='Source Sans Pro Regular', font_size=12,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xCCCCCC,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix=' ',                      suffix=' kt',
},
{ --wind direction
    name='wind_dir',
    command="jq '.wind.deg' ~/.cache/weather.json | awk '{print int($1+0.5)}' ",
    x=250,                           y=40,
    font='Source Sans Pro Regular', font_size=12,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xCCCCCC,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='Wind:        ',                      suffix='  @ ',
},
{ --wind direction 2
    name='wind_dir_2',
    command="jq '.wind.deg' ~/.cache/weather.json | awk '{print int($1+0.5)}' ",
    x=250,                           y=52,
    font='Source Sans Pro Regular', font_size=11,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0x77AA77,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='Wind: ',                      suffix='° ( 0° = S )',
},
{ --day of the week
    name='day_of_the_week',
    command="date +%A",
    x=20,                           y=24,
    font='Source Sans Pro Regular', font_size=16,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='',
},
{ --day of the month
    name='day_of_the_month',
    command="date +%-d",
    x=20,                           y=48,
    font='Source Sans Pro Regular', font_size=26,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='',
},
{ --month
    name='month',
    command="date +%b",
    x=55,                           y=44,
    font='Source Sans Pro Regular', font_size=18,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='',
},
{ --hour
    name='hour',
    command="date +%l",
    x=103,                           y=48,
    font='Source Sans Pro Regular', font_size=28,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='',
},
{ --minute
    name='miniute',
    command="date +%M",
    x=130,                           y=38,
    font='Source Sans Pro Regular', font_size=14,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix=':',                      suffix='',
},
{ --seconds
    name='seconds',
    command="date +%S",
    x=152,                           y=37,
    font='Source Sans Pro Regular', font_size=8,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix=':',                      suffix='',
},
{ --ampm
    name='ampm',
    command="date +%p",
    x=134,                           y=49,
    font='Source Sans Pro Regular', font_size=8,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='',
},
{ --sysinfo
    name='sysinfo',
    command="lsb_release -d | grep 'Descr'|awk {'print $2'}",
    x=80,                           y=85,
    font='Source Sans Pro Regular', font_size=16,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='',
},
{ --kernel
    name='kernel',
    command="uname -r",
    x=80,                           y=105,
    font='Source Sans Pro Regular', font_size=10,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='',
},
{ --cpu temp
    name='ctemp',
    command="sensors | grep 'Package id 0' | awk {'print $4'}",
    x=270,                           y=135,
    font='Source Sans Pro Regular', font_size=10,           font_style='CAIRO_FONT_WEIGHT_BOLD',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='CPU temp:',                      suffix='',
},
{ --gpu temp
    name='gtemp',
    command="nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader",
    x=270,                           y=155,
    font='Source Sans Pro Regular', font_size=10,           font_style='CAIRO_FONT_WEIGHT_BOLD',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='GPU temp:+',                      suffix='.0°C',
},
{ --sunrise
    name='sunrise',
    command="date --date=@$(jq '.sys.sunrise' /home/kim/.cache/weather.json | awk '{print int($1+0.5)}') | awk '{print $5}'",
    x=170,                          y=88,
    font='Source Sans Pro Regular', font_size=11,           font_style='CAIRO_FONT_WEIGHT_BOLD',
    font_colour=0xAAAA77,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='Sunrise: ',             suffix=' AM',
},
{ --sunset
    name='sunset',
    command="date --date=@$(jq '.sys.sunset' /home/kim/.cache/weather.json | awk '{print int($1+0.5)}') | awk '{print $5}'",
    x=170,                          y=104,
    font='Source Sans Pro Regular', font_size=11,           font_style='CAIRO_FONT_WEIGHT_BOLD',
    font_colour=0xCC9977,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='Sunset: ',             suffix=' PM',
},
}
local img_data = {--image DATA.
{-- Arcolinux logo
    name="arcologo",
    x=20,   y=62,   w=55,   h=55,   rotation=0,
    file="/home/kim/.config/conky/images/arcolinux-fractal.png",
},
{-- weather icon
    name="weather",
    x=170,   y=20,   w=32,   h=32,   rotation=0,
    file="/home/kim/.cache/current.png",
},
{-- wind arrow
    name="wind_direc",
    x=285,   y=25,   w=13,   h=13,   rotation=0,
    file="/home/kim/Pictures/arrow_transparent.png",
},
{-- moon phase
    name="moon_phase",
    x=310,   y=75,   w=32,   h=32,   rotation=0,
    file="/home/kim/Pictures/Moon_third_qtr.png",
},
}
local function con_dir(val)-- convert direction
    local val1 = tonumber(val)
    if val1 >= 338 and val1 <= 360 then return "N"
    elseif val1 >= 0 and val1 <= 22 then return "N"
    elseif val1 >= 23 and val1 <= 67 then return "NE"
    elseif val1 >= 68 and val1 <= 112 then return "E"
    elseif val1 >= 113 and val1 <= 157 then return "SE"
    elseif val1 >= 158 and val1 <= 202 then return "S"
    elseif val1 >= 203 and val1 <= 247 then return "SW"
    elseif val1 >= 248 and val1 <= 292 then return "W"
    elseif val1 >= 293 and val1 <= 337 then return "NW"
    end
end
local function conky_ownpreexec_noend(command)-- returns value from command with no end
    local fp = assert(io.popen(command, 'r'))
    local rv = assert(fp:read('*l'))
    return rv
end
local function ret_weather()-- retrieve weather info from openweathermap.com
    local c1 = "l=$t4; l=${l%%_*}; curl -s 'api.openweathermap.org/data/2.5/weather?APPID=0f69f19dda763e192a320133a19ebba7&id=6119109&cnt=5&units=metric&lang=' -o ~/.cache/weather.json"
    local fp = assert(io.popen(c1, r))
end
local function cp_weather()-- copy weather icon to "current.png"
    local c2 = "cp -f ~/.config/conky/images/weather-icons/64px-blue/$(jq .weather[0].id ~/.cache/weather.json).png ~/.cache/current.png"
    local fp2 = assert(io.popen(c2, r))
end
local function rgb_to_r_g_b(colour, alpha)-- extract r g b values from hexidecimal color(0x000000).
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end
local function draw_proc(display,data,value,str,str2)-- draw processor
    local x, y = data.x2, data.y2
    local w, h, c_r = data.w, data.h, data.c_r
    local ox, oy = data.offsetx, data.offsety
    cairo_move_to(display,x+c_r+ox,y+oy)                                        --shadow starting point
    cairo_line_to(display,x+w-c_r+ox,y+oy)                                      --top shadow line
    cairo_curve_to(display,x+w-c_r+ox,y+oy,x+w+ox,y+oy,x+w+ox,y+c_r+oy)         --top shadow right curve
    cairo_line_to(display,x+w+ox,y+h-c_r+oy)                                    --right shadow line
    cairo_curve_to(display,x+w+ox,y+h-c_r+oy,x+w+ox,y+h+oy,x+w-c_r+ox,y+h+oy)   --bottom shadow right curve
    cairo_line_to(display,x+c_r+ox,y+h+oy)                                      --bottom shadow line
    cairo_curve_to(display,x+c_r+ox,y+h+oy,x+ox,y+h+oy,x+ox,y+h-c_r+oy)         --bottom shadow left curve
    cairo_line_to(display,x+ox,y+c_r+oy)                                        --left shadow line
    cairo_curve_to(display,x+ox,y+c_r+oy,x+ox,y+oy,x+c_r+ox,y+oy)               --top shadow left curve
    cairo_close_path(display)                                                   --close shadow path to fill
    cairo_set_source_rgba(display,rgb_to_r_g_b(data.shadow_colour,0.25))
    cairo_fill(display)
    cairo_move_to(display,x+c_r,y)                                              --starting point
    cairo_line_to(display,x+w-c_r,y)                                            --top line
    cairo_curve_to(display,x+w-c_r,y,x+w,y,x+w,y+c_r)                           --top right curve
    cairo_line_to(display,x+w,y+h-c_r)                                          --right line
    cairo_curve_to(display,x+w,y+h-c_r,x+w,y+h,x+w-c_r,y+h)                     --bottom right curve
    cairo_line_to(display,x+c_r,y+h)                                            --bottom line
    cairo_curve_to(display,x+c_r,y+h,x,y+h,x,y+h-c_r)                           --bottom left curve
    cairo_line_to(display,x,y+c_r)                                              --left line
    cairo_curve_to(display,x,y+c_r,x,y,x+c_r,y)                                 --top left curve
    cairo_close_path(display)                                                   --close path to fill
    cairo_set_source_rgba(display,rgb_to_r_g_b(data.hand_fg_colour,value))     --line colour
    cairo_set_line_width(display, data.graduation_mark_thickness)               --line width
    cairo_stroke_preserve(display)                                              --draw line and save path
    cairo_set_source_rgba(display,rgb_to_r_g_b(data.graph_bg_colour,value))     --fill colour
    cairo_fill(display)                                                         --draw fill
    cairo_move_to(display,x+(w/2),y+h)
    if data.arg == "cpu1" then
        cairo_line_to(display,x+(w/2),y+h+20)
        cairo_curve_to(display,x+(w/2),y+h+20,x+(w/2),y+h+20+5,x+(w/2)+5,y+h+20+5)
        cairo_line_to(display,x+(w/2)+85,y+h+25)
        cairo_curve_to(display,x+(w/2)+85,y+h+25,x+(w/2)+90,y+h+5+20,x+(w/2)+90,y+h+5+25)
        cairo_line_to(display,x+(w/2)+90,y+h+40)
    elseif data.arg == "cpu2" then
        cairo_line_to(display,x+(w/2),y+h+15)
        cairo_curve_to(display,x+(w/2),y+h+15,x+(w/2),y+h+15+5,x+(w/2)+5,y+h+15+5)
        cairo_line_to(display,x+(w/2)+60,y+h+20)
        cairo_curve_to(display,x+(w/2)+60,y+h+20,x+(w/2)+65,y+h+5+15,x+(w/2)+65,y+h+5+20)
        cairo_line_to(display,x+(w/2)+65,y+h+40)
    elseif data.arg == "cpu3" then
        cairo_line_to(display,x+(w/2),y+h+10)
        cairo_curve_to(display,x+(w/2),y+h+10,x+(w/2),y+h+10+5,x+(w/2)+5,y+h+10+5)
        cairo_line_to(display,x+(w/2)+35,y+h+15)
        cairo_curve_to(display,x+(w/2)+35,y+h+15,x+(w/2)+40,y+h+5+10,x+(w/2)+40,y+h+5+15)
        cairo_line_to(display,x+(w/2)+40,y+h+40)
    elseif data.arg == "cpu4" then
        cairo_line_to(display,x+(w/2),y+h+5)
        cairo_curve_to(display,x+(w/2),y+h+5,x+(w/2),y+h+5+5,x+(w/2)+5,y+h+5+5)
        cairo_line_to(display,x+(w/2)+10,y+h+10)
        cairo_curve_to(display,x+(w/2)+10,y+h+10,x+(w/2)+15,y+h+5+5,x+(w/2)+15,y+h+5+10)
        cairo_line_to(display,x+(w/2)+15,y+h+40)
    elseif data.arg == "cpu5" then
        cairo_line_to(display,x+(w/2),y+h+5)
        cairo_curve_to(display,x+(w/2),y+h+5,x+(w/2),y+h+5+5,x+(w/2)-5,y+h+5+5)
        cairo_line_to(display,x+(w/2)-10,y+h+10)
        cairo_curve_to(display,x+(w/2)-10,y+h+10,x+(w/2)-15,y+h+5+5,x+(w/2)-15,y+h+5+10)
        cairo_line_to(display,x+(w/2)-15,y+h+40)
    elseif data.arg == "cpu6" then
        cairo_line_to(display,x+(w/2),y+h+10)
        cairo_curve_to(display,x+(w/2),y+h+10,x+(w/2),y+h+10+5,x+(w/2)-5,y+h+10+5)
        cairo_line_to(display,x+(w/2)-35,y+h+15)
        cairo_curve_to(display,x+(w/2)-35,y+h+15,x+(w/2)-40,y+h+5+10,x+(w/2)-40,y+h+5+15)
        cairo_line_to(display,x+(w/2)-40,y+h+40)
    elseif data.arg == "cpu7" then
        cairo_line_to(display,x+(w/2),y+h+15)
        cairo_curve_to(display,x+(w/2),y+h+15,x+(w/2),y+h+15+5,x+(w/2)-5,y+h+15+5)
        cairo_line_to(display,x+(w/2)-60,y+h+20)
        cairo_curve_to(display,x+(w/2)-60,y+h+20,x+(w/2)-65,y+h+5+15,x+(w/2)-65,y+h+5+20)
        cairo_line_to(display,x+(w/2)-65,y+h+40)
    elseif data.arg == "cpu8" then
        cairo_line_to(display,x+(w/2),y+h+20)
        cairo_curve_to(display,x+(w/2),y+h+20,x+(w/2),y+h+20+5,x+(w/2)-5,y+h+20+5)
        cairo_line_to(display,x+(w/2)-85,y+h+25)
        cairo_curve_to(display,x+(w/2)-85,y+h+25,x+(w/2)-90,y+h+5+20,x+(w/2)-90,y+h+5+25)
        cairo_line_to(display,x+(w/2)-90,y+h+40)
    end
    cairo_set_source_rgba(display,rgb_to_r_g_b(data.graph_bg_colour,value))
    cairo_set_line_width(display, 2)
    cairo_stroke(display)
    cairo_move_to(display,x+(ox/5),y+(oy*3))                                    --move to text position
    cairo_set_source_rgba(display,rgb_to_r_g_b(data.txt_fg_colour,data.txt_fg_alpha))   --text colour
    cairo_set_font_size (display, data.txt_size)                                --text size
    cairo_show_text(display,math.floor(value*100).." %")                        --text to display
    cairo_stroke(display)                                                       --draw text
    collectgarbage(collect)
end
local function draw_mem(display)--draw memory
    local x, y, tx = 35, 200,31
    local w, h, c_r = 205, 45, 5

    local function draw_memeory(display,x,y,w,h)
        cairo_set_line_width(display, 3.0)
        cairo_move_to(display,x,y)                                      --start position (top left)
        cairo_line_to(display,x+w,y)                                    --across top
        cairo_rel_line_to(display,0,h)                                  --down right
        cairo_rel_line_to(display,-10,0)                                --left 10
        cairo_rel_line_to(display,0,12)                                 --down 12 (bottom right)
        cairo_rel_line_to(display,-100,0)                               --left across bottom to middle
        cairo_rel_line_to(display,0,-12)                                --up 12
        cairo_rel_line_to(display,-5,0)                                 --left 5
        cairo_rel_line_to(display,0,12)                                 --down 12
        cairo_rel_line_to(display,-80,0)                                --right 80
        cairo_rel_line_to(display,0,-12)                                --up 12
        cairo_rel_line_to(display,-10,0)                                --left 10
        cairo_close_path(display)                                       --back to start position and close path
        pt = cairo_copy_path (display)                                  --copy the path to variable
        cairo_set_source_rgba(display,rgb_to_r_g_b(0x202020,1.0))       --black
        cairo_stroke(display)                                           --draw line on path

        cairo_new_path (display)                                        --reset path
        cairo_append_path (display, pt)                                 --copy previous path to curent path
        cairo_set_source_rgba(display,rgb_to_r_g_b(0x003500,1.0))       --green
        cairo_fill(display)                                             --draw fill within path area
        cairo_path_destroy (pt)                                         --release variable memory allocation
        collectgarbage(collect)
    end

    local function draw_sub(display,sx,sy,sw,sh)
        cairo_set_source_rgba(display,rgb_to_r_g_b(0x101010,1.0))   --grey
        cairo_move_to(display,sx,sy)                                --start position for fill1
        cairo_rel_line_to(display,sw,0)
        cairo_rel_line_to(display,0,sh)
        cairo_rel_line_to(display,-sw,0)
        cairo_close_path(display)                                   --back to start position and close path
        pt = cairo_copy_path (display)                              --copy the path to variable
        cairo_set_line_width(display, 3.0)
        cairo_fill(display)                                         --draw fill within path area
        cairo_new_path (display)
        cairo_append_path (display, pt)
        cairo_set_source_rgba(display,rgb_to_r_g_b(0x282828,1.0))
        cairo_stroke(display)                                       --draw line on path
        cairo_path_destroy (pt)                                     --release variable memory allocation
        collectgarbage(collect)                                     --free unused memory
    end

    local function draw_pin(display,sx,sy,sw,sh)
        cairo_set_source_rgba(display,rgb_to_r_g_b(0x999966,1.0))   --gold
        cairo_move_to(display,sx,sy)                                --start position for fill1
        cairo_rel_line_to(display,0,sh)
        cairo_set_line_width(display, sw)
        cairo_stroke(display)
        collectgarbage(collect)
    end

    draw_memeory(display,x,y,w,h)
    draw_sub(display,x+5,y+5,20,30)
    draw_sub(display,x+30,y+5,20,30)
    draw_sub(display,x+55,y+5,20,30)
    draw_sub(display,x+80,y+5,20,30)
    draw_sub(display,x+105,y+5,20,30)
    draw_sub(display,x+130,y+5,20,30)
    draw_sub(display,x+155,y+5,20,30)
    draw_sub(display,x+180,y+5,20,30)

    while tx < 119 do
        draw_pin(display,tx+12,y+h+2,2,12)
        tx = tx+4
    end

    tx = tx+4

    while tx < 225 do
        draw_pin(display,tx+12,y+h+2,2,12)
        tx = tx+4
    end


end
local function graphics_load(display)-- init gauge rings.
    local function load_proc(display,data)
        local str, value = '', '', 0
        str = string.format('${%s %s}', data.name, data.arg)
        str = conky_parse(str)
        value = str/100
        draw_proc(display, data, value)
    end
    for i in pairs(cpus) do
        load_proc(display, cpus[i])
    end
    draw_mem(display)
end
local function text_load(display)-- Show text.
    local function image (im)-- Show images
        local x = (im.x or 0)
        local y = (im.y or 0)
        local w = (im.w or 0)
        local h = (im.h or 0)
        local r = (im.rotation or 0)
        if (im.name) == "wind_direc" then
            r = (tonumber(conky_ownpreexec_noend("jq '.wind.deg' ~/.cache/weather.json | awk '{print int($1+0.5)}' "))+0)
            if r > 360 then r = r - 360 end
        end
        local file = tostring (im.file)
        if file == nil then print ("set image file") end
        local show = imlib_load_image (file)
        if show == nil then return end
        imlib_context_set_image (show)
        if tonumber (w) == 0 then
            width = imlib_image_get_width ()
        else
            width = tonumber (w)
        end
        if tonumber (h) == 0 then
            height = imlib_image_get_height ()
        else
            height = tonumber (h)
        end
        imlib_context_set_image (show)
        local scaled = imlib_create_cropped_scaled_image (0, 0,imlib_image_get_width (), imlib_image_get_height (), width, height)
        imlib_free_image ()
        imlib_context_set_image (scaled)
        local scaled2 = imlib_create_rotated_image(math.rad(r))
        imlib_free_image ()
        imlib_context_set_image (scaled2)
        imlib_render_image_on_drawable (x-(w/4), y-(h/4))
        imlib_free_image ()
        show = nil
    end
    local function display_text(display,data)
        cairo_move_to(display,data.x,data.y)
        cairo_select_font_face(display,data.font,data.font_slant,data.font_style)
        cairo_set_font_size (display,data.font_size)
        cairo_set_source_rgba(display,rgb_to_r_g_b(data.font_colour,data.font_colour_alpha))
        if data.name == "wind_dir" then
            cairo_show_text(display,data.prefix..con_dir(conky_ownpreexec_noend(data.command))..data.suffix)
        else
            cairo_show_text(display,data.prefix..conky_ownpreexec_noend(data.command)..data.suffix)
        end
        cairo_stroke(display)
    end
    if (os.date("%M")%2) == 0 and (os.date("%S")%30) == 0 then ret_weather() end
    if (os.date("%M")%10) == 0 and (os.date("%S")%30) == 0 then cp_weather() end
    for i in pairs(txt_data) do
        display_text(display, txt_data[i])
    end
    i = nil
    for i in pairs(img_data) do
        image (img_data[i])
    end
    collectgarbage(collect)
end
function conky_main()-- conky main (lua posthook).
    if conky_window == nil then return end -- check for conky window
    if tonumber(conky_parse("$updates"))<20 then return end -- check for # of updates
    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local display = cairo_create(cs)
    text_load(display)
    graphics_load(display)
    cairo_destroy(display)
    cairo_surface_destroy(cs)
    display=nil
end
function conky_background()-- draw conky background(lua prehook).
    if conky_window == nil then return end
    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local display = cairo_create(cs)
    local corner_r=20           -- Set the corner radius of the background.
    local bg_colour=0x000000    -- Set the colour and transparency (alpha) of your background.
    local bg_alpha=0.0
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
    cairo_destroy(display)
    cairo_surface_destroy(cs)
    display=nil
end

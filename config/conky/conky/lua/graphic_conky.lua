
require 'cairo'

local cores = {
{
    name='cpu',arg='cpu1',
    x=40,y=50,
    width=15,height=30,corner_radius=2,
    line_thickness=0.3,line_colour=0x00CC00,line_alpha=1.0,
    fill_colour=0x999999,fill_alpha=1.0,
},
{
    name='cpu',arg='cpu2',
    x=100,y=50,
    width=15,height=30,corner_radius=2,
    line_thickness=0.3,line_colour=0x00CC00,line_alpha=1.0,
    fill_colour=0x999999,fill_alpha=1.0,
},
{
    name='cpu',arg='cpu3',
    x=160,y=50,
    width=15,height=30,corner_radius=2,
    line_thickness=0.3,line_colour=0x00CC00,line_alpha=1.0,
    fill_colour=0x999999,fill_alpha=1.0,
},
{
    name='cpu',arg='cpu4',
    x=220,y=50,
    width=15,height=30,corner_radius=2,
    line_thickness=0.3,line_colour=0x00CC00,line_alpha=1.0,
    fill_colour=0x999999,fill_alpha=1.0,
},
{
    name='cpu',arg='cpu5',
    x=40,y=120,
    width=15,height=30,corner_radius=2,
    line_thickness=0.3,line_colour=0x00CC00,line_alpha=1.0,
    fill_colour=0x999999,fill_alpha=1.0,
},
{
    name='cpu',arg='cpu6',
    x=100,y=120,
    width=15,height=30,corner_radius=2,
    line_thickness=0.3,line_colour=0x00CC00,line_alpha=1.0,
    fill_colour=0x999999,fill_alpha=1.0,
},
{
    name='cpu',arg='cpu7',
    x=160,y=120,
    width=15,height=30,corner_radius=2,
    line_thickness=0.3,line_colour=0x00CC00,line_alpha=1.0,
    fill_colour=0x999999,fill_alpha=1.0,
},
{
    name='cpu',arg='cpu8',
    x=220,y=120,
    width=15,height=30,corner_radius=2,
    line_thickness=0.3,line_colour=0x00CC00,line_alpha=1.0,
    fill_colour=0x999999,fill_alpha=1.0,
},
}
local txt_data = {-- txt DATA.
{ --current temp
    name='temp_cur',
    command="jq '.main.temp' ~/.cache/weather.json | awk '{print int($1+0.5)}'",
    x=210,                           y=26,
    font='Source Sans Pro Regular', font_size=18,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='°',
},
{ --humidity
    name='humidity',
    command="jq '.main.humidity' ~/.cache/weather.json | awk '{print int($1+0.5)}'",
    x=250,                           y=60,
    font='Source Sans Pro Regular', font_size=10,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xCCCCCC,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='% Humidity',
},
{ --pressure
    name='pressure',
    command="jq '.main.pressure' ~/.cache/weather.json | awk '{print int($1+0.5)/10}'",
    x=318,                           y=60,
    font='Source Sans Pro Regular', font_size=10,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xCCCCCC,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix=' ',                      suffix=' kpa',
},
{ --feels like
    name='temp_feel',
    command="jq '.main.feels_like' ~/.cache/weather.json | awk '{print int($1+0.5)}'",
    x=170,                           y=60,
    font='Source Sans Pro Regular', font_size=12,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xCCCCCC,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='feels like ',                      suffix='°',
},
{ --weather description
    name='desc_image',
    command="jq -r '.weather[0].description' ~/.cache/weather.json ",
    x=250,                           y=22,
    font='Source Sans Pro Regular', font_size=12,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='',
},
{ --windspeed
    name='wind_speed',
    command="jq '.wind.speed' ~/.cache/weather.json | awk '{print int($1+0.5)}' ",
    x=340,                           y=44,
    font='Source Sans Pro Regular', font_size=12,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xCCCCCC,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix=' ',                      suffix=' kt',
},
{ --wind direction
    name='wind_dir',
    command="jq '.wind.deg' ~/.cache/weather.json | awk '{print int($1+0.5)}' ",
    x=250,                           y=44,
    font='Source Sans Pro Regular', font_size=12,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xCCCCCC,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='Wind:        ',                      suffix='  @ ',
},
{ --wind direction 2
    name='wind_dir_2',
    command="jq '.wind.deg' ~/.cache/weather.json | awk '{print int($1+0.5)}' ",
    x=170,                           y=105,
    font='Source Sans Pro Regular', font_size=11,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFAAAA,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
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
    x=100,                           y=50,
    font='Source Sans Pro Regular', font_size=24,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='',
},
{ --minute
    name='miniute',
    command="date +%M",
    x=125,                           y=43,
    font='Source Sans Pro Regular', font_size=14,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix=':',                      suffix='',
},
{ --seconds
    name='seconds',
    command="date +%S",
    x=147,                           y=39,
    font='Source Sans Pro Regular', font_size=8,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix=':',                      suffix='',
},
{ --ampm
    name='ampm',
    command="date +%p",
    x=129,                           y=53,
    font='Source Sans Pro Regular', font_size=8,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='',
},
{ --sysinfo
    name='sysinfo',
    command="lsb_release -d | grep 'Descr'|awk {'print $2'}",
    x=90,                           y=125,
    font='Source Sans Pro Regular', font_size=16,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='',
},
{ --kernel
    name='kernel',
    command="uname -r",
    x=90,                           y=140,
    font='Source Sans Pro Regular', font_size=10,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='',
},
{ --cpu temp
    name='ctemp',
    command="sensors | grep 'Package id 0' | awk {'print $4'}",
    x=300,                           y=130,
    font='Source Sans Pro Regular', font_size=10,           font_style='CAIRO_FONT_WEIGHT_BOLD',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='CPU ',                      suffix='',
},
{ --gpu temp
    name='gtemp',
    command="nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader",
    x=300,                           y=150,
    font='Source Sans Pro Regular', font_size=10,           font_style='CAIRO_FONT_WEIGHT_BOLD',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='GPU +',                      suffix='°C',
},
{ --sunrise
    name='sunrise',
    command="date --date=@$(jq '.sys.sunrise' /home/kim/.cache/weather.json | awk '{print int($1+0.5)}') | awk '{print $5}'",
    x=170,                          y=80,
    font='Source Sans Pro Regular', font_size=11,           font_style='CAIRO_FONT_WEIGHT_BOLD',
    font_colour=0xFFAAAA,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='Sunrise: ',             suffix=' AM',
},
{ --sunset
    name='sunset',
    command="date --date=@$(jq '.sys.sunset' /home/kim/.cache/weather.json | awk '{print int($1+0.5)}') | awk '{print $5}'",
    x=170,                          y=92,
    font='Source Sans Pro Regular', font_size=11,           font_style='CAIRO_FONT_WEIGHT_BOLD',
    font_colour=0xFFAAAA,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='Sunset: ',             suffix=' PM',
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
    collectgarbage(collect)

end
local function conky_ownpreexec_noend(command)-- returns value from command with no end

    local fp = assert(io.popen(command, 'r'))
    local rv = assert(fp:read('*l'))
    return rv
    collectgarbage(collect)

end
local function ret_weather()-- retrieve weather info from openweathermap.com

    local c1 = "l=$t4; l=${l%%_*}; curl -s 'api.openweathermap.org/data/2.5/weather?APPID=0f69f19dda763e192a320133a19ebba7&id=6119109&cnt=5&units=metric&lang=' -o ~/.cache/weather.json"
    local fp = assert(io.popen(c1, r))
    collectgarbage(collect)

end
local function cp_weather()-- copy weather icon to "current.png"

    local c2 = "cp -f ~/.config/conky/images/weather-icons/64px-orange/$(jq .weather[0].id ~/.cache/weather.json).png ~/.cache/current.png"
    local fp2 = assert(io.popen(c2, r))
    collectgarbage(collect)

end
local function rgb_to_r_g_b(colour, alpha)-- extract values from hexidecimal color(0x000000).
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end
local function angle_to_position(start_angle, current_angle)-- convert angles to positions.
    local pos = current_angle + start_angle
    return ( ( pos * (2 * math.pi / 360) ) - (math.pi / 2) )
    --collectgarbage(collect)
end

local function text_load(display)-- Show text.

    local function display_text(display,data)

        cairo_move_to(display,data['x'],data['y'])
        cairo_select_font_face(display,data['font'],data['font_slant'],data['font_style'])
        cairo_set_font_size (display,data['font_size'])
        cairo_set_source_rgba(display,rgb_to_r_g_b(data['font_colour'],data['font_colour_alpha']))
        if data['name'] == "wind_dir" then
            cairo_show_text(display,data['prefix']..con_dir(conky_ownpreexec_noend(data['command']))..data['suffix'])
        else
            cairo_show_text(display,data['prefix']..conky_ownpreexec_noend(data['command'])..data['suffix'])
        end
        cairo_stroke(display)

    end

    if (os.date("%M")%2) == 0 and (os.date("%S")%30) == 0 then ret_weather() end
    if (os.date("%M")%10) == 0 and (os.date("%S")%30) == 0 then cp_weather() end
    for i in pairs(txt_data) do
        display_text(display, txt_data[i])
    end
    collectgarbage(collect)

end
-- conky main.
function conky_main()

    if conky_window == nil then return end -- check for conky window.
    if tonumber(conky_parse("$updates"))<3 then return end -- check for # of updates.

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local display = cairo_create(cs)

    text_load(display)

    cairo_surface_destroy(cs)
    cairo_destroy(display)
    collectgarbage(collect)

end
-- draw conky background(lua prehook).
function conky_background()

    -- Set the corner radius of the background.
    local corner_r=40
    -- Set the colour and transparency (alpha) of your background.
    local bg_colour=0x000000
    local bg_alpha=0.2

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
    collectgarbage(collect)

end

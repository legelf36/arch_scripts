--                                 conky_redux.lua
require("cairo_xlib")
require("cairo")
require("imlib2")

local cpus = { -- gauge DATA.
	{ -- cpu0
		name = "cpu",	arg = "cpu0",	max_value = 100,
		x = 22,	y = 250,	x2 = 20,	y2 = 155,
		offsetx = 5,	offsety = 4,	w = 230,	h = 8,	c_r = 3,
		graph_radius = 12,	graph_thickness = 4,	graph_start_angle = 180,
		graph_unit_angle = 2.7,	graph_unit_thickness = 2.7,
		graph_bg_colour = 0x55aaff,	graph_bg_alpha = 0.3,
		graph_fg_colour = 0xBBBB88,	graph_fg_alpha = 0.5,
		hand_fg_colour = 0xEF5A29,	hand_fg_alpha = 1,
		shadow_colour = 0x111111,	shadow_alpha = 0,
		txt_radius = 8,	txt_weight = 0,	txt_size = 9.0,
		txt_fg_colour = 0x000000,	txt_fg_alpha = 1,
		graduation_radius = 12,	graduation_thickness = 5,
		graduation_mark_thickness = 1,	graduation_unit_angle = 27,
		graduation_fg_colour = 0xFFFFFF,	graduation_fg_alpha = 0.8,
		caption = "",	caption_weight = 1,	caption_size = 8.0,
		caption_fg_colour = 0xFFFFFF,	caption_fg_alpha = 0.3,
	},
	{ -- cpu1
		name = "cpu",	arg = "cpu1",	max_value = 100,
		x = 22,		y = 240,	x2 = 20,	y2 = 168,
		offsetx = 5,		offsety = 4,	w = 20,		h = 37,		c_r = 2,
		graph_radius = 12,	graph_thickness = 4,	graph_start_angle = 180,
		graph_unit_angle = 2.7,	graph_unit_thickness = 2.7,
		graph_bg_colour = 0x0060AA,	graph_bg_alpha = 0.3,
		graph_fg_colour = 0xBBBB88,	graph_fg_alpha = 0.5,
		hand_fg_colour = 0xEF5A29,	hand_fg_alpha = 1,
		shadow_colour = 0x111111,	shadow_alpha = 0,
		txt_radius = 8,	txt_weight = 0,	txt_size = 9.0,
		txt_fg_colour = 0x000000,	txt_fg_alpha = 1,
		graduation_radius = 12,		graduation_thickness = 5,
		graduation_mark_thickness = 1,	graduation_unit_angle = 27,
		graduation_fg_colour = 0xFFFFFF,	graduation_fg_alpha = 0.8,
		caption = "",	caption_weight = 1,	caption_size = 8.0,
		caption_fg_colour = 0xFFFFFF,	caption_fg_alpha = 0.3,
	},
	{ -- cpu2
		name = "cpu",	arg = "cpu2",	max_value = 100,
		x = 22,		y = 295,	x2 = 50,	y2 = 168,
		offsetx = 5,	offsety = 4,	w = 20,	h = 37,	c_r = 2,
		graph_radius = 12,	graph_thickness = 4,	graph_start_angle = 180,
		graph_unit_angle = 2.7,	graph_unit_thickness = 2.7,
		graph_bg_colour = 0x0060AA,	graph_bg_alpha = 0.3,
		graph_fg_colour = 0xBBBB88,	graph_fg_alpha = 0.5,
		hand_fg_colour = 0xEF5A29,	hand_fg_alpha = 1,
		shadow_colour = 0x111111,	shadow_alpha = 0,
		txt_radius = 8,	txt_weight = 0,	txt_size = 9.0,
		txt_fg_colour = 0x000000,	txt_fg_alpha = 1,
		graduation_radius = 12,	graduation_thickness = 5,	graduation_mark_thickness = 1,
		graduation_unit_angle = 27,
		graduation_fg_colour = 0xFFFFFF,	graduation_fg_alpha = 0.8,
		caption = "",	caption_weight = 1,	caption_size = 8.0,
		caption_fg_colour = 0xFFFFFF,	caption_fg_alpha = 0.3,
	},
	{ -- cpu3
		name = "cpu",	arg = "cpu3",	max_value = 100,
		x = 22,		y = 345,	x2 = 80,	y2 = 168,
		offsetx = 5,	offsety = 4,	w = 20,	h = 37,	c_r = 2,
		graph_radius = 12,	graph_thickness = 4,	graph_start_angle = 180,
		graph_unit_angle = 2.7,	graph_unit_thickness = 2.7,
		graph_bg_colour = 0x0060AA,	graph_bg_alpha = 0.3,
		graph_fg_colour = 0xBBBB88,	graph_fg_alpha = 0.5,
		hand_fg_colour = 0xEF5A29,	hand_fg_alpha = 1,
		shadow_colour = 0x111111,	shadow_alpha = 0,
		txt_radius = 8,	txt_weight = 0,	txt_size = 9.0,
		txt_fg_colour = 0x000000,	txt_fg_alpha = 1,
		graduation_radius = 12,		graduation_thickness = 5,
		graduation_mark_thickness = 1,	graduation_unit_angle = 27,
		graduation_fg_colour = 0xFFFFFF,	graduation_fg_alpha = 0.8,
		caption = "",	caption_weight = 1,	caption_size = 8.0,
		caption_fg_colour = 0xFFFFFF,	caption_fg_alpha = 0.3,
	},
	{ -- cpu4
		name = "cpu",	arg = "cpu4",	max_value = 100,
		x = 22,		y = 395,	x2 = 110,	y2 = 168,
		offsetx = 5,	offsety = 4,	w = 20,	h = 37,	c_r = 2,
		graph_radius = 12,	graph_thickness = 4,
		graph_start_angle = 180,	graph_unit_angle = 2.7,	graph_unit_thickness = 2.7,
		graph_bg_colour = 0x0060AA,	graph_bg_alpha = 0.3,
		graph_fg_colour = 0xBBBB88,	graph_fg_alpha = 0.5,
		hand_fg_colour = 0xEF5A29,	hand_fg_alpha = 1,
		shadow_colour = 0x111111,	shadow_alpha = 0,
		txt_radius = 8,	txt_weight = 0,	txt_size = 9.0,
		txt_fg_colour = 0x000000,	txt_fg_alpha = 1,
		graduation_radius = 12,	graduation_thickness = 5,
		graduation_mark_thickness = 1,	graduation_unit_angle = 27,
		graduation_fg_colour = 0xFFFFFF,graduation_fg_alpha = 0.8,
		caption = "",	caption_weight = 1,	caption_size = 8.0,
		caption_fg_colour = 0xFFFFFF,	caption_fg_alpha = 0.3,
	},
	{ -- cpu5
		name = "cpu",	arg = "cpu5",	max_value = 100,
		x = 380,	y = 245,	x2 = 140,	y2 = 168,
		offsetx = 5,	offsety = 4,	w = 20,	h = 37,		c_r = 2,
		graph_radius = 12,	graph_thickness = 4,	graph_start_angle = 180,
		graph_unit_angle = 2.7,	graph_unit_thickness = 2.7,
		graph_bg_colour = 0x0060FF,	graph_bg_alpha = 0.3,
		graph_fg_colour = 0x999966,	graph_fg_alpha = 1,
		hand_fg_colour = 0xEF5A29,	hand_fg_alpha = 1,
		shadow_colour = 0x111111,	shadow_alpha = 0,
		txt_radius = 8,	txt_weight = 0,	txt_size = 9.0,
		txt_fg_colour = 0x000000,	txt_fg_alpha = 1,
		graduation_radius = 12,		graduation_thickness = 5,
		graduation_mark_thickness = 1,	graduation_unit_angle = 27,
		graduation_fg_colour = 0xFFFFFF,	graduation_fg_alpha = 0.8,
		caption = "",	caption_weight = 1,	caption_size = 8.0,
		caption_fg_colour = 0xFFFFFF,	caption_fg_alpha = 0.3,
	},
	{ -- cpu6
		name = "cpu",	arg = "cpu6",	max_value = 100,
		x = 380,	y = 295,	x2 = 170,	y2 = 168,
		offsetx = 5,	offsety = 4,	w = 20,		h = 37,	c_r = 2,
		graph_radius = 12,	graph_thickness = 4,	graph_start_angle = 180,
		graph_unit_angle = 2.7,	graph_unit_thickness = 2.7,
		graph_bg_colour = 0x0060FF,	graph_bg_alpha = 0.3,
		graph_fg_colour = 0x999966,	graph_fg_alpha = 1,
		hand_fg_colour = 0xEF5A29,	hand_fg_alpha = 1,
		shadow_colour = 0x111111,	shadow_alpha = 0,
		txt_radius = 8,	txt_weight = 0,	txt_size = 9.0,
		txt_fg_colour = 0x000000,	txt_fg_alpha = 1,
		graduation_radius = 12,	graduation_thickness = 5,
		graduation_mark_thickness = 1,	graduation_unit_angle = 27,
		graduation_fg_colour = 0xFFFFFF,graduation_fg_alpha = 0.8,
		caption = "",	caption_weight = 1,	caption_size = 8.0,
		caption_fg_colour = 0xFFFFFF,	caption_fg_alpha = 0.3,
	},
	{ -- cpu7
		name = "cpu",	arg = "cpu7",	max_value = 100,
		x = 380,	y = 345,	x2 = 200,	y2 = 168,
		offsetx = 5,	offsety = 4,	w = 20,	h = 37,	c_r = 2,
		graph_radius = 12,	graph_thickness = 4,	graph_start_angle = 180,
		graph_unit_angle = 2.7,		graph_unit_thickness = 2.7,
		graph_bg_colour = 0x0060FF,	graph_bg_alpha = 0.3,
		graph_fg_colour = 0x999966,	graph_fg_alpha = 1,
		hand_fg_colour = 0xEF5A29,	hand_fg_alpha = 1,
		shadow_colour = 0x111111,	shadow_alpha = 0,
		txt_radius = 8,	txt_weight = 0,	txt_size = 9.0,
		txt_fg_colour = 0x000000,	txt_fg_alpha = 1,
		graduation_radius = 12,	graduation_thickness = 5,
		graduation_mark_thickness = 1,	graduation_unit_angle = 27,
		graduation_fg_colour = 0xFFFFFF,graduation_fg_alpha = 0.8,
		caption = "",	caption_weight = 1,	caption_size = 8.0,
		caption_fg_colour = 0xFFFFFF,	caption_fg_alpha = 0.3,
	},
	{ -- cpu8
		name = "cpu",	arg = "cpu8",	max_value = 100,
		x = 380,	y = 395,	x2 = 230,	y2 = 168,
		offsetx = 5,	offsety = 4,	w = 20,	h = 37,	c_r = 2.25,
		graph_radius = 12,	graph_thickness = 4,	graph_start_angle = 180,
		graph_unit_angle = 2.7,	graph_unit_thickness = 2.7,
		graph_bg_colour = 0x0060FF,	graph_bg_alpha = 0.3,
		graph_fg_colour = 0x999966,	graph_fg_alpha = 1,
		hand_fg_colour = 0xEF5A29,	hand_fg_alpha = 1,
		shadow_colour = 0x111111,	shadow_alpha = 0,
		txt_radius = 8,	txt_weight = 0,	txt_size = 9.0,
		txt_fg_colour = 0x000000,	txt_fg_alpha = 1,
		graduation_radius = 12,	graduation_thickness = 5,
		graduation_mark_thickness = 1,	graduation_unit_angle = 27,
		graduation_fg_colour = 0xFFFFFF,graduation_fg_alpha = 0.8,
		caption = "",	caption_weight = 1,	caption_size = 8.0,
		caption_fg_colour = 0xFFFFFF,	caption_fg_alpha = 0.3,
	},
}
local gpus = { --gpu DATA
	{ -- gpu1
		name = "nvidia",
		arg = "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits",
		max_value = 100,
		x = 22,	y = 250,	x2 = 20,	y2 = 210 ,	offsetx = 5,	offsety = 4,
		w = 230,	h = 8,	c_r = 2,
		font = "MesloLGM",	font_size = 12,	font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0xFFFFFF,	font_colour_alpha = 1.0,	font_slant = "CAIRO_FONT_SLANT_NORMAL",
		graph_radius = 12,	graph_thickness = 4,	graph_start_angle = 180,
		graph_unit_angle = 2.7,	graph_unit_thickness = 2.7,
		graph_bg_colour = 0xaaffaa,	graph_bg_alpha = 0.3,
		graph_fg_colour = 0xBBBB88,	graph_fg_alpha = 0.5,
		hand_fg_colour = 0xEF5A29,	hand_fg_alpha = 1,
		shadow_colour = 0x111111,	shadow_alpha = 0,
		txt_radius = 8,	txt_weight = 1,	txt_size = 10.0,
		txt_fg_colour = 0x000000,	txt_fg_alpha = 1,
		graduation_radius = 12,		graduation_thickness = 5,
		graduation_mark_thickness = 1,	graduation_unit_angle = 27,
		graduation_fg_colour = 0xFFFFFF,	graduation_fg_alpha = 0.8,
		caption = " Util",	caption_weight = 1,	caption_size = 12.0,
		caption_fg_colour = 0xffffff,	caption_fg_alpha = 1.0,
	},
	{ -- gpu2
		name = "nvidia",
		arg = "nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits",
		max_value = 120,
		x = 22,	y = 250,	x2 = 20,y2 = 223,	offsetx = 5,offsety = 4,
		w = 230,	h = 8,	c_r = 2,
		font = "MesloLGM",	font_size = 12,	font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0xFFFFFF,	font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		graph_radius = 12,	graph_thickness = 4,	graph_start_angle = 180,
		graph_unit_angle = 2.7,	graph_unit_thickness = 2.7,
		graph_bg_colour = 0xaaffaa,	graph_bg_alpha = 0.3,
		graph_fg_colour = 0xBBBB88,	graph_fg_alpha = 0.5,
		hand_fg_colour = 0xEF5A29,	hand_fg_alpha = 1,
		shadow_colour = 0x111111,	shadow_alpha = 0,
		txt_radius = 8,	txt_weight = 1,	txt_size = 10.0,
		txt_fg_colour = 0x000000,	txt_fg_alpha = 1,
		graduation_radius = 12,	graduation_thickness = 5,
		graduation_mark_thickness = 1,	graduation_unit_angle = 27,
		graduation_fg_colour = 0xFFFFFF,graduation_fg_alpha = 0.8,
		caption = " W",	caption_weight = 1,	caption_size = 12.0,
		caption_fg_colour = 0xFFFFFF,	caption_fg_alpha = 1.0,
	},
	{ -- gpu3
		name = "nvidia",
		arg = "nvidia-smi --query-gpu=clocks.mem --format=csv,noheader,nounits",
		max_value = 6000,
		x = 22,	y = 250,	x2 = 20,y2 = 236,	offsetx = 5,offsety = 4,
		w = 230,	h = 8,	c_r = 2,
		font = "MesloLGM",	font_size = 12,	font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0x555555,	font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		graph_radius = 12,	graph_thickness = 4,	graph_start_angle = 180,
		graph_unit_angle = 2.7,	graph_unit_thickness = 2.7,
		graph_bg_colour = 0xaaffaa,	graph_bg_alpha = 0.3,
		graph_fg_colour = 0xBBBB88,	graph_fg_alpha = 0.5,
		hand_fg_colour = 0xEF5A29,	hand_fg_alpha = 1,
		shadow_colour = 0x111111,	shadow_alpha = 0,
		txt_radius = 8,	txt_weight = 1,	txt_size = 10.0,
		txt_fg_colour = 0x000000,	txt_fg_alpha = 1,
		graduation_radius = 12,	graduation_thickness = 5,
		graduation_mark_thickness = 1,	graduation_unit_angle = 27,
		graduation_fg_colour = 0xFFFFFF,graduation_fg_alpha = 0.8,
		caption = " Mhz",	caption_weight = 1,	caption_size = 12.0,
		caption_fg_colour = 0xFFFFFF,	caption_fg_alpha = 1.0,
	},
	{ -- gpu4
		name = "nvidia",
		arg = "nvidia-smi --query-gpu=clocks.video --format=csv,noheader,nounits",
		max_value = 6000,
		x = 22,	y = 250,	x2 = 20,y2 = 249,	offsetx = 5,offsety = 4,
		w = 230,	h = 8,	c_r = 2,
		font = "MesloLGM",	font_size = 22,	font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0x555555,	font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		graph_radius = 12,	graph_thickness = 4,	graph_start_angle = 180,
		graph_unit_angle = 2.7,	graph_unit_thickness = 2.7,
		graph_bg_colour = 0xaaffaa,	graph_bg_alpha = 0.3,
		graph_fg_colour = 0xBBBB88,	graph_fg_alpha = 0.5,
		hand_fg_colour = 0xEF5A29,	hand_fg_alpha = 1,
		shadow_colour = 0x111111,	shadow_alpha = 0,
		txt_radius = 8,	txt_weight = 1,	txt_size = 10.0,
		txt_fg_colour = 0x000000,	txt_fg_alpha = 1,
		graduation_radius = 12,	graduation_thickness = 5,
		graduation_mark_thickness = 1,	graduation_unit_angle = 27,
		graduation_fg_colour = 0xFFFFFF,graduation_fg_alpha = 0.8,
		caption = " Mhz",	caption_weight = 1,	caption_size = 12.0,
		caption_fg_colour = 0xFFFFFF,	caption_fg_alpha = 1.0,
	},
	--[[{ -- gpu5
		name = "nvidia",
		arg = "nvidia-smi --query-gpu=clocks.gr --format=csv,noheader,nounits",
		max_value = 6000,
		x = 22,
		y = 250,
		x2 = 145,
		y2 = 265,
		offsetx = 5,
		offsety = 4,
		w = 230,
		h = 15,
		c_r = 3,
		font = "MesloLGM",
		font_size = 22,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0x555555,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		graph_radius = 12,
		graph_thickness = 4,
		graph_start_angle = 180,
		graph_unit_angle = 2.7,
		graph_unit_thickness = 2.7,
		graph_bg_colour = 0xaaffaa,
		graph_bg_alpha = 0.3,
		graph_fg_colour = 0xBBBB88,
		graph_fg_alpha = 0.5,
		hand_fg_colour = 0xEF5A29,
		hand_fg_alpha = 1,
		shadow_colour = 0x111111,
		shadow_alpha = 0,
		txt_radius = 8,
		txt_weight = 0,
		txt_size = 12.0,
		txt_fg_colour = 0xffffff,
		txt_fg_alpha = 1,
		graduation_radius = 12,
		graduation_thickness = 5,
		graduation_mark_thickness = 1,
		graduation_unit_angle = 27,
		graduation_fg_colour = 0xFFFFFF,
		graduation_fg_alpha = 0.8,
		caption = " Mhz(shader)",
		caption_weight = 1,
		caption_size = 12.0,
		caption_fg_colour = 0xFFFFFF,
		caption_fg_alpha = 1.0,
	},
	{ -- gpu6
		name = "nvidia",
		arg = "nvidia-smi --query-gpu=clocks.sm --format=csv,noheader,nounits",
		max_value = 6000,
		x = 22,
		y = 250,
		x2 = 145,
		y2 = 285,
		offsetx = 5,
		offsety = 4,
		w = 230,
		h = 15,
		c_r = 3,
		font = "MesloLGM",
		font_size = 22,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0x555555,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		graph_radius = 12,
		graph_thickness = 4,
		graph_start_angle = 180,
		graph_unit_angle = 2.7,
		graph_unit_thickness = 2.7,
		graph_bg_colour = 0xaaffaa,
		graph_bg_alpha = 0.3,
		graph_fg_colour = 0xBBBB88,
		graph_fg_alpha = 0.5,
		hand_fg_colour = 0xEF5A29,
		hand_fg_alpha = 1,
		shadow_colour = 0x111111,
		shadow_alpha = 0,
		txt_radius = 8,
		txt_weight = 0,
		txt_size = 12.0,
		txt_fg_colour = 0xffffff,
		txt_fg_alpha = 1,
		graduation_radius = 12,
		graduation_thickness = 5,
		graduation_mark_thickness = 1,
		graduation_unit_angle = 27,
		graduation_fg_colour = 0xFFFFFF,
		graduation_fg_alpha = 0.8,
		caption = " Mhz(stream)",
		caption_weight = 1,
		caption_size = 12.0,
		caption_fg_colour = 0xFFFFFF,
		caption_fg_alpha = 1.0,
	}]]
	--
}
local txt_data = { -- txt DATA.
	{ --current temp
		name = "temp_cur",
		command = "jq '.main.temp' ~/.cache/weather.json | awk '{print int($1+0.5)}'",
		x = 210,
		y = 48,
		font = "Meslo Nerd Font",
		font_size = 28,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0xFFFFFF,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = "",
		suffix = "°",
	},
	{ --humidity
		name = "humidity",
		command = "jq '.main.humidity' ~/.cache/weather.json | awk '{print int($1+0.5)}'",
		x = 146,
		y = 118,
		font = "MesloLGM Nerd",
		font_size = 10,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0x88AACC,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = "Hum:",
		suffix = "%",
	},
	{ --pressure
		name = "pressure",
		command = "jq '.main.pressure' ~/.cache/weather.json | awk '{print int($1+0.5)/10}'",
		x = 200,
		y = 119,
		font = "MesloLGM Nerd",
		font_size = 10,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0x88BBAA,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = "  ",
		suffix = " kpa",
	},
	{ --feels like
		name = "temp_feel",
		command = "jq '.main.feels_like' ~/.cache/weather.json | awk '{print int($1+0.5)}'",
		x = 170,
		y = 65,
		font = "Meslo Nerd Font",
		font_size = 12,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0xAAAAAA,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = "feels like ",
		suffix = "°",
	},
	{ --weather description
		name = "desc_image",
		command = "jq -r '.weather[0].description' ~/.cache/weather.json ",
		x = 160,
		y = 19,
		font = "MesloLGM",
		font_size = 12,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0xFFFFFF,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = "",
		suffix = "",
	},
	{ --windspeed
		name = "wind_speed",
		command = "jq '.wind.speed' ~/.cache/weather.json | awk '{print int($1+0.5)}' ",
		x = 103,
		y = 118,
		font = "Arial",
		font_size = 12,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0xAABBAA,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = " ",
		suffix = "Km",
	},
	{ --wind direction
		name = "wind_dir",
		command = "jq '.wind.deg' ~/.cache/weather.json | awk '{print int($1+0.5)}' ",
		x = 20,
		y = 117,
		font = "Arial",
		font_size = 12,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0x88AACC,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = "Wind:        ",
		suffix = "  @ ",
	},
	--[[{ --wind direction 2
    name='wind_dir_2',
    command="jq '.wind.deg' ~/.cache/weather.json | awk '{print int($1+0.5)}' ",
    x=250,                           y=52,
    font='Source Sans Pro Regular', font_size=11,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0x77AA77,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='Wind: ',                      suffix='° ( 0° = S )',
},]]
	--
	{ --day of the week
		name = "day_of_the_week",
		command = "date +%A",
		x = 20,
		y = 75,
		font = "MesloLGM",
		font_size = 24,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0xFFFFFF,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = "",
		suffix = "",
	},
	{ --day of the month
		name = "day_of_the_month",
		command = "date +%-d",
		x = 20,
		y = 102,
		font = "Source Sans Pro Regular",
		font_size = 26,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0xFFFFFF,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = "",
		suffix = "",
	},
	{ --month
		name = "month",
		command = "date +%B",
		x = 55,
		y = 102,
		font = "Source Sans Pro Regular",
		font_size = 18,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0xFFFFFF,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = "",
		suffix = "",
	},
	{ --hour
		name = "hour",
		command = "date +%l",
		x = 155,
		y = 102,
		font = "Source Sans Pro Regular",
		font_size = 36,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0xFFFFFF,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = "",
		suffix = "",
	},
	{ --minute
		name = "miniute",
		command = "date +%M",
		x = 200,
		y = 90,
		font = "Source Sans Pro Regular",
		font_size = 20,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0xFFFFFF,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = ":",
		suffix = "",
	},
	{ --seconds
		name = "seconds",
		command = "date +%S",
		x = 229,
		y = 83,
		font = "Source Sans Pro Regular",
		font_size = 9,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0xFFFFFF,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = ":",
		suffix = "",
	},
	{ --ampm
		name = "ampm",
		command = "date +%p",
		x = 201,
		y = 104,
		font = "Source Sans Pro Regular",
		font_size = 8,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0xFFFFFF,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = "",
		suffix = "",
	},
	--[[{ --sysinfo
    name='sysinfo',
    command="lsb_release -d | grep 'Descr'|awk {'print $2$3'}",
    x=70,                           y=25,
    font='Source Sans Pro Regular', font_size=16,           font_style='CAIRO_FONT_WEIGHT_NORMAL',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='',
},]]
	--
	{ --kernel
		name = "kernel",
		command = "uname -r",
		x = 70,
		y = 50,
		font = "Source Sans Pro Regular",
		font_size = 8,
		font_style = "CAIRO_FONT_WEIGHT_NORMAL",
		font_colour = 0xaaaaaa,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = "",
		suffix = "",
	},
	{ --cpu temp
		name = "ctemp",
		command = "sensors | grep 'Package id 0' | awk {'print $4'}",
		x = 20,
		y = 146,
		font = "Source Sans Pro Regular",
		font_size = 10,
		font_style = "CAIRO_FONT_WEIGHT_BOLD",
		font_colour = 0x00CCFF,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = "CPU temp:",
		suffix = "",
	},
	{ --gpu temp
		name = "gtemp",
		command = "nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader",
		x = 145,
		y = 146,
		font = "Source Sans Pro Regular",
		font_size = 10,
		font_style = "CAIRO_FONT_WEIGHT_BOLD",
		font_colour = 0x00CCDD,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = "GPU temp:+",
		suffix = ".0°C",
	},
	--[[{ --gpu mem temp
    name='gmtemp',
    command="nvidia-smi --query-gpu=temperature.memory --format=csv,noheader,nounits",
    x=155,                           y=185,
    font='Source Sans Pro Regular', font_size=10,           font_style='CAIRO_FONT_WEIGHT_BOLD',
    font_colour=0xFFFFFF,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='GPU Mtemp:+',                      suffix='.0°C',
},]]
	--
	--[[{ --gpu fan
    name='gfan',
    command="nvidia-smi --query-gpu=fan.speed --format=csv,noheader",
    x=270,                           y=313,
    font='Meslo Nerd Font', font_size=10,           font_style='CAIRO_FONT_WEIGHT_BOLD',
    font_colour=0x99ff99,           font_colour_alpha=1.0,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='',                      suffix='',
},]]
	--
	{ --sunrise
		name = "sunrise",
		command = "date --date=@$(jq '.sys.sunrise' /home/kim/.cache/weather.json | awk '{print int($1+0.5)}') | awk '{print $5}'",
		x = 20,
		y = 132,
		font = "Source Sans Pro Regular",
		font_size = 11,
		font_style = "CAIRO_FONT_WEIGHT_BOLD",
		font_colour = 0x0099FF,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = "Sunrise: ",
		suffix = " AM",
	},
	{ --sunset
		name = "sunset",
		command = "date --date=@$(jq '.sys.sunset' /home/kim/.cache/weather.json | awk '{print int($1+0.5)}') | awk '{print $5}'",
		x = 145,
		y = 132,
		font = "Source Sans Pro Regular",
		font_size = 11,
		font_style = "CAIRO_FONT_WEIGHT_BOLD",
		font_colour = 0x0099FF,
		font_colour_alpha = 1.0,
		font_slant = "CAIRO_FONT_SLANT_NORMAL",
		prefix = "Sunset:  ",
		suffix = " PM",
	},
	--[[{ --gpu power draw
    name='gpwrdr',
    command="nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits",
    x=20,                           y=303,
    font='Meslo Nerd Font', font_size=10,           font_style='0',
    font_colour=0x99FF99,           font_colour_alpha=0.7,  font_slant='0',
    prefix='GPU Power:',                      suffix=' W',
},
{ --gpu memory clock
    name='gmemclk',
    command="nvidia-smi --query-gpu=clocks.mem --format=csv,noheader",
    x=135,                           y=303,
    font='Meslo Nerd Font', font_size=10,           font_style='CAIRO_FONT_WEIGHT_BOLD',
    font_colour=0x99FF99,           font_colour_alpha=0.7,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='GPU Memory: ',                      suffix='',
},
{ --gpu video clock
    name='gvclk',
    command="nvidia-smi --query-gpu=clocks.video --format=csv,noheader,nounits",
    x=270,                           y=303,
    font='Meslo Nerd Font', font_size=10,           font_style='CAIRO_FONT_WEIGHT_BOLD',
    font_colour=0x99FF99,           font_colour_alpha=0.7,  font_slant='CAIRO_FONT_SLANT_NORMAL',
    prefix='GPU Video: ',                      suffix='',
},]]
	--
}
local img_data = { --image DATA.
	{ -- Arcolinux logo
		name = "arcologo",	x = 45,	y = -40,	w = 150,h = 50,	rotation = 0,
		file = "/home/kim/.config/conky/images/Original-Arch-Linux/archlinux-logo-dark-scalable.svg",
	},
	{ -- weather icon
		name = "weather",	x = 165,y = 20,		w = 38,	h = 38,	rotation = 0,
		file = "/home/kim/.cache/current.png",
	},
	{ -- wind arrow
		name = "wind_direc",x = 53,y = 105,		w = 13,	h = 13,	rotation = 0,
		file = "/home/kim/Pictures/arrow_transparent.png",
	},
	--[[{-- moon phase
    name="moon_phase",
    x=310,   y=75,   w=32,   h=32,   rotation=0,
    file="/home/kim/Pictures/Moon_third_qtr.png",
},]]
	--
}
local function con_dir(val) -- convert direction
	local val1 = tonumber(val)
	if val1 >= 338 and val1 <= 360 then
		return "N"
	elseif val1 >= 0 and val1 <= 22 then
		return "N"
	elseif val1 >= 23 and val1 <= 67 then
		return "NE"
	elseif val1 >= 68 and val1 <= 112 then
		return "E"
	elseif val1 >= 113 and val1 <= 157 then
		return "SE"
	elseif val1 >= 158 and val1 <= 202 then
		return "S"
	elseif val1 >= 203 and val1 <= 247 then
		return "SW"
	elseif val1 >= 248 and val1 <= 292 then
		return "W"
	elseif val1 >= 293 and val1 <= 337 then
		return "NW"
	end
end
local function cws(val) --covert wind speed in knots to k\ph
	return math.ceil(tonumber(val)*1.852)
end
local function conky_ownpreexec_noend(command) -- returns value from command with no end
	local fp = assert(io.popen(command, "r"))
	local rv = assert(fp:read("*l"))
	return rv
end
local function ret_weather() -- retrieve weather info from openweathermap.com
	local c1 =
		"l=$t4; l=${l%%_*}; curl -s 'api.openweathermap.org/data/2.5/weather?APPID=0f69f19dda763e192a320133a19ebba7&id=6119109&cnt=5&units=metric&lang=' -o ~/.cache/weather.json"
	local fp = assert(io.popen(c1, r))
end
local function cp_weather() -- copy weather icon to "current.png"
	local c2 =
		"cp -f ~/.config/conky/images/weather-icons/64px-multicolor/$(jq .weather[0].id ~/.cache/weather.json).png ~/.cache/current.png"
	local fp2 = assert(io.popen(c2, r))
end
local function rgb_to_r_g_b(colour, alpha) -- extract r g b values from hexidecimal color(0x000000).
	return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end
local function draw_proc(display, data, value, str, str2) -- draw processor
	local x, y = data.x2, data.y2
	local w, h, c_r = data.w, data.h, data.c_r
	local ox, oy = data.offsetx, data.offsety
	local val = value / (data.max_value / 100)
	local tca = 1 - val

	cairo_move_to(display, x + c_r, y) --starting point
	cairo_line_to(display, x + w - c_r, y) --top line
	cairo_curve_to(display, x + w - c_r, y, x + w, y, x + w, y + c_r) --top right curve
	cairo_line_to(display, x + w, y + h - c_r) --right line
	cairo_curve_to(display, x + w, y + h - c_r, x + w, y + h, x + w - c_r, y + h) --bottom right curve
	cairo_line_to(display, x + c_r, y + h) --bottom line
	cairo_curve_to(display, x + c_r, y + h, x, y + h, x, y + h - c_r) --bottom left curve
	cairo_line_to(display, x, y + c_r) --left line
	cairo_curve_to(display, x, y + c_r, x, y, x + c_r, y) --top left curve
	cairo_close_path(display) --close path to fill
	cairo_set_line_width(display, data.graduation_mark_thickness) --line width
	cairo_set_source_rgba(display, rgb_to_r_g_b(data.graph_bg_colour, val)) --fill colour
	cairo_fill_preserve(display) --draw fill
	cairo_set_source_rgba(display, rgb_to_r_g_b(data.graph_bg_colour, val / 2))
	cairo_set_line_width(display, 1)
	cairo_stroke(display)
	cairo_set_source_rgba(display, rgb_to_r_g_b(data.txt_fg_colour, 1))
	cairo_select_font_face(display, "Meslo", 0, data.txt_weight)
	cairo_set_font_size(display, data.txt_size) --text size
	if data.arg == "cpu0" then
		cairo_move_to(display, x + (ox - 1), y + (oy + 4))
		cairo_show_text(display, math.floor(val * 100) .. " %  ")
	elseif data.name == "cpu" then
		cairo_move_to(display, x + (ox - 4), y + (oy + 8))
		cairo_show_text(display, math.floor(val * 100) .. "%  ")
	else
		cairo_move_to(display, x + (ox - 3), y + (oy + 5))
		cairo_show_text(display, math.floor(val * 100) .. " %  " .. value * 100 .. data.caption) --text to display
	end
	collectgarbage(collect)
end
local function graphics_load(display) -- init gauge rings.
	local function load_proc(display, data)
		local str, value = "", ""
		if data.name == "nvidia" then
			str = string.format(conky_ownpreexec_noend(data.arg))
			value = tonumber(str / 100)
		else
			str = string.format("${%s %s}", data.name, data.arg)
			str = conky_parse(str)
			value = tonumber(str / 100)
		end
		draw_proc(display, data, value)
	end

	local function image(im) -- Show images
		local x = (im.x or 0)
		local y = (im.y or 0)
		local w = (im.w or 0)
		local h = (im.h or 0)
		local r = (im.rotation or 0)
		if im.name == "wind_direc" then
			r = (
				tonumber(conky_ownpreexec_noend("jq '.wind.deg' ~/.cache/weather.json | awk '{print int($1+0.5)}' "))
				+ 0
			)
			if r > 360 then
				r = r - 360
			end
		end
		local file = tostring(im.file)
		if file == nil then
			print("set image file")
		end
		local show = imlib_load_image(file)
		if show == nil then
			return
		end
		imlib_context_set_image(show)
		if tonumber(w) == 0 then
			width = imlib_image_get_width()
		else
			width = tonumber(w)
		end
		if tonumber(h) == 0 then
			height = imlib_image_get_height()
		else
			height = tonumber(h)
		end
		imlib_context_set_image(show)
		local scaled =
			imlib_create_cropped_scaled_image(0, 0, imlib_image_get_width(), imlib_image_get_height(), width, height)
		imlib_free_image()
		imlib_context_set_image(scaled)
		local scaled2 = imlib_create_rotated_image(math.rad(r))
		imlib_free_image()
		imlib_context_set_image(scaled2)
		imlib_render_image_on_drawable(x - (w / 4), y - (h / 4))
		imlib_free_image()
		show = nil
	end

	for i in pairs(cpus) do
		load_proc(display, cpus[i])
	end
	for i in pairs(gpus) do
		load_proc(display, gpus[i])
	end
	for i in pairs(img_data) do
		image(img_data[i])
	end
end
local function text_load(display) -- Show text.

	local function display_text(display, data)
		cairo_move_to(display, data.x, data.y)
		cairo_select_font_face(display, data.font, data.font_slant, data.font_style)
		cairo_set_font_size(display, data.font_size)
		cairo_set_source_rgba(display, rgb_to_r_g_b(data.font_colour, data.font_colour_alpha))
		if data.name == "wind_dir" then
			cairo_show_text(display, data.prefix .. con_dir(conky_ownpreexec_noend(data.command)) .. data.suffix)
		elseif data.name == "wind_speed" then
			cairo_show_text(display, data.prefix .. cws(conky_ownpreexec_noend(data.command)) .. data.suffix)
		else
			cairo_show_text(display, data.prefix .. conky_ownpreexec_noend(data.command) .. data.suffix)
		end
		cairo_stroke(display)
	end

	if (os.date("%M") % 2) == 0 and (os.date("%S") % 30) == 0 then ret_weather() end
	if (os.date("%M") % 10) == 0 and (os.date("%S") % 30) == 0 then 	cp_weather() end

	for i, v in pairs(txt_data) do display_text(display, txt_data[i]) end

	i = nil
	collectgarbage(collect)

end
function conky_main() -- conky main (lua posthook).
	if conky_window == nil then	return end
	if tonumber(conky_parse("$updates")) < 20 then return end
	local cs = cairo_xlib_surface_create(
		conky_window.display,
		conky_window.drawable,
		conky_window.visual,
		conky_window.width,
		conky_window.height
	)
	local display = cairo_create(cs)

	--text_load(display)
	--graphics_load(display)

	cairo_destroy(display)
	cairo_surface_destroy(cs)
	display = nil
	collectgarbage(collect)

end
function conky_background() -- draw conky background(lua prehook).
	if conky_window == nil then
		return
	end
	if tonumber(conky_parse("$updates")) < 20 then return end
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

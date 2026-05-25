--[[
	My Conky main file
]]

configuration = {

-- common
	alignment = none,
	background = true,
	double_buffer = true,
	update_interval = 0.5,
	default_color = 'white',
	default_shade_color = 'black',
	default_outline_color = 'green',
	use_xft = true,
	override_utf8_locale =true,
	use_spacer = 'none',
	cpu_avg_samples = 2,
	net_avg_samples = 1,
	uppercase = false,
	gap_x = 3325,
	gap_y = 725,
	minimum_height = 300,
  	minimum_width = 800,

-- window
	own_window = true,
	own_window_class = 'Conky',
	own_window_type = 'desktop',
	own_window_transparent = true,
	draw_shades = false,
	draw_outline = false,
	draw_borders = false,
	draw_graph_borders = false,

-- font
	font = '123:size=10',

-- lua
	--lua_load = '~/.conky/kims/temp_boxes.lua',
	--lua_draw_hook_post = 'conky_main',
	
}


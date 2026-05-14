--[[ My Conky main file ]]

conky.config = {--configuration

-- common
	alignment = 'top_left',
	background = true,
	double_buffer = true,
	update_interval = 0.25,
	default_color = 'white',
	default_shade_color = 'black',
	default_outline_color = 'green',
	override_utf8_locale =true,
	use_spacer = 'none',
	cpu_avg_samples = 2,
	net_avg_samples = 2,
	uppercase = false,
	gap_x = 3400,
	gap_y = 0,
	minimum_height = 300,
	minimum_width = 800,

-- window
	own_window = true,
	own_window_class = 'Conky',
	own_window_type = 'desktop',
	own_window_transparent = true,
	own_window_argb_visual = true,
	draw_shades = false,
	draw_outline = false,
	draw_borders = false,
	draw_graph_borders = false,

-- font
	use_xft = true,
	font = 'Ubuntu:size=10',

-- lua
	lua_load = '~/.config/conky/lua/temp_boxes.lua',
	lua_draw_hook_pre = 'main',
	--lua_startup_hook = '',
};

time = ''
.. '${voffset 0}'
.. '${offset 10}'
.. '${color 999999}'
.. '${font GE Inspira:pixelsize=96}'
.. '${time %l:%M}'
.. '${font GE Inspira:pixelsize=16}'
.. '${time %p}'
.. '\n'

date = ''
.. '${voffset 0}'
.. '${offset 240}'
.. '${color 00AA00}'
.. '${font GE Inspira:pixelsize=40}'
.. '${alignc}'
.. '${time %d}'
.. '${voffset -10}'
.. '${offset 20}'
.. '${color 999999}'
.. '${font GE Inspira:pixelsize=22}'
.. '${alignc}'
.. '${time %B} '
.. '${time %Y}'
.. '${voffset 25}'
.. '${font GE Inspira:pixelsize=28}'
.. '${offset -120}'
.. '${alignc}'
.. '${time %A}'
.. '\n'

filesystem = ''
.. '${voffset 0}'
.. '${offset 12}'
.. '${font GE Inspira:pixelsize=18}'
.. '${color 999999}'
.. 'HD '
.. '${offset 9}'
.. '${color 00AA00}'
.. '${fs_free /} / ${fs_size /}'

ram = ''
.. '${voffset 130}'
.. '${offset 20}'
.. '${color 999999}'
.. 'RAM '
.. '${offset 9}'
.. '${color 00AA00}'
.. '$mem / $memmax'

cpu = ''
.. '${voffset 130}'
.. '${offset 20}'
.. '${color 999999}'
.. 'CPU '
.. '${offset 9}'
.. '${color 00AA00}'
.. '${cpu cpu0}%'
.. '\n'

ctemp = ''
.. '${voffset 170}'
.. '${offset 20}'
.. '${color 999900}'
.. 'TEMP '
.. '${offset 9}'
.. '${color 00AA00}'
.. '${hwmon 4 temp 1}°'

conky.text = ''
--.. time
--.. date
--.. filesystem
--.. ram
--.. cpu

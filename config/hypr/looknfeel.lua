-- Change the default Omarchy look'n'feel.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
 hl.config({
   cursor = { 
     warp_on_change_workspace = 1,
   },

   general = {
     gaps_in = 3,
     gaps_out = 10,
     border_size = 1,
     resize_on_border = false,
     allow_tearing = false,
   },

   decoration = {
     rounding = 8, -- Use round window corners.,
     dim_inactive = true, -- Dim unfocused windows (0.0 = no dim, 1.0 = fully dimmed).
     dim_strength = 0.15,
   },

   animations = {
     enabled = true, -- Disable all animations.
   },

 })

-- Opt another application in to Omarchy's standard transparency.
-- Find its class with: hyprctl clients
-- o.transparent_window("my-app")
 o.transparent_window("com.mitchellh.ghostty", "0.99 0.5") -- Custom active/inactive opacity.

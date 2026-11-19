-- Window rules for Ghostty terminal.
hl.window_rule({
  match = { class = "com.mitchellh.ghostty" },
  opacity = "0.99 0.50",
--  float = true,
--  center = true,
--  size = { 1000, 1000 }
})

-- Window rule for X web-app.
o.window({ class = "^chrome-x\\.com__-Default$" }, {
  float = true,
  size = { 1000, 1000 },
  center = true,
})

-- Window rule for Omacut.
hl.window_rule({
  match = { class = "omacut" },
--  workspace = 3,
  no_dim = true,
  float = false,
  opacity = "1 1",
})

-- Window rule for FreeCAD.
hl.window_rule({
  match = { class = "org.freecad.FreeCAD" },
  workspace = 14
})

-- Window rule for vlc.
hl.window_rule({
  match = { class = "vlc" },
  workspace = 13,
  no_dim = true,
  float = false,
  opacity = "1 1",
})

-- Window rule for Shotwell.
hl.window_rule({
  match = { class = "org.gnome.Shotwell" },
  float = false,
  workspace = 13
})

-- Window rule for mpv.
hl.window_rule({
  match = { class = "mpv" },
  no_dim = true,
--  workspace = 13,
  opacity = "1 1",
})

-- Window rule for gimp.
hl.window_rule({
  name = "gimp-no-transparency",
  match = { class = "^[Gg]imp.*" },
  opacity = "1.0 override 1.0 override",
  no_dim = true,
  workspace = 14
})

-- Window rule for Steam.
hl.window_rule({
  match = { class = "steam" },
  no_dim = true,
  float = false,
  workspace = 15
})

-- Window rule for zen browser.
hl.window_rule({
  match = { class = "zen" },
  no_dim = true,
  float = false,
  opacity = "1 1",
})

-- Window rule for default opacity.
o.window({ tag = "default-opacity" }, { opacity = "1.0 0.96" })

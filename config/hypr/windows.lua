hl.window_rule({
  match = { class = "com.mitchellh.ghostty" },
  float = true,
  center = true,
  size = { 1000, 1000 }
})
hl.window_rule({
  match = { class = "omacut" },
--  workspace = 3,
  no_dim = true,
  float = false,
  opacity = "1 1",
})
hl.window_rule({
  match = { class = "org.freecad.FreeCAD" },
  workspace = 4
})
hl.window_rule({
  match = { class = "vlc" },
  workspace = 3,
  no_dim = true,
  float = false,
  opacity = "1 1",
})
hl.window_rule({
  match = { class = "org.gnome.Shotwell" },
  float = false,
  workspace = 3
})
hl.window_rule({
  match = { class = "mpv" },
  no_dim = true,
  workspace = 3,
  opacity = "1 1",
})
hl.window_rule({
  name = "gimp-no-transparency",
  match = { class = "^[Gg]imp.*" },
  opacity = "1.0 override 1.0 override",
  no_dim = true,
  workspace = 4
})
hl.window_rule({
  match = { class = "steam" },
  no_dim = true,
  float = false,
  workspace = 7
})
hl.window_rule({
  match = { class = "zen" },
  no_dim = true,
  float = false,
  opacity = "1 1",
})
o.window({ tag = "default-opacity" }, { opacity = "1.0 0.96" })

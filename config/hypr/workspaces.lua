--[[ PROPS
r[A-B] - ID range from A to B inclusive
s[bool] - Whether the workspace is special or not
n[bool], n[s:string], n[e:string] - named actions. n[bool] -> whether a workspace is a named workspace, s and e are starts and ends with respectively
m[monitor] - Monitor selector
w[(flags)A-B], w[(flags)X] - Prop for window counts on the workspace. A-B is an inclusive range, X is a specific number. Flags can be omitted. It can be t for tiled-only, f for floating-only, g to count groups instead of windows, v to count only visible windows, and p to count only pinned windows.
f[-1], f[0], f[1], f[2] - fullscreen state of the workspace. -1: no fullscreen, 0: fullscreen, 1: maximized, 2, fullscreen without fullscreen state sent to the window.
]]
--
hl.workspace_rule({
  workspace = "r[11-20]",
  layout = "scrolling",
})
hl.workspace_rule({
  workspace = "r[2-10]",
  layout = "scrolling",
  layout_opts = {
    direction = "down",
  },
})
hl.workspace_rule({
  workspace = "r[1]",
  layout = "floating",
})

hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 5, gaps_in = 3 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 5, gaps_in = 3 })

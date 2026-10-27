return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = false,          -- show filtered items by default
        hide_dotfiles = true,   -- don't hide dotfiles
        hide_gitignored = false,  -- still hide gitignored (optional)
        never_show = { ".git" }, -- always hide these
      },
    },
  },
}

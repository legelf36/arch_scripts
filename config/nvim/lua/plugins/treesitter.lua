    return {
      'nvim-treesitter/nvim-treesitter',
        --lazy = false,
        --build = ':TSUpdate'
        opts = {
          ensure_installed = {
            "bash",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "tsx",
            "typescript",
            "vim",
            "yaml",
          },
          highlight = {enable = true },
          indent = { enable = true },
        },
    }
    require('nvim-treesitter').setup {
        -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
        install_dir = vim.fn.stdpath('data') .. '/site'
    }

    vim.api.nvim_create_autocmd('FileType', {
        pattern = { '<filetype>' },
        callback = function() vim.treesitter.start() end,
    })

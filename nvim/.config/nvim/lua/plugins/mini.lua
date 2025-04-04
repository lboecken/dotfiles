return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
    local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
    local lsp = MiniStatusline.section_lsp { trunc_width = 75 }
    local filename = MiniStatusline.section_filename { trunc_width = 140 }
    local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
    local location = MiniStatusline.section_location { trunc_width = 75 }
    local search = MiniStatusline.section_searchcount { trunc_width = 75 }

    local active_line = MiniStatusline.combine_groups {
      { hl = mode_hl, strings = { mode } },
      { hl = 'MiniStatuslineDevinfo', strings = { lsp } },
      '%<', -- Mark general truncate point
      { hl = 'MiniStatuslineFilename', strings = { filename } },
      '%=', -- End left alignment
      { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
      { hl = mode_hl, strings = { search, location } },
    }

    local inactive_line = MiniStatusline.combine_groups {
      { hl = 'MiniStatuslineDevinfo', strings = { lsp } },
      '%<', -- Mark general truncate point
      { hl = 'MiniStatuslineFilename', strings = { filename } },
      '%=', -- End left alignment
    }
    statusline.setup {
      content = {
        active = function()
          return active_line
        end,
        inactive = function()
          return inactive_line
        end,
      },
    }

    -- Autopair
    require('mini.pairs').setup()

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}

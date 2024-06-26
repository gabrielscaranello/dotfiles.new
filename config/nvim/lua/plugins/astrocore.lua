local make_mappings = function()
  local astrocore = require "astrocore"
  local buffer = require "astrocore.buffer"

  local mappings = {
    n = {
      [";"] = { ":", desc = "Call :", silent = false },
      ["<leader><space>"] = { "<cmd>noh<cr>", desc = "No highlight" },
      ["L"] = {
        function() buffer.nav(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Next buffer",
      },
      ["H"] = {
        function() buffer.nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        desc = "Previous buffer",
      },
      ["<leader>lk"] = { "<cmd>LspRestart<cr>", desc = "Restart LSP" },
      ["<leader>gD"] = { "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
      ["<leader>gx"] = { "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    },
    v = {
      [";"] = { ":", desc = "Call :", silent = false },
    },
    t = {},
    i = {},
  }

  if vim.fn.executable "lazydocker" == 1 then
    mappings.n["<leader>td"] = { function() astrocore.toggle_term_cmd "lazydocker" end, desc = "ToggleTerm lazydocker" }
  end

  return mappings
end

---@type LazySpec
return {
  "AstroNvim/astrocore",
  tag = "stable",
  pin = true,

  ---@type AstroCoreOpts
  opts = {
    diagnostics = {
      virtual_text = false,
      underline = true,
      signs = false,
    },

    mappings = make_mappings(),

    features = {
      autopairs = true,
      cmp = true,
      diagnostics_mode = 2,
      notifications = true,
    },

    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "auto",
        wrap = true,
        cursorline = true,
        clipboard = "unnamedplus",
      },

      g = {
        loaded_perl_provider = 0,
        loaded_python3_provider = 0,
        loaded_ruby_provider = 0,
      },
    },
  },
}

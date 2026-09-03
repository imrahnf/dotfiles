-- Themes must NOT be lazy-loaded, or they won't appear in
-- :colorscheme / Telescope completion (not on the runtimepath yet).
--
-- Switching:  :Telescope colorscheme  or  :colorscheme NAME
-- Persistence: ColorScheme autocmd writes stdpath("state")/colorscheme
-- Fallback:    catppuccin when the state file is missing or empty

local function preferred_colorscheme()
  local path = vim.fn.stdpath("state") .. "/colorscheme"
  if vim.fn.filereadable(path) == 1 then
    local name = (vim.fn.readfile(path)[1] or ""):gsub("%s+", "")
    if name ~= "" then
      return name
    end
  end
  return "catppuccin"
end

-- Register early (this file loads during lazy.setup) so switches always persist.
-- Not in autocmds.lua: those load on VeryLazy and can miss the event.
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("user_colorscheme_persist", { clear = true }),
  callback = function(ev)
    if type(ev.match) == "string" and ev.match ~= "" then
      pcall(vim.fn.writefile, { ev.match }, vim.fn.stdpath("state") .. "/colorscheme")
    end
  end,
})

return {
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
  {
    "Mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.adwaita_darker = true
    end,
  },
  { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
  { "kepano/flexoki-neovim", name = "flexoki", lazy = false, priority = 1000 },
  { "scottmckendry/cyberdream.nvim", lazy = false, priority = 1000 },
  { "vague-theme/vague.nvim", lazy = false, priority = 1000 },

  {
    "LazyVim/LazyVim",
    opts = {
      -- Examples: "catppuccin" | "catppuccin-mocha" | "kanagawa" | "cyberdream" | "vague" | "flexoki-dark" | "adwaita"
      colorscheme = preferred_colorscheme(),
    },
  },
}

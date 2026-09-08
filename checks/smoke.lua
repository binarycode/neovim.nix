-- Headless assertions about the built configuration.
--
-- Run by `nix flake check` (see flake.nix) as:
--     nvim --headless -c 'luafile checks/smoke.lua'
--
-- Note: `nvim -l script.lua` will NOT work here, because -l skips the user
-- config entirely -- there would be nothing to assert against.

local failures = 0

local function check(name, ok, detail)
  if ok then
    io.stdout:write(("ok   %s"):format(name), "\n")
  else
    failures = failures + 1
    io.stdout:write(("FAIL %s%s"):format(name, detail and (" -- " .. tostring(detail)) or ""), "\n")
  end
end

local function check_ok(name, fn)
  local ok, err = pcall(fn)
  check(name, ok, err)
  return ok
end

--- Startup hygiene -----------------------------------------------------------

check("startup: v:errmsg is empty", vim.v.errmsg == "", vim.v.errmsg)

local messages = vim.api.nvim_exec2("messages", { output = true }).output
check("startup: no errors in :messages", not messages:match("E%d+:"), messages)

--- Plugins -------------------------------------------------------------------

-- Every plugin the config `packadd`s must be loadable and its main Lua module
-- must resolve. A rename or a removed module upstream fails here.
local modules = {
  "cmp",
  "cmp_luasnip",
  "diffview",
  "flash",
  "fzf-lua",
  "gitsigns",
  "hlchunk",
  "lualine",
  "mini.basics",
  "mini.clue",
  "mini.cursorword",
  "mini.pairs",
  "mini.surround",
  "mini.trailspace",
  "monokai-nightasty",
  "neogit",
  "neoscroll",
  "noice",
  "notify",
  "nui.popup",
  "nvim-treesitter",
  "oil",
  "luasnip",
}

for _, module in ipairs(modules) do
  check_ok("module: " .. module, function()
    require(module)
  end)
end

check("colorscheme is applied", vim.g.colors_name ~= nil, vim.g.colors_name)

--- LSP -----------------------------------------------------------------------

-- `vim.lsp.enable` is lazy: a server name that nvim-lspconfig no longer ships
-- stays silent until a matching file is opened. Resolve the configs eagerly.
for _, server in ipairs(vim.tbl_keys(vim.lsp._enabled_configs or {})) do
  local config = vim.lsp.config[server]
  check("lsp: " .. server .. " has a config", config ~= nil and config.cmd ~= nil)
end

--- Treesitter ----------------------------------------------------------------

check("treesitter: grammars are on the runtimepath", #vim.api.nvim_get_runtime_file("parser/*.so", true) > 0)

-- Highlighting and indentation are wired up per-filetype by an autocmd, so
-- assert on a real buffer rather than on the plugin's internals.
for _, filetype in ipairs({ "bash", "go", "json", "lua", "markdown", "nix", "python", "rust", "toml", "yaml" }) do
  local buffer = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_option_value("filetype", filetype, { buf = buffer })

  local highlighter = vim.treesitter.highlighter.active[buffer]
  check("treesitter: highlighting for " .. filetype, highlighter ~= nil)

  if highlighter then
    local language = highlighter.tree:lang()
    check("treesitter: highlights query for " .. language, vim.treesitter.query.get(language, "highlights") ~= nil)

    if vim.treesitter.query.get(language, "indents") then
      check(
        "treesitter: indentexpr for " .. filetype,
        vim.bo[buffer].indentexpr:find("nvim%-treesitter") ~= nil,
        vim.bo[buffer].indentexpr
      )
    end
  end

  vim.api.nvim_buf_delete(buffer, { force = true })
end

--- Keymaps -------------------------------------------------------------------

local function has_keymap(mode, lhs)
  lhs = vim.keycode(lhs)
  for _, keymap in ipairs(vim.api.nvim_get_keymap(mode)) do
    if vim.keycode(keymap.lhs) == lhs then
      return true
    end
  end
  return false
end

for _, keymap in ipairs({ { "n", "<Esc>" }, { "n", "<C-j>" }, { "n", "<C-k>" } }) do
  check(("keymap: %s %s"):format(keymap[1], keymap[2]), has_keymap(keymap[1], keymap[2]))
end

--- Result --------------------------------------------------------------------

if failures > 0 then
  io.stdout:write(("\n%d check(s) failed"):format(failures), "\n")
  vim.cmd("cquit 1")
end

io.stdout:write("\nall checks passed", "\n")
vim.cmd("quitall!")

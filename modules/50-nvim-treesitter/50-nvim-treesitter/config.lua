if not vim.g.vscode then
  vim.cmd.packadd("nvim-treesitter")

  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("nvim-treesitter", { clear = true }),
    desc = "Enable treesitter highlighting and indentation",
    callback = function(event)
      local lang = vim.treesitter.language.get_lang(event.match)

      if not lang or not vim.treesitter.language.add(lang) then
        return
      end

      vim.treesitter.start(event.buf, lang)

      if vim.treesitter.query.get(lang, "indents") then
        vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end,
  })
end

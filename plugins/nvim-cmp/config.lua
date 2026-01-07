if not vim.g.vscode then
  vim.cmd.packadd("nvim-cmp")
  vim.cmd.packadd("cmp-nvim-lsp")
  vim.cmd.packadd("cmp-buffer")
  vim.cmd.packadd("cmp-path")

  local plugin = require("cmp")

  plugin.setup({
    sources = plugin.config.sources({
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
    }),
    mapping = plugin.mapping.preset.insert({
      ["<C-b>"] = plugin.mapping.scroll_docs(-4),
      ["<C-f>"] = plugin.mapping.scroll_docs(4),
      ["<C-Space>"] = plugin.mapping.complete(),
      ["<C-e>"] = plugin.mapping.abort(),
      ["<CR>"] = plugin.mapping.confirm({ select = true }),
      ["<Tab>"] = plugin.mapping(function(fallback)
        if plugin.visible() then
          plugin.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = plugin.mapping(function(fallback)
        if plugin.visible() then
          plugin.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
  })
end

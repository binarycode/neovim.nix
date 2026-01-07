do
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.yaml", "*.yml", "*.tpl" },
    callback = function()
      -- Check for common Helm patterns
      if vim.fn.search("{{.\\+}}", "nw") > 0 then
        vim.bo.filetype = "helm"
      end
    end,
  })
end

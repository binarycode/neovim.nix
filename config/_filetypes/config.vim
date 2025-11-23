autocmd FileType go setlocal noexpandtab
autocmd FileType go setlocal shiftwidth=4
autocmd FileType go setlocal tabstop=4

lua << EOF
  vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.yaml", "*.yml", "*.tpl"},
    callback = function()
      -- Check for common Helm patterns
      if vim.fn.search("{{.\\+}}", "nw") > 0 then
        vim.bo.filetype = "helm"
      end
    end
  })
EOF

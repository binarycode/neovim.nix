do
  vim.g.ale_lint_on_text_changed = 0
  vim.g.ale_lint_on_insert_leave = 0

  vim.g.ale_sign_error = " !"
  vim.g.ale_sign_warning = " *"

  vim.g.ale_linters = {
    vue = { "eslint" }, -- skip vetur/vls
  }
end

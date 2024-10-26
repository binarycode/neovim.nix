let g:ale_lint_on_text_changed=0
let g:ale_lint_on_insert_leave=0

let g:ale_sign_error=' !'
let g:ale_sign_warning=' *'

" skip vetur/vls
let g:ale_linters = {'vue': ['eslint']}

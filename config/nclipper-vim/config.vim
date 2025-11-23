function! s:nclipper()
  if visualmode() !=# 'V'
    echoerr 'use V'
    return
  endif
  let [begin, end] = [getpos("'<")[1], getpos("'>")[1]]
  let max_len = len(line('$'))
  let value = join(map(getline(begin, end), g:nclipper_format), "\n")
  call setreg('+', value, "V")
endfunction

vnoremap <silent> <Plug>(nclipper) :<C-u>call <SID>nclipper()<Cr>
silent! vmap <unique> <Leader>y <Plug>(nclipper)

let g:nclipper_format = 'printf("%" . max_len . "d %s", v:key + begin, v:val)'

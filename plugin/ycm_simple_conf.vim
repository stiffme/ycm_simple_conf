function! s:set_ycm_simple_conf_abs_script()
    if ! has("python")
        return
    endif
    python << EOF
import vim
import os
try:
    ret = ''
    main_dir = vim.eval('s:ycm_simple_conf_dir')
    script_dir = vim.eval('s:ycm_simple_conf_script_dir')
    script = vim.eval('s:ycm_simple_conf_script')
    ret = os.path.join(main_dir, os.path.join(script_dir, script))
except Exception as e:
    pass
vim.command('let s:ycm_simple_conf_abs_script = \"' + ret + '\"')
EOF
endfunction

let g:ycm_simple_conf_active =
      \ get(g:, "g:ycm_simple_conf_active", 1)

let s:ycm_simple_conf_dir = expand("<sfile>:p:h:h")
let s:ycm_simple_conf_script_dir = "python"
let s:ycm_simple_conf_script= "ycm_simple_conf.py"

if g:ycm_simple_conf_active
    call s:set_ycm_simple_conf_abs_script()
    if exists("s:ycm_simple_conf_abs_script")
        let g:ycm_global_ycm_extra_conf = s:ycm_simple_conf_abs_script
    endif
endif

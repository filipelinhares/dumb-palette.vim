if v:version < 700 || exists('loaded_dumb') || !exists('dumb_commands') || &cp
  finish
endif

let loaded_dumb = 1
let s:input_string = []
let s:matched = []
let s:alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',]

function! PopupCallback(id, result) 
  let current = a:result - 1

  if current < 0
    return
  endif

  if (len(s:matched) == 0)
    let s:matched = copy(g:dumb_commands)
  endif

  if has_key(s:matched[current], 'func')
    let FuncRef = funcref(s:matched[current].func)
    call FuncRef(a:result)
  endif

  if has_key(s:matched[current], 'command')
    execute(s:matched[current].command)
  endif

  let s:matched = copy(g:dumb_commands)
  let s:input_string = ['']

endfunction

function! InputFilter(id, key)
  if index(s:alphabet, a:key) >= 0
    call add(s:input_string, a:key)
    let s:matched =  matchfuzzy(g:dumb_commands, join(s:input_string, ''), {'key': 'text'})
    echo join(s:input_string, '')
    call popup_settext(a:id, s:matched)
  elseif a:key == "\<bs>"
    let s:input_string = ['']
    echo join(s:input_string)
    call popup_settext(a:id, g:dumb_commands)
  endif

  return popup_filter_menu(a:id, a:key)
endfunction

function! s:PopupOpen()
  let winid = popup_menu(g:dumb_commands, #{ close: 'button', mousemoved: 'word', fixed: 1, maxwidth: 550, maxheight: 20, callback: 'PopupCallback', filter: 'InputFilter'})
endfunction

function! PopupClose()
  call popup_clear()
endfunction

command! -bang -complete=buffer -nargs=0 DumbOpen call <SID>PopupOpen()
command! -bang -complete=buffer -nargs=0 DumbClose call <SID>PopupClose()

if exists ("g:dumb_no_maps") &&  g:dumb_no_maps
  "do nothing
elseif exists ("g:no_plugin_maps") &&  g:no_plugin_maps
  "do nothing
else
  nnoremap <leader>o :call <SID>PopupOpen()<CR>
endif



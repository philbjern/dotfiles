lua <<EOF
require('archloner')

require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<C-t>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt", "NvimTree"},
  log_file_path = nil, -- absolute path to Tabnine log file
})
EOF

set clipboard=unnamed

"
" Vim Airline powerline status bar settings
"
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" theme
let g:airline_theme='dark'
" dark, simple, tomorrow, base16
"
" solarized dark theme
" let g:airline_theme='solarized'

nnoremap <leader>q q

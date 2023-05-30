vim.keymap.set("n", "<leader>pt", vim.cmd.NERDTreeToggle)



-- Start NERDTree when Vim is started without file arguments.
vim.cmd [[ autocmd StdinReadPre * let s:std_in=1 ]]
vim.cmd [[ autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif ]]

-- Exit Vim if NERDTree is the only window remaining in the only tab.
vim.cmd [[ autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif ]]
vim.cmd [[ let g:NERDTreeQuitOnOpen = 1 ]]

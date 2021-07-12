-- Remove all trailing whitespace on save
vim.api.nvim_exec(
  [[
  augroup Formatting
    au!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup END
  ]],
  false
)
-- Prevent new line to also start with a comment
vim.api.nvim_exec(
  [[
  augroup Commenting
    au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  augroup END
  ]],
  false
)
--       autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry

vim.api.nvim_exec(
  [[
    augroup fmt
      autocmd!
      autocmd BufWritePre * undojoin | Neoformat
    augroup END
  ]],
  false
)

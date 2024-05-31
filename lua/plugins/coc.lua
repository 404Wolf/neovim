vim.g.coc_global_extensions = {
  'coc-json',
  'coc-pyright',
  'coc-tsserver',
  'coc-julia',
  'coc-texlab',
  'coc-sumneko-lua',
  '@yaegassy/coc-black-formatter',
}
vim.cmd(":CocCommand black-formatter.installServer")

-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set

-- Autocomplete
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")

-- Use <c-space> to trigger completion
keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "gt", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "gr", "<Plug>(coc-references)", { silent = true })


-- Use K to show documentation in preview window
function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- Symbol renaming
keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })


-- Formatting selected code
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
keyset("n", "<Leader>pp", ":Format<CR>", { silent = true })

-- Apply codeAction to the selected region
-- Example: `<leader>aap` for current paragraph
local opts = { silent = true, nowait = true }
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Remap keys for apply code actions at the cursor position.
keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
-- Remap keys for apply source code actions for current file.
keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
-- Apply the most preferred quickfix action on the current line.
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- Remap keys for apply refactor code actions.
keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

-- Run the Code Lens actions on the current line
keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)

-- Remap <C-d> and <C-u> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true, expr = true }
keyset("n", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(0.5) : "<C-f>"', opts)
keyset("n", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keyset("i", "<C-d>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keyset("i", "<C-u>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(0.5) : "<C-f>"', opts)
keyset("v", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true }
-- Show all diagnostics
keyset("n", "\\a", ":CocList diagnostics<cr>", opts)
-- Manage extensions
keyset("n", "\\e", ":CocList extensions<cr>", opts)
-- Show commands
keyset("n", "\\c", ":CocList commands<cr>", opts)
-- Find symbol of current document
keyset("n", "\\o", ":CocList outline<cr>", opts)
-- Search work symbols
keyset("n", "\\s", ":CocList -I symbols<cr>", opts)
-- Do default action for next item
keyset("n", "\\j", ":CocNext<cr>", opts)
-- Do default action for previous item
keyset("n", "\\k", ":CocPrev<cr>", opts)
-- Resume latest coc list
keyset("n", "\\p", ":>CocListResume<cr>", opts)

-- 📂lua/🌑maps.lua

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local status, telescope = pcall(require, "telescope.builtin")
if status then
    -- Telescope
    map("n", "<leader>ff", telescope.find_files)
    map("n", "<leader>fg", telescope.live_grep)
    map("n", "<leader>fb", telescope.buffers)
    map("n", "<leader>fh", telescope.help_tags)
    map("n", "<leader>fs", telescope.git_status)
    map("n", "<leader>fc", telescope.git_commits)
else
    print("Telescope not found")
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- Windows
map("n", "<leader>vp", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>o", "<CMD>Neotree focus<CR>")

-- Buffer
map("n", "<TAB>", "<CMD>bnext<CR>")
map("n", "<S-TAB>", "<CMD>bprevious<CR>")

-- Terminal
map("n", "<leader>th", "<CMD>ToggleTerm size=10 direction=horizontal<CR>")
map("n", "<leader>tv", "<CMD>ToggleTerm size=80 direction=vertical<CR>")

-- Markdown Preview
map("n", "<leader>m", "<CMD>MarkdownPreview<CR>")
map("n", "<leader>mn", "<CMD>MarkdownPreviewStop<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")
--[[ tab bar ]]

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>')
map('n', '<A-.>', '<Cmd>BufferNext<CR>')
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>')
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>')
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>')
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>')
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>')
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>')
map('n', '<A-0>', '<Cmd>BufferLast<CR>')
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>')
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>')
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>')
-- Git Actions
local gitsigns = require("gitsigns")
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)
    map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hu', gitsigns.undo_stage_hunk)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>hd', gitsigns.diffthis)
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
    map('n', '<leader>td', gitsigns.toggle_deleted)
-- Sort automatically by...
map('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>')
map('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>')
map('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>')
map('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>')



 -- Displays hover information about the symbol under the cursor
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

-- Jump to the definition
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

-- Jump to declaration
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

-- Lists all the implementations for the symbol under the cursor
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

-- Jumps to the definition of the type symbol
map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

-- Lists all the references 
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

-- Displays a function's signature information
map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

-- Renames all references to the symbol under the cursor
map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

-- Selects a code action available at the current cursor position
map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
map('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

-- Show diagnostics in a floating window
map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

-- Move to the previous diagnostic
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

-- Move to the next diagnostic
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
-- Rust mapping
--
map('n', '<leader>rd', function ()
  vim.cmd.RustLsp('debug')
end)

map('n', '<leader>rdd', function ()
 vim.cmd.RustLsp('debuggables')
end)

map('n', '<leader>rr', function ()
  vim.cmd.RustLsp('run')
end)

map('n', '<leader>rrr', function ()
 vim.cmd.RustLsp('runnables')
end)
map('n', '<leader>rh', function ()
 vim.cmd.RustLsp { 'hover', 'actions' }
end)


-- debugger
map('n', '<F5>', ':DapContinue<cr>')
map('n', '<F10>', ':DapStepOver<cr>')
map('n', '<F12>', ':DapStepInto<cr>')
map('n', '<S-F12>', ':DapStepOut<cr>')
map('n', '<Leader>b', ':DapToggleBreakpoint<cr>')
map('n', '<Leader>B', function() require('dap').set_breakpoint() end)
map('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
map('n', '<Leader>dr', function() require('dap').repl.open() end)
map('n', '<Leader>dl', function() require('dap').run_last() end)
map({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
map({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
map('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
map('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)


-- Set encoding to UTF-8
vim.opt.encoding = "utf-8"

-- Enable line numbers
vim.opt.number = true

-- Enable syntax highlighting
vim.cmd("syntax enable")

-- Use the system clipboard for copy/paste operations
vim.opt.clipboard:append("unnamedplus")

-- Keep 8 lines visible above and below the cursor when scrolling
vim.opt.scrolloff = 8

-- Allow backspacing over indentation, end of line, and start of insert
vim.opt.backspace = { "indent", "eol", "start" }

-- Set the color column at column 80
vim.opt.colorcolumn = "80"

-- Make max width of line 80 columns
vim.opt.textwidth = 80

-- Set tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Enable line wrapping and break lines at word boundaries
vim.opt.wrap = true
vim.opt.linebreak = true

-- Convert tabs to spaces
vim.opt.expandtab = true

-- Enable automatic indentation
vim.opt.autoindent = true

-- Set the file format to Unix (LF line endings)
vim.opt.fileformat = "unix"

-- Enable 24-bit RGB color in the terminal
vim.opt.termguicolors = true


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'folke/tokyonight.nvim',
    	'christoomey/vim-tmux-navigator',
        -- add your plugins here
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "tokyonight-night" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

vim.cmd[[colorscheme tokyonight-night]]


-- Keybinds
vim.keymap.set('n', '<leader>]', '<cmd>bn<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>[', '<cmd>bp<CR>', { noremap = true, silent = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

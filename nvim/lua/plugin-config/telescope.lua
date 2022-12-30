local actions = require('telescope.actions')
require('telescope').setup({
	defaults = {
		file_ignore_patterns = { '%.csv', '%.txt', '%.xml' },
		mappings = {
			i = {
				['<C-p>'] = require('telescope.actions.layout').toggle_preview,
				['<esc>'] = actions.close,
			},
		},
		preview = {
			hide_on_startup = true, -- hide previewer when picker starts
		},
	},
	pickers = {
		find_files = {
			mappings = {
				n = {
					-- ["cd"] = function(prompt_bufnr)
					-- 	local selection = require("telescope.actions.state").get_selected_entry()
					-- 	local dir = vim.fn.fnamemodify(selection.path, ":p:h")
					-- 	require("telescope.actions").close(prompt_bufnr)
					-- 	-- Depending on what you want put `cd`, `lcd`, `tcd`
					-- 	vim.cmd(string.format("silent lcd %s", dir))
					-- end,
				},
			},
		},
	},
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('neoclip')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>fc', builtin.command_history, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

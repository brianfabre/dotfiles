local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "%.csv", "%.txt", "%.xml" },
		mappings = {
			i = {
				["<C-p>"] = require("telescope.actions.layout").toggle_preview,
				["<esc>"] = actions.close,
			},
		},
		preview = {
			hide_on_startup = true, -- hide previewer when picker starts
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("neoclip")

-- mappings
local ts = {
	builtin = require("telescope.builtin"),
	grep_fuzzy = function()
		require("telescope.builtin").grep_string({
			prompt_title = "Fuzzy Find",
			shorten_path = true,
			word_match = "-w",
			only_sort_text = true,
			search = "",
		})
	end,
}

vim.keymap.set("n", "<leader>fg", ts.grep_fuzzy, {})
vim.keymap.set("n", "<leader>ff", ts.builtin.find_files, {})
vim.keymap.set("n", "<leader>fb", ts.builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "<leader>fc", ts.builtin.command_history, {})
vim.keymap.set("n", "<leader>fh", ts.builtin.help_tags, {})
vim.keymap.set("n", "<leader>fv", ts.builtin.buffers, {})
vim.keymap.set("n", "<leader>fm", ts.builtin.marks, {})

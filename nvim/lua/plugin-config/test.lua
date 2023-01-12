local M = {}

M.close_floats = function()
	-- removes any stuck floating window
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local config = vim.api.nvim_win_get_config(win)
		if config.relative ~= "" then
			vim.api.nvim_win_close(win, false)
			print("Closing window", win)
		end
	end
end

return M

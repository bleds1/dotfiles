vim.api.nvim_create_user_command("ToggleDiagnostics", function()
	if vim.g.diagnostics_enabled == nil then
		vim.g.diagnostics_enabled = false
	elseif vim.g.diagnostics_enabled then
		vim.g.diagnostics_enabled = false
	else
		vim.g.diagnostics_enabled = true
		vim.diagnostic.enable()
	end
end, {})

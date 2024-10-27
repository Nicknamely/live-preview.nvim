--- Returns the metadata of live-preview.nvim as a table.
---@return table|nil
local function spec()
	local read_file = require("livepreview.utils").uv_read_file
	local get_plugin_path = require("livepreview.utils").get_plugin_path

	local path_to_packspe = vim.fs.joinpath(get_plugin_path(), "pkg.json")
	local body = read_file(path_to_packspe)
	if not body then
		return nil
	end
	return vim.json.decode(body)
end

return spec

local function loadEnvFile(filePath)
	local file = io.open(filePath, "r")
	if not file then
		error("Failed to open file: " .. filePath)
	end

	for line in file:lines() do
		-- Skip empty lines and comments
		if line:match("^%s*$") or line:match("^#") then
			goto continue
		end

		-- Split the line into key and value
		local key, value = line:match("^(.-)=(.*)$")
		if key and value then
			-- Set the environment variable
			vim.fn.setenv(key, value)
		end

		::continue::
	end

	file:close()
end

loadEnvFile(vim.fn.stdpath("config") .. "/.env")

require("config.mappings")
require("config.lazy")
require("config.options")

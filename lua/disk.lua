disk = {}

function dump (object)
	if type(object) == "table" then
		local code = "{ "
		for key, value in pairs(object) do
			if type(key) ~= "number" then key = '"' .. key .. '"' end
			code = code .. "[" .. key .. "] " .. dump(value) .. ","
		end
		return code .. "} "
	else
		return tostring(object)
	end
end

disk.load = function ()
	print("disk.load()")

	local saveFileInfo = love.filesystem.getInfo(SAVE_FILE)
	if saveFileInfo ~= nil then
		gameData.values = require(SAVE_FILE)
		print("file loaded: " .. SAVE_FILE)
	else
		print("file does not exist: " .. SAVE_FILE)
	end
end

disk.save = function ()
	print("disk.save()")

	local file, newFileError = love.filesystem.newFile(SAVE_FILE)
	file:open("w")
	local writeSuccess, writeError = file:write(dump(gameData.values))
	file:close()

	if writeSuccess then
		print("write success")
	else
		print("write error: " .. writeError)
	end

	-- local file = love.filesystem.newFile(SAVE_FILE)
	-- local opened, openError = file:open("w")
	-- if opened then
	-- 	print("opened")
	-- else
	-- 	print("NOT opened: " .. openError)
	-- end

	-- local success, error = file:write(dump(gameData.values))
	-- file:close()

	-- if success then
	-- 	print("success")
	-- else
	-- 	print("error: " .. error)
	-- end
end

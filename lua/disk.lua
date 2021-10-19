require("lua/TSerial")

disk = {}

disk.load = function ()
	print("disk.load(" .. SAVE_FILE .. ") ...")

	local saveFileInfo = love.filesystem.getInfo(SAVE_FILE)
	if saveFileInfo == nil then
		print("- file does not exist")
	else
		print("+ file exists, loading ...")
		local ok, chunk, result
		ok, chunk = pcall(love.filesystem.load, SAVE_FILE)
		if ok then
			print("+ file loaded, executing chunk ...")
			ok, result = pcall(chunk)
			if ok then
				print("+ chunk executed: " .. tostring(result))
				gameData.values = chunk()
			else
				print("-chunk execute error: " .. tostring(result))
			end
		else
			print("- filesystem.load failed: " .. tostring(chunk))
		end
	end
end

disk.save = function ()
	print("disk.save() ...")

	local file, newFileError = love.filesystem.newFile(SAVE_FILE)
	file:open("w")
	local fileContents = "return " .. TSerial.pack(gameData.values)
	local writeSuccess, writeError = file:write(fileContents)
	file:close()

	if writeSuccess then
		print("+ write success")
	else
		print("- write error: " .. writeError)
	end
end

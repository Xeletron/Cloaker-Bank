Hooks:Add('NetworkReceivedData', 'NetworkReceivedData_CLK', function(sender, messageType, data)
	if messageType == "clkCutscene" then
		local decode = json.decode(data)
		local position = data[1]
		local rotation = data[2]
		local duration = data[3]
		local player = managers.player:player_unit()
		if alive(player) then
			player:camera()._camera_unit:base():set_cutscene(position, rotation, duration)
		end
	end
end)
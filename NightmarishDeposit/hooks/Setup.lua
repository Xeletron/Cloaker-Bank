Hooks:Add('NetworkReceivedData', 'NetworkReceivedData_CLK', function(sender, messageType, data)
	if messageType == "clkCutscene" then
		local decode = json.decode(data)
		local position = data[1]
		local pos = Vector3(position[1], position[2], position[3])
		local rotation = data[2]
		local rot = Rotation(rotation[1], rotation[2], rotation[3])
		local duration = data[3]
		local player = managers.player:player_unit()
		if alive(player) then
			player:camera()._camera_unit:base():set_cutscene(pos, rot, duration)
		end
	end
end)
local Path = NightmarishDeposit.ModPath

dofile(Path .. "Hooks/ElementApplyMask.lua")
dofile(Path .. "Hooks/ElementFovAnim.lua")
dofile(Path .. "Hooks/ElementCutscene.lua")

function MissionManager:get_mission_element(element_id)
	for _, data in pairs(self._scripts) do
		for id, element in pairs(data:elements()) do
			if element:id() == element_id then
				return element
			end
		end
	end
end
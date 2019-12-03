core:import("CoreMissionScriptElement")
ElementCutscene = ElementCutscene or class(CoreMissionScriptElement.MissionScriptElement)

function ElementCutscene:on_executed(instigator)
	ElementCutscene.super.on_executed(self, instigator)
	if not self._values.enabled then
		return
	end

	local player = managers.player:player_unit()
	if alive(player) then
		player:camera()._camera_unit:base():set_cutscene(self._values.position, self._values.rotation, self._values.duration)
	end
	if Network:is_server() then
		local pos = {self._values.position.x, self._values.position.y, self._values.position.z}
		local rot = {self._values.rotation:yaw(), self._values.rotation:pitch(), self._values.rotation:roll()}
		local data = {pos, rot, self._values.duration}
		LuaNetworking:SendToPeers("clkCutscene", json.encode(data))
	end
end

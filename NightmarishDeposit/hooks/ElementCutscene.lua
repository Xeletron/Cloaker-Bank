core:import("CoreMissionScriptElement")
ElementCutscene = ElementCutscene or class(CoreMissionScriptElement.MissionScriptElement)

function ElementCutscene:client_on_executed(...)
    self:on_executed(...)
end

function ElementCutscene:on_executed(instigator)
	if not self._values.enabled then
		return
	end

	local player = managers.player:player_unit()
	if alive(player) then
		player:camera()._camera_unit:base():set_cutscene(self._values.position, self._values.rotation, self._values.duration)
	end

	ElementCutscene.super.on_executed(self, instigator)
end

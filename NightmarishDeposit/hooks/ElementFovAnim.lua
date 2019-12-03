core:import("CoreMissionScriptElement")
ElementFovAnim = ElementFovAnim or class(CoreMissionScriptElement.MissionScriptElement)

function ElementFovAnim:client_on_executed(...)
    self:on_executed(...)
end

function ElementFovAnim:on_executed(instigator)
	if not self._values.enabled then
		return
	end
	local player = managers.player:player_unit()
	if alive(player) then
		if self._values.fov > 0 then
			player:camera()._camera_unit:base():animate_fov_custom(self._values.fov, self._values.duration)
		else
			player:camera()._camera_unit:base():animate_fov_custom(0, 0)
			player:movement():current_state():update_fov_external()
		end
	end

	ElementFovAnim.super.on_executed(self, instigator)
end

Hooks:PostHook(MissionDoorTweakData, "init", "init_clk_missionint", function(self)
	self.shape_and_drill.devices.drill[1].timer = 90
	self.shape_and_drill.devices.drill[1].can_jam = false
end)
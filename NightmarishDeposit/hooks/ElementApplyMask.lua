core:import("CoreMissionScriptElement")
ElementApplyMask = ElementApplyMask or class(CoreMissionScriptElement.MissionScriptElement)

function ElementApplyMask:init(...)
	ElementApplyMask.super.init(self, ...)
	self._units = {}
end

function ElementApplyMask:client_on_executed(...)
    self:on_executed(...)
end

function ElementApplyMask:on_executed(instigator)
	if not self._values.enabled then
		return
	end
	if self._values.unit_name ~= "none" then
		if not managers.dyn_resource:is_resource_ready(Idstring("unit"), Idstring(self._values.unit_name), managers.dyn_resource.DYN_RESOURCES_PACKAGE) then
			managers.dyn_resource:load(Idstring("unit"), Idstring(self._values.unit_name), managers.dyn_resource.DYN_RESOURCES_PACKAGE)
		end
		local unit = CoreUnit.safe_spawn_unit(self._values.unit_name, self._values.position, self._values.rotation)

		if unit and instigator then
			instigator:base()._headwear_unit = unit
			instigator:link(Idstring("Head"),instigator:base()._headwear_unit,instigator:base()._headwear_unit:orientation_object():name())
		end

		table.insert(self._units, unit)
	end

	ElementApplyMask.super.on_executed(self, instigator)
end

function ElementApplyMask:units()
	return self._units
end

function ElementApplyMask:delete_units()
	for _, unit in ipairs(self._units) do
		unit:unlink()
		unitset_slot(0)
	end

	self._units = {}
end
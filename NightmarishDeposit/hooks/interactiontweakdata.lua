Hooks:PostHook(InteractionTweakData, "init", "init_clk_int", function (self, ...)
    self.search_files_false.text_id = "hud_clk_search_keycard"
    self.search_files_false.action_text_id = "hud_action_clk_search_keycard"
    self.search_files_false.timer = 2

	self.invisible_interaction_searching.text_id = "hud_clk_search_codes"
    self.invisible_interaction_searching.action_text_id = "hud_action_clk_search_keycard"
    self.invisible_interaction_searching.timer = 0.5
	
    self.hold_turn_off_gas.text_id  = "hud_clk_hold_turn_gas"
    self.hold_activate_sprinklers.text_id  = "hud_clk_hold_turn_valve"
    self.hold_activate_sprinklers.action_text_id  = "hud_action_clk_valve"
	
	self.barrier_numpad.text_id  = "hud_int_hold_close_shutters"
	self.barrier_numpad.special_equipment = "files"
	self.barrier_numpad.equipment_text_id = "hud_action_clk_nocodes"
end)

Hooks:PostHook(EquipmentsTweakData, "init", "init_clk_equipment", function (self)
	self.specials.files.text_id = "menu_asset_welcome_to_the_jungle_shuttercode"
end)

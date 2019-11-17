Hooks:PostHook(InteractionTweakData, "init", "init_clk", function (self, ...)
    self.search_files_false.text_id = "hud_clk_search_keycard"
    self.search_files_false.action_text_id = "hud_action_clk_search_keycard"
    self.search_files_false.timer = 2

    self.hold_turn_off_gas.text_id  = "hud_clk_hold_turn_gas"
    self.hold_activate_sprinklers.text_id  = "hud_clk_hold_turn_valve"
    self.hold_activate_sprinklers.action_text_id  = "hud_action_clk_valve"
end)

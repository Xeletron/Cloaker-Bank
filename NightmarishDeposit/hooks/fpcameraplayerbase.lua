Hooks:PostHook(FPCameraPlayerBase, "clbk_stance_entered", "clk_fov_anim", function (self)
    local transition = self._fov.transition_custom
    if transition and transition.start_t + transition.duration > managers.player:player_timer():time() then
        self._fov.transition = transition
    end
end)

function FPCameraPlayerBase:animate_fov_custom(new_fov, duration)
    if duration > 0 then
        local transition = {}
        self._fov.transition_custom = transition
        transition.end_fov = new_fov
        transition.start_fov = self._fov.fov
        transition.start_t = managers.player:player_timer():time()
        transition.duration = duration
        self._fov.transition = transition
    else
        self._fov.transition_custom = nil 
    end
end

function FPCameraPlayerBase:set_cutscene(position, rotation, duration)
    if not self._cutscene then
        local cutscene = {}
        self._cutscene = cutscene
        cutscene.position = position
        cutscene.rotation = rotation
        cutscene.start_t = managers.player:player_timer():time()
        cutscene.duration = duration
        self._parent_unit:base():controller():set_enabled(false)
        if managers.hud then
            managers.hud:set_disabled()
        end 
    else
        self._cutscene = nil
        self._parent_unit:base():controller():set_enabled(true)
        if managers.hud then
            managers.hud:set_enabled()
        end 
    end
end

Hooks:PostHook(FPCameraPlayerBase, "update", "clk_camera_update", function (self)
   if self._cutscene then
        if self._cutscene.start_t + self._cutscene.duration > managers.player:player_timer():time() then
            self._parent_unit:camera():set_position(self._cutscene.position)
            self._parent_unit:camera():set_rotation(self._cutscene.rotation)
        else
            self._cutscene = nil
            self._parent_unit:base():controller():set_enabled(true)
            if managers.hud then
                managers.hud:set_enabled()
            end 
        end
   end
end)

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
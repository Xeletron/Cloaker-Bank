Hooks:PostHook(PlayerManager, "update", "update_cutscene", function (self)
    if self._cutscene then
        if self._cutscene < self:player_timer():time() then
            self._cutscene = nil
            self:player_unit():base():controller():set_enabled(true)
            self._cutscene_vp:set_active(false)
            if managers.hud then
                managers.hud:set_enabled()
            end 
        end
   end
end)

function PlayerManager:play_cutscene(position, rotation, duration)
    if not self._cutscene_camera then
        self._cutscene_camera = World:create_camera()
        self._cutscene_camera:set_fov(80)
        self._cutscene_camera:set_near_range(7.5)
        self._cutscene_camera:set_far_range(200000)
        
        self._cutscene_vp = managers.viewport:new_vp(0, 0, 1, 1, "CutsceneCamera", CoreManagerBase.PRIO_WORLDCAMERA)
        self._cutscene_vp:set_camera(self._cutscene_camera)
    end

    if not self._cutscene then
        self._cutscene = self:player_timer():time() + duration
        self._cutscene_camera:set_position(position)
        self._cutscene_camera:set_rotation(rotation)
        self:player_unit():base():controller():set_enabled(false)
        self._cutscene_vp:set_active(true)
        if managers.hud then
            managers.hud:set_disabled()
        end 
    else
        self._cutscene = nil
        self:player_unit():base():controller():set_enabled(true)
        self._cutscene_vp:set_active(false)
        if managers.hud then
            managers.hud:set_enabled()
        end 
    end
end
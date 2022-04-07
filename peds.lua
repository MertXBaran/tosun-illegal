local pedler = {
	{id = 1, pednickname = "Kenevir Teach (PornHUB)", pedname = "a_m_m_beach_01", eventname = "kenevirogren", drwtxt = "[E]", x = 321.608, y = -221.28, z = 54.0843, h = 90},
	{id = 2, pednickname = "Kenevir Üreticisi 1", pedname = "a_m_y_juggalo_01", eventname = "keneviruret", drwtxt = "[E]", x = 319.392, y = -216.49, z = 54.0862, h = 90},
	{id = 3, pednickname = "Kenevir Üreticisi 2", pedname = "a_m_m_genfat_01", eventname = "keneviruret", drwtxt = "[E]", x = 328.053, y = -219.94, z = 54.0862, h = 120},
}

--ped create
Citizen.CreateThread(function()
    
	for k, v in pairs(pedler) do


        v.id = false
        Citizen.CreateThread(function()
          local hash = GetHashKey(v.pedname)
            if not HasModelLoaded(hash) then
                RequestModel(hash)
                Citizen.Wait(3500)
            end
            while not HasModelLoaded(hash) do
                Citizen.Wait(3500)
            end
            if v.id == false then
                local allahyok = CreatePed(1, hash, v.x, v.y, v.z-1, v.h, false, false)
                SetEntityInvincible(allahyok, true)
                SetBlockingOfNonTemporaryEvents(allahyok, true)
                SetPedDiesWhenInjured(allahyok, true)
                SetPedCanRagdollFromPlayerImpact(allahyok, true)
                SetPedCanRagdoll(allahyok, true)
                FreezeEntityPosition(allahyok, true)
                while not HasAnimDictLoaded("amb@world_human_hang_out_street@female_arms_crossed@idle_a") do
                    RequestAnimDict("amb@world_human_hang_out_street@female_arms_crossed@idle_a")
                    Citizen.Wait(500)
                end
                if not IsEntityPlayingAnim(allahyok, "amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", 3) then
                  TaskPlayAnim(allahyok, "amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
                end
            end
        end)

        Citizen.CreateThread(function()
        	while true do
        	local sleep = 1500
        	local entityloc = GetEntityCoords(PlayerPedId())
        	local dist = #(vector3(v.x, v.y, v.z) - entityloc)
        		if dist <= 2.0 then
        			sleep = 5
        			DrawText3D(vector3(v.x, v.y, v.z), v.drwtxt)
        			DrawText3D(vector3(v.x, v.y, v.z+1), v.pednickname)
        			if IsControlJustPressed(0, 38) then
        			    TriggerEvent(v.eventname)
        			end
        		end
        	Wait(sleep)
        	end
        end)
    end
end)


function DrawText3D(coord, text)
	local onScreen,_x,_y=GetScreenCoordFromWorldCoord(coord.x, coord.y, coord.z)
	local px,py,pz=table.unpack(GetGameplayCamCoords()) 
	local scale = 0.3
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextDropshadow(0)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 380
        DrawRect(_x, _y + 0.0120, 0.0 + factor, 0.025, 41, 11, 41, 100)
	end
end

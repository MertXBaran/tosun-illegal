local cooldown = 0

RegisterNetEvent('kenevirogren')
AddEventHandler('kenevirogren', function()
    if cooldown == 0 then
        exports['mythic_notify']:DoHudText('success', 'Merhaba hoşgeldin çaylak, ben Ömer Tosun!')
        Citizen.Wait(500)
        exports['mythic_notify']:DoHudText('success', 'Vay vay şu elindeki mallara bir bakalım nelerin var nelerin yok elinden gelecek işlere göz atalım.')
        TriggerEvent("mythic_progbar:client:progress", {
            name = "talkingnpc",
            duration = 15000,
            label = 'Senin geçmişine bi bakalım...',
            useWhileDead = false,
            canCancel = false,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "mp_safehouselost@",
                anim = "package_dropoff",
                flags = 16,
            },
            prop = {
                model = 'hei_prop_hei_paper_bag',
                bone = 28422,
                coords = { x = 0.05, y = 0.0, z = 0.0 },
                rotation = { x = 135.0, y = -100.0, z = 0.0 },
            }
        }, function(status)
            if not status then
                local barantosunusikti = math.random(1,6)
                if barantosunusikti == 1 then
                    SetNewWaypoint(0, 0)
                    exports['mythic_notify']:DoHudText('success', 'Telefonuna işine yarayacak önemli bir arkadaşımın konumunu işaretledim.')
                elseif barantosunusikti == 2 then
                    SetNewWaypoint(0, 0)
                    exports['mythic_notify']:DoHudText('success', 'Telefonuna işine yarayacak önemli bir arkadaşımın konumunu işaretledim.')
                else
                    exports['mythic_notify']:DoHudText('error', 'Bi baktımda Elinden hiçbi sik gelmiyor :(')
                    cooldown = 60
                end
            end
        end)
    else
        exports['mythic_notify']:DoHudText('error', 'Kanki ben ömer tosun ankaralı bi iş adamı olarak seni ['..cooldown..'] saniye boyunca bekleteceğim kusura bakma.')
    end
end)
Citizen.CreateThread(function()
    while true do
        if cooldown > 0 then
			cooldown = cooldown - 1
			if cooldown <= 0 then
				cooldown = 0
			end
        end
        Citizen.Wait(1000)
    end
end)

RegisterNetEvent('keneviruret')
AddEventHandler('keneviruret', function()
    exports['mythic_notify']:DoHudText('success', 'Hoşgeldin! ben Tunahan üstündeki eşyalara göre sana üretmende yardımcı olacağım.')
    Citizen.Wait(1000)
    exports['mythic_notify']:DoHudText('success', 'Ama bana IQ seviyeni kanıtlaman gerekiyor.')
    project1usmal = true
    exports["hacking"]:hacking(function()
        if project1usmal then
            project1usmal = false
            exports['mythic_progbar']:Progress({
                name = "talkingnpc",
                duration = 15000,
                label = 'Kenevir Senin Köpeğin olsun...',
                useWhileDead = false,
                canCancel = false,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "mp_safehouselost@",
                    anim = "package_dropoff",
                    flags = 16,
                },
                prop = {
                    model = 'hei_prop_hei_paper_bag',
                    bone = 28422,
                    coords = { x = 0.05, y = 0.0, z = 0.0 },
                    rotation = { x = 135.0, y = -100.0, z = 0.0 },
                }
            }, function(cancelled)
                if not cancelled then
                    loadAnimDict("mp_safehouselost@")
                    local itemssayi = math.random(1,3)
                    TriggerServerEvent("omertosungottensik:itemver", "kenevir", math.random(1,3))
                    exports['mythic_notify']:DoHudText('success', '['..itemssayi..'] tane kenevir ürettik bi kaçını gömde kendimize gelelim :)')
                end
            end)
        end
    end,
    function()
        if project1usmal then
            project1usmal = false
            exports['mythic_notify']:DoHudText('success', 'Senden bi bok olmaz.')
        end
    end)
end)


loadAnimDict = function(dick)
    while not HasAnimDictLoaded(dick) do
        RequestAnimDict(dick)
        Citizen.Wait(5)
    end
end
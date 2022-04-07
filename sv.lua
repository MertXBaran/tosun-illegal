QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)


-- an example
-- local xPlayer = QBCore.Functions.GetPlayer(source)
-- xPlayer.Functions.AddMoney('cash', para)

RegisterServerEvent("omertosungottensik:itemver")
AddEventHandler("omertosungottensik:itemver", function(omerinannesi, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if omerinannesi == "kenevir" then
        xPlayer.Functions.AddItem(omerinannesi, count)
    else
        DropPlayer(source, "lutfen uzatma yolum yol degil") --bu eventten farklı item basacak enayiler için
    end
end)
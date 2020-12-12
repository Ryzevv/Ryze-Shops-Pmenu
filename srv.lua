ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('ryze:pay')
AddEventHandler('ryze:pay', function(price, item, nombre) 
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 
	if xPlayer.getMoney() >= price then
	xPlayer.removeMoney(price)
    	xPlayer.addInventoryItem(item, nombre) 
        TriggerClientEvent('esx:showNotification', source, "Merci de votre ~g~Achats !", "", 1)
     else 
         TriggerClientEvent('esx:showNotification', source, "Pas assez ~r~d'argent sur vous")    
        end
end)  

  
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("PoserArgent")
AddEventHandler("PoserArgent", function(money)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local total = money
    local xMoney = xPlayer.getMoney()
    
    if xMoney >= total then

    xPlayer.addAccountMoney('bank', total)
    xPlayer.removeMoney(total)
         TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque', 'FLEECA', "~b~Vous avez déposer ~g~ "..total.."$ ~w~ en banque !", 'CHAR_BANK_FLEECA', 8)
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas tout cette ~r~d\'argent !")
    end    
end)

RegisterServerEvent('retire')
AddEventHandler('retire', function(amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local price = 100
    local xMoney = xPlayer.getBank()
    
    if xMoney >= price then
    
    xPlayer.removeAccountMoney('bank', price)
    xPlayer.addMoney(price)
          TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque', 'FLEECA', "Vous avez retiré ~g~ "..price.." $ ~w~.", 'CHAR_BANK_FLEECA', 9)
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas tout cette ~r~d\'argent !")
    end    
end)


RegisterServerEvent('retire2')
AddEventHandler('retire2', function(amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local price = 500
    local xMoney = xPlayer.getBank()
    
    if xMoney >= price then
    
    xPlayer.removeAccountMoney('bank', price)
    xPlayer.addMoney(price)
          TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque', 'FLEECA', "Vous avez retiré ~g~ "..price.." $ ~w~.", 'CHAR_BANK_FLEECA', 9)
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas tout cette ~r~d\'argent !")
    end    
end)


RegisterServerEvent('retire3')
AddEventHandler('retire3', function(amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local price = 1000
    local xMoney = xPlayer.getBank()
    
    if xMoney >= price then
     
    xPlayer.removeAccountMoney('bank', price)
    xPlayer.addMoney(price)
          TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque', 'FLEECA', "Vous avez retiré ~g~ "..price.." $ .", 'CHAR_BANK_FLEECA', 9)
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas tout cette ~r~d\'argent !")
    end    
end)


RegisterServerEvent("bank:solde") 
AddEventHandler("bank:solde", function(action, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney = xPlayer.getBank()
    TriggerClientEvent("solde:argent", source, playerMoney)
end)

RegisterServerEvent("RetiréArgent")
AddEventHandler("RetiréArgent", function(money)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local total = money
    local xMoney = xPlayer.getBank()
    
    if xMoney >= total then

    xPlayer.removeAccountMoney('bank', total)
    xPlayer.addMoney(total)

         TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque', 'FL~g~EE~s~CA', "~b~Vous avez retiré ~g~ "..total.."$ ~w~.", 'CHAR_BANK_FLEECA', 8)
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas tout cette ~r~d\'argent !")
    end    
end)

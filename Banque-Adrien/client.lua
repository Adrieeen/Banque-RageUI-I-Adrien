ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
    end
end)


RegisterNetEvent("solde:argent")
AddEventHandler("solde:argent", function(money, cash)
    PlayerMoney = tonumber(money)
end)

Citizen.CreateThread(function()
    while true do
        Config.GetPlayerMoney()
        Wait(2500)
    end
end)

Citizen.CreateThread(function()
    for k,v in pairs(Config.Zones) do
        -- Un ped pour chaque shop légal
        for i = 1, #v.LegalPos, 1 do

            local hash = GetHashKey("a_m_m_prolhost_01")
            while not HasModelLoaded(hash) do
                RequestModel(hash)
                Wait(60)
            end

            ped = CreatePed("PED_TYPE_CIVMALE", "a_m_m_prolhost_01", v.LegalPos[i].x, v.LegalPos[i].y, v.LegalPos[i].z, v.LegalPos[i].angle, false, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            SetEntityInvincible(ped, true)
            FreezeEntityPosition(ped, true)
        end

    end
end)


Citizen.CreateThread(function()

    for i=1, #Config.Bank, 1 do

        local blip = AddBlipForCoord(Config.Bank[i].x, Config.Bank[i].y, Config.Bank[i].z)

        SetBlipSprite (blip, 277)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 0.8)
        SetBlipColour (blip, 2)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Banque")
        EndTextCommandSetBlipName(blip)
    end

end)


function startScenario(anim)
    TaskStartScenarioInPlace(PlayerPedId(), anim, 0, false)
end

function notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    
    blockinput = true 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "Somme", ExampleText, "", "", "", MaxStringLenght) 
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end 
         
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end


function retire_argent()
    local amount = KeyboardInput('Retirer de l\'argent', '', 10)

    if amount ~= nil then
        amount = tonumber(amount)

        if type(amount) == 'number' then
            TriggerServerEvent('RetiréArgent', amount)
        end
    end
end

function depot_argent()
    local amount = KeyboardInput('Poser de l\'argent', '', 10)

    if amount ~= nil then
        amount = tonumber(amount)

        if type(amount) == 'number' then
            TriggerServerEvent('PoserArgent', amount)
        end
    end
end

---------------- FONCTIONS ------------------

RMenu.Add('template', 'main', RageUI.CreateMenu("Banque", "Interagir avec votre banque"))
RMenu.Add('template', 'info', RageUI.CreateSubMenu(RMenu:Get('template', 'main'), "Informations", "Vos Informations Banquaires"))
RMenu.Add('template', 'actions', RageUI.CreateSubMenu(RMenu:Get('template', 'main'), "Actions", "Choisissez l\'action que vous voulez effectuer"))
RMenu.Add('template', 'depose', RageUI.CreateSubMenu(RMenu:Get('template', 'main'), "Déposer De l\'argent", " "))
RMenu.Add('template', 'retire', RageUI.CreateSubMenu(RMenu:Get('template', 'main'), "Retirer de l\'argent", " "))


RMenu:Get("template", "info"):SetRectangleBanner(0, 255, 77, 255)
RMenu:Get("template", "main"):SetRectangleBanner(.0, 255, 77, 255)
RMenu:Get("template", "actions"):SetRectangleBanner(0, 255, 77, 255)
RMenu:Get("template", "depose"):SetRectangleBanner(0, 255, 77, 255)
RMenu:Get("template", "retire"):SetRectangleBanner(0, 255, 77, 255)



Citizen.CreateThread(function()
    while true do




        
        
        
        
        
        RageUI.IsVisible(RMenu:Get('template', 'main'), true, true, true, function() 


                    RageUI.Button("Actions envers la banque", "", {RightLabel = "→→→"},true, function()
                    end, RMenu:Get('template', 'actions'))

                    RageUI.Button("Informations envers son compte", "", {RightLabel = "→→→"},true, function()
                    end, RMenu:Get('template', 'info'))

                   end, function()
                    end)








                    
                    RageUI.IsVisible(RMenu:Get('template', 'info'), true, true, true, function()


        RageUI.Button('    Proprietaire Du Compte : ~h~         '.. GetPlayerName(PlayerId()) ..'', nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
        end)

        RageUI.Button("    Mot De Passe : ~h~                                **** ", nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
        end)

        RageUI.Button('    Solde du compte : ~h~~g~                     $'.. PlayerMoney ..'', nil, {RightLabel = "" }, true, function(Hovered, Active, Selected)
        end) 

        RageUI.Button("~b~Retour au menu principal", nil, { RightLabel = "←←←" },true, function()
        end, RMenu:Get('template', 'main'))

    end, function()
    end)





    
    
    
    
    RageUI.IsVisible(RMenu:Get('template', 'actions'), true, true, true, function()

             
        RageUI.Button("~h~~g~                                        Déposer de l\'argent ", "", {RightLabel = "→"}, true, function(Hovered, Active, Selected)
            if (Selected) then  depot_argent()
            end   end)
      
        RageUI.Button("~r~                                        Retirer de l'argent", "", {RightLabel = "→→→"}, true, function()
        end, RMenu:Get('template', 'retire'))
                     

        RageUI.Button("~b~Retour au menu principal", nil, { RightLabel = "←←←" },true, function()
        end, RMenu:Get('template', 'main'))

                   end, function()
                    end)











                    RageUI.IsVisible(RMenu:Get('template', 'retire'), true, true, true, function()


                        RageUI.Button("~h~~r~                              Retirer une somme personalisé", "→", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                            if (Selected) then  
                                retire_argent()
                            end   end)

                            RageUI.Button("                       ---------------------------------------------------------", "", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                                if (Selected) then  
                                end   end)
                    
                            RageUI.Button("                                              Retirer ~g~100$", "", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                                if (Selected) then
                                        Citizen.Wait(1000)
                                        ClearPedTasksImmediately(PlayerPedId()) 
                                        TriggerServerEvent('retire')
                                        PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)
                
                                end
                            end)


                            RageUI.Button("                                              Retirer ~g~500$", "", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                                if (Selected) then
                                        Citizen.Wait(1000)
                                        ClearPedTasksImmediately(PlayerPedId()) 
                                        TriggerServerEvent('retire2')
                                        PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)
                
                                end
                            end)


                            RageUI.Button("                                              Retirer ~g~1000$", "", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                                if (Selected) then
                                        Citizen.Wait(1000)
                                        ClearPedTasksImmediately(PlayerPedId()) 
                                        TriggerServerEvent('retire3')
                                        PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)
                
                                end
                            end)

                                        end, function()
                                        end)

                    Citizen.Wait(0)
                end
            end)


---------------------------------------------

local position = {
    {x = 149.41, y = -1042.14, z = 29.36},
    {x = -1211.96, y = -331.93, z = 37.78},
    {x = -2961.08, y = 482.77, z = 15.69},
    {x = -110.20, y = 6468.97, z = 31.62},
    {x = 313.74, y = -280.50, z = 54.16},
    {x = -351.37, y = -51.3293, z = 49.03},
    {x = 1175.18, y = 2708.20, z = 38.08}

}

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
    
            for k in pairs(position) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
            
                if dist <= 2.0 then
                    ESX.ShowHelpNotification("Appuyer sur [E] pour ouvrir le menu")
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('template', 'main'), not RageUI.Visible(RMenu:Get('template', 'main')))
                    end
                end
            end
        end
    end)
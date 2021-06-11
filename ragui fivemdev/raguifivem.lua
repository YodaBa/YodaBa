--Début script obligatoire--
client.lua : 
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

serveur.lua :
ESX = nil

fxmanifest.lua : 
fx_version 'adamant'

game 'gta5'

------------ RAGEUI ------------


client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",

    "src/components/*.lua",

    "src/menu/elements/*.lua",

    "src/menu/items/*.lua",

    "src/menu/panels/*.lua",

    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",

}


client_scripts {
	'client.lua'
}


server_scripts {
	'server.lua'
}



dependencies {
	'es_extended'
}


--Creation MENU/SOUS-MENU--
création menu :
RMenu.Add('example', 'main', RageUI.CreateMenu("Example", "Nom menu"))
Sous menu ;
RMenu.Add('example', 'menu nom', RageUI.CreateSubMenu(RMenu:Get('example', 'main'), "nom catégorie", "déscription catégorie"))

--Menu corps--


ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end

RMenu.Add('example', 'main', RageUI.CreateMenu("Example", "Menu Example"))

Citizen.CreateThread(function()
  while true do
      RageUI.IsVisible(RMenu:Get('example', 'main'), true, true, true, function()

      end, function()
        ---Panels
    end, 1)

    Citizen.Wait(0)
end
end)

--position menu--

local position = {
  {x =  , y = , z = , }
}    


Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)

      for k in pairs(position) do

          local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
          local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

          if dist <= 1.0 then

             RageUI.Text({
                  message = "Appuyez sur [~b~E~w~] pour acceder au ~b~le nom menu",
                  time_display = 1
              })
             -- ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour acceder au ~b~Shop")
              if IsControlJustPressed(1,51) then
                  RageUI.Visible(RMenu:Get('example', 'main'), not RageUI.Visible(RMenu:Get('example', 'main')))
              end
          end
      end
  end
end)

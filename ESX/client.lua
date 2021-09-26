ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local vanish = true
 

RegisterCommand('adminmenu', function()
    ESX.TriggerServerCallback('0R-admin:cp', function(auth)
	    SendNUIMessage(auth)
        SetNuiFocus(true, false)
	    SetNuiFocusKeepInput(true)
    end)
end, true)

RegisterCommand('noclip0', function()
   ESX.TriggerServerCallback('0R.ADMIN.PERMCHECK', function(perm)
     if perm then 
      noclipActive = not noclipActive
      toggleNoclip()
	  vanish = not vanish
      SetEntityVisible(PlayerPedId(), vanish, 0)
      NetworkSetEntityInvisibleToNetwork(PlayerPedId(), vanish)
      SetForcePedFootstepsTracks(vanish)
	 end
   end, 'noclip')   
end, true)

RegisterKeyMapping('adminmenu', 'Admin menu', 'keyboard', 'insert')
RegisterKeyMapping('noclip0', 'Noclip', 'keyboard', 'delete')
 
RegisterNUICallback('Close', function(data, cb)
    SetNuiFocus(false, false) 
	SetNuiFocusKeepInput(false)
end)
 
RegisterNUICallback('GET.PLAYERS', function(data, cb)
   ESX.TriggerServerCallback('0R-admin:GET.PLAYERS', function(players)
	    cb(players)
    end)
end)

RegisterNUICallback('GET.BANS', function(data, cb)
   ESX.TriggerServerCallback('0R-admin:GET.BANS', function(players)
	    cb(players)
    end)
end)

RegisterNUICallback('DeleteBan', function(data, cb)
    TriggerServerEvent('0R.ADMIN.DELETEBAN', tonumber(data.id))
end)

RegisterNUICallback('Revive', function(data, cb)
  if data.type == "self" then 
    TriggerServerEvent('0R.ADMIN.REVIVE', "self")
  else
    TriggerServerEvent('0R.ADMIN.REVIVE', tonumber(data.id))
  end
end)

RegisterNUICallback('Tpm', function(data, cb)
   ESX.TriggerServerCallback('0R.ADMIN.PERMCHECK', function(perm)
   if DoesBlipExist(GetFirstBlipInfoId(8)) then
      local coords = GetBlipInfoIdCoord(GetFirstBlipInfoId(8))
	  for z = 1, 1000 do
	    SetPedCoordsKeepVehicle(PlayerPedId(), coords.x, coords.y, z + 0.1)
		local chekGround, zPos = GetGroundZFor_3dCoord(coords.x, coords.y, z + 0.1)
		if chekGround then
		    SetPedCoordsKeepVehicle(PlayerPedId(), coords.x, coords.y, z + 0.1)
			local e = GetEntityCoords(PlayerPedId())
			RequestCollisionAtCoord(e.x, e.y, e.z)
			break;
		end
		Citizen.Wait(1)
	  end
   end
   end, 'tpm')
end)

RegisterNUICallback('Noclip', function(data, cb)
   ESX.TriggerServerCallback('0R.ADMIN.PERMCHECK', function(perm)
   noclipActive = not noclipActive
   toggleNoclip()
   end, 'noclip')
end)


RegisterNUICallback('Vanish', function(data, cb)
   ESX.TriggerServerCallback('0R.ADMIN.PERMCHECK', function(perm)
   vanish = not vanish
   SetEntityVisible(PlayerPedId(), vanish, 0)
   NetworkSetEntityInvisibleToNetwork(PlayerPedId(), vanish)
   SetForcePedFootstepsTracks(vanish)
   end, 'noclip')
end)

                    

RegisterNUICallback('Bring', function(data, cb)
  TriggerServerEvent('0R.ADMIN.BRING', tonumber(data.id))
end)

RegisterNUICallback('CleanJudge', function(data, cb)
  TriggerServerEvent('0R.ADMIN.JUDGE')
end)

RegisterNUICallback('Goto', function(data, cb)
  TriggerServerEvent('0R.ADMIN.GOTO', tonumber(data.id))
end)

RegisterNUICallback('Heal', function(data, cb)
  if data.type == "self" then 
    TriggerServerEvent('0R.ADMIN.HEAL', "self")
  else 
    TriggerServerEvent('0R.ADMIN.HEAL', tonumber(data.id))
  end
end)

RegisterNUICallback('Kill', function(data, cb)
  TriggerServerEvent('0R.ADMIN.KILL', tonumber(data.id))
end)

RegisterNUICallback('Kick', function(data, cb)
  TriggerServerEvent('0R.ADMIN.KICK', tonumber(data.id), data.reason)
end)

RegisterNUICallback('Ban', function(data, cb)
  TriggerServerEvent('0R.ADMIN.BAN', tonumber(data.id), data.reason)
end)

RegisterNUICallback('Freeze', function(data, cb)
  TriggerServerEvent('0R.ADMIN.FREEZE', tonumber(data.id))
end)

RegisterNUICallback('OpenInv', function(data, cb)
  TriggerServerEvent('0R.ADMIN.OPENINV', tonumber(data.id))
end)

RegisterNUICallback('ClearInv', function(data, cb)
  TriggerServerEvent('0R.ADMIN.CLEARINV', tonumber(data.id))
end)

RegisterNUICallback('GiveItem', function(data, cb)
  TriggerServerEvent('0R.ADMIN.GIVEITEM', tonumber(data.id), data.item, data.count)
end)

RegisterNUICallback('SetJob', function(data, cb)
  TriggerServerEvent('0R.ADMIN.SETJOB', tonumber(data.id), data.job, data.grade)
end)

RegisterNUICallback('Takess', function(data, cb)
  TriggerServerEvent('0R.ADMIN.TAKESS', tonumber(data.id))
end)

RegisterNUICallback('WipePlayer', function(data, cb)
  TriggerServerEvent('0R.ADMIN.WIPE', tonumber(data.id))
end)

RegisterNUICallback('WipePlayerOffline', function(data, cb)
  TriggerServerEvent('0R.ADMIN.WIPEOFFLINE', data.identifier)
end)

RegisterNUICallback('BanPlayerOffline', function(data, cb)
  TriggerServerEvent('0R.ADMIN.BANPLAYEROFFLINE', data.identifier, data.reason)
end)

RegisterNUICallback('SetTime', function(data, cb)
  TriggerServerEvent('0R.ADMIN.SETTIME', data.clock, data.min, data.type)
end)

RegisterNUICallback('SetWeather', function(data, cb)
  TriggerServerEvent('0R.ADMIN.SETWEATHER', data.weather, data.type)
end)

RegisterNUICallback('PlayerBlips', function(data, cb)
  TriggerServerEvent('0R.ADMIN.PLAYERBLIPS', data.bool)
end)

RegisterNUICallback('Announcement', function(data, cb)
  TriggerServerEvent('0R.ADMIN.ANNOUNCEMENT', data.text)
end)

RegisterNUICallback('ReviveAll', function(data, cb)
  TriggerServerEvent('0R.ADMIN.REVIVEALL')
end)

RegisterNUICallback('BringAll', function(data, cb)
  TriggerServerEvent('0R.ADMIN.BRINGALL')
end)

RegisterNUICallback('KickAll', function(data, cb)
  TriggerServerEvent('0R.ADMIN.KICKALL', data.text)
end)

RegisterNUICallback('DeleteAllCars', function(data, cb)
  TriggerServerEvent('0R.ADMIN.DELETEALLCARS')
end)


RegisterNUICallback('CarFix', function(data, cb)
  ESX.TriggerServerCallback('0R.ADMIN.PERMCHECK', function(perm)
  if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		SetVehicleEngineHealth(vehicle, 9999)
		SetVehiclePetrolTankHealth(vehicle, 9999)
		SetVehicleFixed(vehicle)
  end
  end, 'fixcar')
end)


RegisterNUICallback('Suicide', function(data, cb)
  ESX.TriggerServerCallback('0R.ADMIN.PERMCHECK', function(perm)
    ApplyDamageToPed(PlayerPedId(), 200, 0)
  end, 'kill')
end)


RegisterNUICallback('copy', function(data, cb)
    ESX.TriggerServerCallback('0R.ADMIN.PERMCHECK', function(perm)
	    local ply = GetEntityCoords(PlayerPedId())
	    if data.type == "vector3" then 
		   SendNUIMessage({ action = "copy", text = "vector3("..ply.x..", "..ply.y..", "..ply.z..")"  })
		elseif data.type == "vector4" then 
		   SendNUIMessage({ action = "copy", text = "vector4("..ply.x..", "..ply.y..", "..ply.z..", "..GetEntityHeading(PlayerPedId())..")"  })
		elseif data.type == "heading" then 
		   SendNUIMessage({ action = "copy", text =  GetEntityHeading(PlayerPedId()) })
		end
	end, 'copy')
end)

local bool = false
local playerBlips = {}
RegisterNetEvent('0R.ADMIN.SHOWBLIPS')
AddEventHandler('0R.ADMIN.SHOWBLIPS', function(players)
  Citizen.CreateThread(function()
	bool = not bool
	while bool do
	   for k, v in pairs(players) do
	    ESX.TriggerServerCallback('0R.ADMIN.GETPLAYER', function(player)
	     local blip = AddBlipForCoord(player.coords)
		 RemoveBlip(playerBlips[v])
	     SetBlipSprite(blip, 1)
	     SetBlipDisplay(blip, 4)
	     SetBlipScale(blip, 0.9)
	     SetBlipColour(blip, 1) 
	     SetBlipAsShortRange(blip, true)
	     BeginTextCommandSetBlipName("STRING")
	     AddTextComponentString(player.name)
	     EndTextCommandSetBlipName(blip)
		 playerBlips[v] = blip
		 end, v)
	   end
	   Citizen.Wait(1000)
	end
	
	if not bool then 
	  for k, v in pairs(playerBlips) do
	      RemoveBlip(playerBlips[k])
	  end
	  playerBlips = {}
	end
  end)
end)


RegisterNetEvent('0R.CL.ADMIN.DELETEALLCARS')
AddEventHandler('0R.CL.ADMIN.DELETEALLCARS', function()
   ESX.TriggerServerCallback('0R.ADMIN.PERMCHECK', function(perm)
   if perm then 
   for k, v in pairs(ESX.Game.GetVehiclesInArea(GetEntityCoords(PlayerPedId()), 150)) do
	   DeleteEntity(v)
   end
   for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
            DeleteVehicle(vehicle)
            if (DoesEntityExist(vehicle)) then 
                DeleteVehicle(vehicle) 
            end
        end
    end
	end
   end, 'deleteallcars')
end)


RegisterNUICallback('ClearArea', function(data, cb)
   ESX.TriggerServerCallback('0R.ADMIN.PERMCHECK', function(perm)
   if perm then 
   for k, v in pairs(ESX.Game.GetVehiclesInArea(GetEntityCoords(PlayerPedId()), 150)) do
	   DeleteEntity(v)
   end
   for k, v in pairs(ESX.Game.GetObjects()) do
      DeleteEntity(v)
   end
   for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
            DeleteVehicle(vehicle)
            if (DoesEntityExist(vehicle)) then 
                DeleteVehicle(vehicle) 
            end
        end
    end
	end
   end, 'cleararea')
end)
 



RegisterNUICallback('GiveCar', function(data, cb)
    if not data.own then 
	   data.own = false
	end
    vehiclehash = GetHashKey(data.carmodel)
    RequestModel(vehiclehash)
	Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 5000 then
                ShowNotification("~r~ Vehicle not loaded.")
                break
            end
        end
        TriggerServerEvent('0R.ADMIN.GIVECAR', tonumber(data.id), vehiclehash, data.own)
    end)
end)

RegisterNetEvent('0R.ADMIN.CL.NOLONGER')
AddEventHandler('0R.ADMIN.CL.NOLONGER', function(x)
	SetModelAsNoLongerNeeded(x)
end)

RegisterNetEvent('0R.ADMIN.REQUESTSS')
AddEventHandler('0R.ADMIN.REQUESTSS', function(realsource)
    exports['screenshot-basic']:requestScreenshotUpload('https://discord.com/api/webhooks/839844465241358388/Hr2Ylj4dJmq6PopDq06CshMoT2H0bzpr0z0CYOU5jpE-r95hXCGdTtawt4bHRa0yHv8F', 'files[]', function(data)
        local resp = json.decode(data)
        TriggerServerEvent('0R.ADMIN.OFFERSS', realsource, resp.attachments[1].proxy_url)
    end)
end)


RegisterNetEvent('0R.ADMIN.SENDNUI')
AddEventHandler('0R.ADMIN.SENDNUI', function(data)
    SendNUIMessage(data)
end)

RegisterNetEvent('0R.CL.GET.VEHICLEPROPS')
AddEventHandler('0R.CL.GET.VEHICLEPROPS', function(vehicle)
	local props = ESX.Game.GetVehicleProperties(GetVehiclePedIsIn(PlayerPedId(), false))
    TriggerServerEvent('0R.SET.VEHICLEPROPS', vehicle, props)
end)

RegisterNetEvent('0R.CL.ADMIN.KILL')
AddEventHandler('0R.CL.ADMIN.KILL', function()
    ApplyDamageToPed(PlayerPedId(), 200, 0)
end)

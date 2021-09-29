QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

 
AddEventHandler('playerConnecting', function(name, setCallback, defer) 
    defer.defer()
    local banned = false
    local src = source
    defer.update(L("CHECKING_BANLIST"))
    local bans = exports.ghmattimysql:executeSync("SELECT identifier,reason FROM `0r-bans` ", {  })
    if bans and bans[1] then 
       for k, v in pairs(bans) do
 	      if GetPlayerIdentifier(src, 0) == v.identifier then 
		    banned = true
		    defer.done(L('URE_BANNED')..v.reason..' ')
		    return	  
	      end
	   end
    end     
   
    if banned == false then defer.done() end
end)

QBCore.Functions.CreateCallback('0R-admin:cp', function(source, cb)
   if PermCheck(source, 'auth') then 
      cb({ action = "auth", auth = "acsess", lang = Lang.Languages[Lang.Language] })
   else 
      cb(nil)
   end
end)

QBCore.Functions.CreateCallback('0R-admin:GET.PLAYERS', function(source, cb)
    if PermCheck(source, 'playerlist') then
    local Players = {}
 
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
	   local xPlayer = QBCore.Functions.GetPlayer(v)
       table.insert(Players, { id = v, name = xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname})
    end

    cb(Players)
	end
end)

QBCore.Functions.CreateCallback('0R-admin:GET.BANS', function(source, cb)
    if PermCheck(source, 'bansshow') then
    local Players = {}
	local bans = exports.ghmattimysql:executeSync("SELECT id,identifier FROM `0r-bans` ", {  })
    if bans and bans[1] then 
       for k, v in pairs(bans) do
	      table.insert(Players, { identifier = v.identifier, id = v.id })
	   end
    end
    cb(Players)
	end
end)

RegisterServerEvent('0R.ADMIN.DELETEBAN')
AddEventHandler('0R.ADMIN.DELETEBAN', function(id)
    if PermCheck(source, 'bansdelete') then
	   exports.ghmattimysql:executeSync("DELETE FROM `0r-bans` WHERE id='"..id.."'  ", { })       
    end
end)

RegisterServerEvent('0R.ADMIN.REVIVE')
AddEventHandler('0R.ADMIN.REVIVE', function(id)
    if PermCheck(source, 'revive') then
	    if id == "self" then 
		   id = tonumber(source)
		end
      TriggerClientEvent('hospital:client:Revive', id)
		TriggerClientEvent("0R.ADMIN.SENDNUI", source, { action = "notify", value = L('PROCESS') })
    end
end)

RegisterServerEvent('0R.ADMIN.BRING')
AddEventHandler('0R.ADMIN.BRING', function(id)
    if PermCheck(source, 'bring') then
        SetEntityCoords(GetPlayerPed(source), GetEntityCoords(GetPlayerPed(id)))
    end
end)

RegisterServerEvent('0R.ADMIN.GOTO')
AddEventHandler('0R.ADMIN.GOTO', function(id)
    if PermCheck(source, 'goto') then
        SetEntityCoords(GetPlayerPed(id), GetEntityCoords(GetPlayerPed(source)))
    end
end)

RegisterServerEvent('0R.ADMIN.HEAL')
AddEventHandler('0R.ADMIN.HEAL', function(id)
    if PermCheck(source, 'heal') then
	    if id == "self" then 
		   id = tonumber(source)
		end
		TriggerClientEvent('esx_basicneeds:healPlayer', id)
		TriggerClientEvent("0R.ADMIN.SENDNUI", source, { action = "notify", value = L('PROCESS') })
    end
end)

RegisterServerEvent('0R.ADMIN.KILL')
AddEventHandler('0R.ADMIN.KILL', function(id)
    if PermCheck(source, 'kill') then
		TriggerClientEvent('0R.CL.ADMIN.KILL', id)
    end
end)


RegisterServerEvent('0R.ADMIN.JUDGE')
AddEventHandler('0R.ADMIN.JUDGE', function(id)
    if PermCheck(source, 'judge') then
	   for k, v in pairs(QBCore.Functions.GetPlayers()) do
          TriggerEvent('esx_communityservice:endCommunityServiceCommand', v)
       end
    end
end)

RegisterServerEvent('0R.ADMIN.KICK')
AddEventHandler('0R.ADMIN.KICK', function(id, reason)
    if PermCheck(source, 'kick') then
		DropPlayer(id, "[0R-ADMIN] | "..L('KICKED_1').." "..GetPlayerName(source).." \n "..L('KICKED_2')..": "..reason);
		TriggerClientEvent("0R.ADMIN.SENDNUI", source, { action = "notify", value = L('PROCESS') })
    end
end)

RegisterServerEvent('0R.ADMIN.BAN')
AddEventHandler('0R.ADMIN.BAN', function(id, reason)
    if PermCheck(source, 'kick') then
	    local xPlayer = QBCore.Functions.GetPlayer(id)
		DropPlayer(id, "[0R-ADMIN] | "..L('KICKED_1').." "..GetPlayerName(source).." \n "..L('KICKED_2')..": "..reason);
		exports.ghmattimysql:execute("INSERT INTO `0r-bans` (identifier, reason) VALUES ('"..xPlayer.identifier.."', '"..reason.."')", {  }) 
		TriggerClientEvent("0R.ADMIN.SENDNUI", source, { action = "notify", value = L('PROCESS') })
    end
end)

local lastfreeze = false
RegisterServerEvent('0R.ADMIN.FREEZE')
AddEventHandler('0R.ADMIN.FREEZE', function(id)
    if PermCheck(source, 'freeze') then
	    lastfreeze = not lastfreeze
		FreezeEntityPosition(GetPlayerPed(id),lastfreeze)
		local freeze = "unfreezed"
		if lastfreeze then 
		   freeze = "freezed"
		end
		TriggerClientEvent("0R.ADMIN.SENDNUI", source, { action = "notify", value = L('PLAYER').." "..freeze })
    end
end)

RegisterServerEvent('0R.ADMIN.OPENINV')
AddEventHandler('0R.ADMIN.OPENINV', function(id)
    if PermCheck(source, 'openinv') then
      TriggerClientEvent('0R.ADMIN.OPENINVENTORY', source, id)
   end
end)

RegisterServerEvent('0R.ADMIN.GIVEITEM')
AddEventHandler('0R.ADMIN.GIVEITEM', function(id, item, count)
    if PermCheck(source, 'giveitem') then
	   local xPlayer = QBCore.Functions.GetPlayer(id)
	   xPlayer.Functions.AddItem(item, tonumber(count))
	   TriggerClientEvent("0R.ADMIN.SENDNUI", source, { action = "notify", value = L('PROCESS') })
    end
end)


RegisterServerEvent('0R.ADMIN.SETJOB')
AddEventHandler('0R.ADMIN.SETJOB', function(id, job, grade)
    if PermCheck(source, 'setjob') then
	   local xPlayer = QBCore.Functions.GetPlayer(id)
	   if ESX.DoesJobExist(job, tonumber(grade)) then
            xPlayer.setJob(job, tonumber(grade))
			TriggerClientEvent("0R.ADMIN.SENDNUI", source, { action = "notify", value = L('JOB') })
       end
    end
end)

RegisterServerEvent('0R.ADMIN.TAKESS')
AddEventHandler('0R.ADMIN.TAKESS', function(id)
    if PermCheck(source, 'takess') then
	   TriggerClientEvent("0R.ADMIN.REQUESTSS", id, source)
    end
end)

RegisterServerEvent('0R.ADMIN.OFFERSS')
AddEventHandler('0R.ADMIN.OFFERSS', function(id, url)
    if PermCheck(source, 'takess') then
	   TriggerClientEvent("0R.ADMIN.SENDNUI", id, { action = "request_conf", url = url })
    end
end)
 
		
-- RegisterServerEvent('0R.ADMIN.CLEARINV')
-- AddEventHandler('0R.ADMIN.CLEARINV', function(id)
--     if PermCheck(source, 'clearinv') then
-- 	   local xPlayer = QBCore.Functions.GetPlayer(source)
--       local items = xPlayer.PlayerData.items
--       xPlayer.Functions.RemoveItem(items, )
--     end
-- end)

RegisterServerEvent('0R.ADMIN.GIVECAR')
AddEventHandler('0R.ADMIN.GIVECAR', function(id, carmodel, own)
   if PermCheck(source, 'givecar') then
      local vehicle = CreateVehicle(carmodel, GetEntityCoords(GetPlayerPed(id)), GetEntityHeading(GetPlayerPed(id)), true, false)
	  SetPedIntoVehicle(GetPlayerPed(id), vehicle, -1)
	  if own then 
          if PermCheck(source, 'giveownedcar') then
		    Wait(1000)
            TriggerClientEvent('0R.CL.GET.VEHICLEPROPS', id, vehicle)
		  end
	  end 
   end
end)

RegisterServerEvent('0R.SET.VEHICLEPROPS')
AddEventHandler('0R.SET.VEHICLEPROPS', function(vehicle, props)
   local src = source
   if PermCheck(src, 'giveownedcar') then
     local xPlayer = QBCore.Functions.GetPlayer(src)
	 TriggerClientEvent("0R.ADMIN.SENDNUI", src, { action = "notify", value = L('PROCESS') })
     exports.ghmattimysql:execute("INSERT INTO player_vehicles (license, citizenid, plate, vehicle, mods, hash) VALUES ('"..xPlayer.PlayerData.license.."','"..xPlayer.PlayerData.citizenid.."', '"..props.plate.."','"..props.model.."','"..json.encode(props).."','"..GetHashKey(props.model).."')", {  })
   end
end)

RegisterServerEvent('0R.ADMIN.WIPE')
AddEventHandler('0R.ADMIN.WIPE', function(id)
   if PermCheck(source, 'wipe') then
     local xPlayer = QBCore.Functions.GetPlayer(id)
 --    local citizenid = QBCore.Functions.GetPlayer.PlayerData.citizenid
	 local wipetables = { 
	    { table = "player_vehicles", column = "citizenid"},
		{ table = "players", column = "citizenid"},
		{ table = "playerskins", column = "citizenid"},
		{ table = "player_outfitst", column = "citizenid"},
	 }
	 TriggerClientEvent("0R.ADMIN.SENDNUI", source, { action = "notify", value = L('WIPE1') })
	 for k, v in pairs(wipetables) do
	   exports.ghmattimysql:executeSync("DELETE FROM "..v.table.." WHERE "..v.column.." like '%"..xPlayer.PlayerData.citizenid.."%' ", {  }) 
	   Wait(5000)
	   if k == #wipetables then 
	      DropPlayer(id, "[0R-ADMIN] | "..L('WIPE2'));
		  break;
	   end
     end
      
   end
end)


RegisterServerEvent('0R.ADMIN.WIPEOFFLINE')
AddEventHandler('0R.ADMIN.WIPEOFFLINE', function(identifier)
   if PermCheck(source, 'wipeoffline') then
     local xPlayer = QBCore.Functions.GetPlayer(id)
	 local wipetables = { 
      { table = "player_vehicles", column = "citizenid"},
		{ table = "players", column = "citizenid"},
		{ table = "playerskins", column = "citizenid"},
		{ table = "player_outfitst", column = "citizenid"},
	 }
	 TriggerClientEvent("0R.ADMIN.SENDNUI", source, { action = "notify", value = L('WIPE1') })
	 for k, v in pairs(wipetables) do
	   exports.ghmattimysql:executeSync("DELETE FROM "..v.table.." WHERE "..v.column.." like '%"..identifier.."%' ", {  }) 
	   Wait(5000)
	   if k == #wipetables then 
	      DropPlayer(id, "[0R-ADMIN] | "..L('WIPE2'));
		  break;
	   end
     end
      
   end
end)


RegisterServerEvent('0R.ADMIN.BANPLAYEROFFLINE')
AddEventHandler('0R.ADMIN.BANPLAYEROFFLINE', function(identifier, reason)
   if PermCheck(source, 'banoffline') then
    exports.ghmattimysql:execute("INSERT INTO `0r-bans` (identifier, reason) VALUES ('"..identifier.."', '"..reason.."')", { })
   end
end)

RegisterServerEvent('0R.ADMIN.SETTIME')
AddEventHandler('0R.ADMIN.SETTIME', function(clock, min, type)
   if PermCheck(source, 'time') then
     if type == "set" then 
      ExecuteCommand("time "..clock.." "..min)
	 elseif type == "freeze" then 
	  ExecuteCommand("freezetime")
	 end
   end
end)

RegisterServerEvent('0R.ADMIN.SETWEATHER')
AddEventHandler('0R.ADMIN.SETWEATHER', function(weather, type)
   if PermCheck(source, 'weather') then
      if type == "set" then 
       ExecuteCommand("weather "..weather)
	  elseif type == "freeze" then 
	   ExecuteCommand("freezeweather")
	  end
   end
end)
 
RegisterServerEvent('0R.ADMIN.PLAYERBLIPS')
AddEventHandler('0R.ADMIN.PLAYERBLIPS', function(bool)
   if PermCheck(source, 'playerblips') then
      TriggerClientEvent("0R.ADMIN.SHOWBLIPS", source, QBCore.Functions.GetPlayers())
   end
end)

RegisterServerEvent('0R.ADMIN.ANNOUNCEMENT')
AddEventHandler('0R.ADMIN.ANNOUNCEMENT', function(text)
   if PermCheck(source, 'announcement') then
      TriggerClientEvent("0R.ADMIN.SENDNUI", -1, { action = "Announcement", value = text, perm = PermCheck(source, 'announcement') })
   end
end)

RegisterServerEvent('0R.ADMIN.REVIVEALL')
AddEventHandler('0R.ADMIN.REVIVEALL', function()
   if PermCheck(source, 'reviveall') then
      for k, v in pairs(QBCore.Functions.GetPlayers()) do
       TriggerClientEvent('hospital:client:Revive', v)
      end
   end
end)

RegisterServerEvent('0R.ADMIN.BRINGALL')
AddEventHandler('0R.ADMIN.BRINGALL', function()
   if PermCheck(source, 'bringall') then
      for k, v in pairs(QBCore.Functions.GetPlayers()) do
        SetEntityCoords(GetPlayerPed(source), GetEntityCoords(GetPlayerPed(v)))
      end
   end
end)

RegisterServerEvent('0R.ADMIN.KICKALL')
AddEventHandler('0R.ADMIN.KICKALL', function(reason)
   if PermCheck(source, 'kickall') then
      for k, v in pairs(QBCore.Functions.GetPlayers()) do
        DropPlayer(v, "[0R-ADMIN] | "..L('KICKED_1').." "..GetPlayerName(source).." \n "..L('KICKED_2')..": "..reason);
      end
   end
end)

RegisterServerEvent('0R.ADMIN.DELETEALLCARS')
AddEventHandler('0R.ADMIN.DELETEALLCARS', function()
   if PermCheck(source, 'deleteallcars') then
      TriggerClientEvent("0R.CL.ADMIN.DELETEALLCARS", -1)
   end
end)


QBCore.Functions.CreateCallback('0R.ADMIN.GETPLAYER', function(source, cb, id)
   if PermCheck(source, 'playerblips') then 
	  cb({ name = GetPlayerName(id), ped = GetPlayerPed(id), coords = GetEntityCoords(GetPlayerPed(id)) })
   end   
end)
 
QBCore.Functions.CreateCallback('0R.ADMIN.PERMCHECK', function(source, cb, perm)
    cb(PermCheck(source, perm))
end)
 
function PermCheck(source, perm) 
   local xPlayer = QBCore.Functions.GetPlayer(source)
   local auth = false
   local acsess = false
 
   for k, v in pairs(Config.Auth) do
      if v.identifier == xPlayer.PlayerData.license then
	      auth = v.perm
		  break;
	   end
   end
   
   if auth then
     for k, v in pairs(Config.Perms[auth]) do
	    acsess = false
	    if v == perm then 
		   acsess = true 
		   break;
		end
	 end
   else
	acsess = false
   end
   
   return acsess
end


 



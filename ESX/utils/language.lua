Lang = {}

Lang.Language = 'en'  

Lang.Languages = {
    ['en'] = {
        ["CHECKING_BANLIST"] = "Checking ban list...",
		["URE_BANNED"] = "You have been banned on this server! \nReason: ",
		["PROCESS"] = "Process was successful!",
		["KICKED_1"] = "You were kicked from the server by",
		["KICKED_2"] = "Reason",
		["PLAYER"] = "Player",
		["JOB"] = "Job successfully gived",
		["WIPE1"] = "Wipe porcess started! This process may take 15-30 seconds.",
		["WIPE2"] = "You were kicked from the server  \n Reason: Wipe",
		["PLAYER_LIST"] = "Player List",
		["SERVER_SETTINGS"] = "Server Settings",
		["DEV_TOOLS"] = "Dev Tools",
		["BANS"] = "Bans",
		["CLOSE"] = "Close",
		
		["REVIVE"] = "Revive",
		["GOTO"] = "Bring",
		["BRING"] = "Goto",
		["HEAL"] = "Heal",
		["KILL"] = "Kill",
		["KICK"] = "Kick",
		["BAN"] = "Ban",
		["GIVECAR"] = "Give Car",
		["GIVEOWNED"] = "Give Owned Car",
		["FREEZE"] = "Freeze",
		["OPENINV"] = "Open Inventory",
		["CLEARINV"] = "Clear Inventory",
		["GIVEITEM"] = "Give Item",
		["SETJOB"] = "Set Job",
		["TAKESHOT"] = "Take Screenshot",
		["WIPEPLAYER"] = "Wipe player",
		
		["DEVTOOLS"] = "DEV TOOLS",
		["TPM"] = "Teleport to mark",
		["SUICIDE"] = "Suicide",
		["FIXCAR"] = "Fix car",
		["VECTOR3"] = "Vector3 Coords Copy",
		["VECTOR4"] = "Vector4 Coords Copy",
		["HEADING"] = "Heading Copy",
		["NOCLIP"] = "Noclip",
		["VANISH"] = "Vanish",
		
		
		["SERVERSETTINGS"] = "SERVER SETTINGS",
		["SETTIME"] = "Set Time",
		["SETWEATHER"] = "Set Weather",
		["FREEZETIME"] = "Freeze Time",
		["FREEZEWEATHER"] = "Freeze Weather",
		["PLAYERBLIPS"] = "Player Blips",
		["CLEARAREA"] = "Clear Area",
		["ANNO"] = "Announcement",
		["REVIVEALL"] = "Revive all",
		["BRINGALL"] = "Bring all",
		["KICKALL"] = "Kick all",
		["DELETEALL"] = "Delete all Cars",
		["WIPEOFF"] = "Wipe offline",
		["BANOFF"] = "Ban offline",
		
		["PLAYERNAME"] = "PLAYER NAME",
		["PRESSENTER"] = "Press Enter To Accept Or Press ESC To Deny",
		["AVAIBLETYPES"] = "Available types",
		["CLEANJUDGE"] = "Clear All Judges",
	},

	['tr'] = {
        ["CHECKING_BANLIST"] = "Banlist sorgulaniyor...",
		["URE_BANNED"] = "Banlisin giremezsin top! \nsebep: ",
		["PROCESS"] = "İslem basarili!",
		["KICKED_1"] = "Sunucudan kicklendin by",
		["KICKED_2"] = "Sebep",
		["PLAYER"] = "Player",
		["JOB"] = "Meslek basariyla verildi",
		["WIPE1"] = "Silme işlemi başladı! Bu işlem 15-30 saniye sürebilir.",
		["WIPE2"] = "Sunucudan atildin  \n Reason: Wipe",
		["PLAYER_LIST"] = "Oyuncu Listesi",
		["SERVER_SETTINGS"] = "Sunucu Ayarları",
		["DEV_TOOLS"] = "Dev Tools",
		["BANS"] = "Banlist",
		["CLOSE"] = "Close",
		
		["REVIVE"] = "Revive",
		["GOTO"] = "Go to",
		["BRING"] = "Bring",
		["HEAL"] = "Heal",
		["KILL"] = "Kill",
		["KICK"] = "Kick",
		["BAN"] = "Ban",
		["GIVECAR"] = "Arac Ver",
		["GIVEOWNED"] = "Data Arac Ver",
		["FREEZE"] = "Freeze",
		["OPENINV"] = "Envanteri Ac",
		["CLEARINV"] = "Envanteri Temizle",
		["GIVEITEM"] = "Item ver",
		["SETJOB"] = "Meslek Ver",
		["TAKESHOT"] = "Ekranini Kontrol Et",
		["WIPEPLAYER"] = "Wipe oyuncu",
		
		["DEVTOOLS"] = "DEV TOOLS",
		["TPM"] = "Tpm",
		["SUICIDE"] = "Kendini Öldür",
		["FIXCAR"] = "Fix Araba",
		["VECTOR3"] = "Vector3 Coords Kopyala",
		["VECTOR4"] = "Vector4 Coords Kopyala",
		["HEADING"] = "Heading Kopyala",
		["NOCLIP"] = "Noclip",
		["VANISH"] = "Görünmez",
		
		
		["SERVERSETTINGS"] = "SERVER AYARLARI",
		["SETTIME"] = "Set Time",
		["SETWEATHER"] = "Set Weather",
		["FREEZETIME"] = "Freeze Time",
		["FREEZEWEATHER"] = "Freeze Weather",
		["PLAYERBLIPS"] = "Player Blips",
		["CLEARAREA"] = "Clear Area",
		["ANNO"] = "Announcement",
		["REVIVEALL"] = "Revive all",
		["BRINGALL"] = "Bring all",
		["KICKALL"] = "Kick all",
		["DELETEALL"] = "Delete all Cars",
		["WIPEOFF"] = "Wipe offline",
		["BANOFF"] = "Ban offline",
		
		["PLAYERNAME"] = "PLAYER NAME",
		["PRESSENTER"] = "Press Enter To Accept Or Press ESC To Deny",
		["AVAIBLETYPES"] = "Available types",
		["CLEANJUDGE"] = "Tüm kamuları sil",
	},
	
}



L = function(item)
    local lang = Lang.Languages[Lang.Language]

    if lang and lang[item] then
        return lang[item]
    end

    return item
end

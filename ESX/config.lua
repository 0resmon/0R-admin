Config = {
    ImageWebhook = "Webhook",
    InventoryType = "qb-inventory", -- or m3_inventoryhud
    StatusEsx = true,
    Auth = {
        {
            name = "NAME",
            identifier = "İDENTIFIER",
            perm = "PERM"
        }
    },
    Perms = {
        ["admin"] = {
            'auth',
            'revive',
            'heal',
            'goto',
            'bring',
            'kill',
            'kick',
            'ban',
            'givecar',
            'giveownedcar',
            'freeze',
            'openinv',
            'clearinv',
            'giveitem',
            'setjob',
            'takess',
            'wipe',
            'weather',
            'time',
            'playerblips',
            'cleararea',
            'announcement',
            'reviveall',
            'bringall',
            'kickall',
            'deleteallcars',
            'wipeoffline',
            'banoffline',
            'tpm',
            'fixcar',
            'copy',
            'noclip',
            'vanish',
            'playerlist',
            'bansshow',
            'bansdelete',
            'judge' 
        },
        ["moderaor"] = {
            'auth',
            'revive',
            'heal',
            'goto',
            'bring',
            'kick',
            'setjob' 
        }
    }
}
 

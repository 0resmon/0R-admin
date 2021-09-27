# 0R-admin

[![Discord](https://img.shields.io/discord/774651073746829332?label=Discord&logo=Discord)][discord]


A simple admin menu 

Open key ``` insert ``` 

Noclip + Vanish ``` delete ```

## HOW TO INSTALL

read sql into ur database, and start to script :)

## PERMISSION USAGE

Auth Table ``` Config.Auth = { } ``` 

Example Auth in auth table  ``` { name = "s4", identifier = "steam:hex", perm = "admin" } ``` 

Perms Table  ``` Config.Perms = { } ``` 

Example Perm assignment ``` ["admin"]  = { 'auth', 'revive', 'heal', 'goto', 'bring','kick', 'setjob' } ``` 

Example Perm assignment for auth table  ``` perm = "admin" ``` 


## PERMISSION LIST

- ```auth``` For acsess menu
- ```revive``` For revive target player
- ```heal```  For heal target player
- ```goto``` For go to target player
- ```bring``` For bring to target player
- ```kill```  For kill to target player
- ```kick``` For kick to target player
- ```ban``` For ban to target player
- ```givecar``` For spawn car to target player
- ```giveownedcar``` For give owned car to target player
- ```freeze``` For freeze to target player
- ```openinv``` For open to target player inventory
- ```clearinv``` For clear to target player inventory
- ```giveitem``` For give item to target player 
- ```setjob``` For set job to target player
- ```takess``` For get target player screenshot
- ```wipe``` For wipe target player
- ```weather``` For change server weather
- ```time``` For change server time
- ```playerblips``` For show on active player blips
- ```cleararea``` For clear 150 distance area (Vehicle/Props)
- ```announcement``` For Send announcement all active players
- ```reviveall``` For revive all active players 
- ```bringall```  For bring all active players 
- ```kickall```  For kick all active players 
- ```deleteallcars``` For clear all near active players vehicles
- ```wipeoffline```  For wipe offline player
- ```banoffline``` For ban offline player 
- ```tpm```  For target to target marker
- ```fixcar```  For fix vehicle in player
- ```copy```  For copy vector3, vector3 & heading coords
- ```noclip``` For self noclip
- ```vanish```   For self vanish (invisibility)
- ```playerlist```  For show playerlist 
- ```bansshow```  For show ban list
- ```bansdelete```  For delete bans
- ```judge```  For remove all community services


[discord]: https://discord.gg/X53Wk927sG

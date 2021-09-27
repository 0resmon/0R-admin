fx_version 'adamant'
game 'gta5'

ui_page "html/index.html"

client_scripts {
    'client.lua',
	-- UTILS --
	'utils/entityiter.lua', -- https://gist.github.com/IllidanS4/9865ed17f60576425369fc1da70259b2
	'utils/Instructional_Buttons.lua', -- https://github.com/AntwanR942/No-clip/
	'utils/No-clip.lua', -- https://github.com/AntwanR942/No-clip/
	
}

server_scripts {
    'utils/language.lua',
    'config.lua',
    'server.lua',
}
 

files {
    "script.js",
    'html/*.html',
    'html/js/*.js',
    'html/css/*.css'
}


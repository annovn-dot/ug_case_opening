fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author "BOGi"
name "Case opening"
description "The Underground - Case opening"
version "4.2.0"

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/app.js',
    'web/style.css',
    'web/sounds/*.ogg'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config/cfg_settings.lua',
    'config/cfg_cases.lua',
    'config/cfg_shops.lua'
}

client_scripts {
    'client/cl_bridge.lua',
    'client/cl_main.lua'
}

server_scripts {
    'server/sv_bridge.lua',
    'server/sv_main.lua'
}

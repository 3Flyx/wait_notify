fx_version 'bodacious'
game 'gta5'
lua54 'yes'

ui_page "html/index.html"

export "SetQueueMax"
export "SendNotification"

files {
    "html/index.html",
    "html/notify.js",
    "html/noty.js",
    "html/noty.css",
    "html/themes.css",
    "html/sound-example.wav",
    "html/notif.wav"
}

client_script '@wait_loader/c_loader.lua'
server_script '@wait_loader/s_loader.lua'
my_data 'client_files' { "cl_notify.lua" }
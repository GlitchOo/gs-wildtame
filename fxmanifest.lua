fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

author 'Glitch0o'
description 'A taming system for RedM/Vorp Core with skill check'
version '1.0.0'

shared_scripts {
    'shared/*.lua'
}

client_script {
    'client/main.lua'
}

dependencies {
    'mor-lock'
}

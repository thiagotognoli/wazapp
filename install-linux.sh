#!/bin/bash

currentDir=$(sed -e "s/\/[^\/]*$//" <<< `readlink -f "$0"`)
currentDirWithSpace=$(echo "$currentDir" | sed 's/ /\\s/g')


#xprop | grep 'CLASS'
echo -e '[Desktop Entry]\nName=wazapp\nGenericName=wazapp\nExec='"$currentDirWithSpace"'/run.sh\nTerminal=false\nStartupNotify=false\nType=Application\nIcon='"$currentDirWithSpace"'/assets/icons/icon.png\nStartupWMClass=ws-custom-client\nComment=Unofficial desktop client for WhatsApp Web\nCategories=Network\nTryExec='"$currentDirWithSpace"'/run.sh\nActions=' | tee "$HOME/.local/share/applications/wazapp.desktop"
#/usr/share/applications
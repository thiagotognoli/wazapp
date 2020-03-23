#!/bin/bash

currentDir=$(sed -e "s/\/[^\/]*$//" <<< `readlink -f "$0"`)
currentDirWithSpace=$(echo "$currentDir" | sed 's/ /\\s/g')

cd $currentDir
npm install
npm run build
mv dist/*.AppImage dist/wazapp.AppImage
chmod a+x dist/wazapp.AppImage

#xprop | grep 'CLASS'
echo -e '[Desktop Entry]\nName=wazapp\nGenericName=wazapp\nExec='"$currentDirWithSpace"'/dist/wazapp.AppImage\nTerminal=false\nStartupNotify=false\nType=Application\nIcon='"$currentDirWithSpace"'/assets/icons/icon.png\nStartupWMClass=ws-custom-client\nComment=Unofficial desktop client for WhatsApp Web\nCategories=Network\nTryExec='"$currentDirWithSpace"'/dist/wazapp.AppImage\nActions=' | tee "$HOME/.local/share/applications/wazapp.desktop"
#/usr/share/applications
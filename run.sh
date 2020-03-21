#!/bin/bash

currentDir=$(sed -e "s/\/[^\/]*$//" <<< `readlink -f "$0"`)


cd "$currentDir"

npm start

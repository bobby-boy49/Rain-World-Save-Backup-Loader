#!/bin/bash

# Backup/Load Rain World Save.

mkdir "Backup_Saves"

SD=1 # OK button return code =0 , all others =1
mover=0
while [ $SD -eq 1 ]; do
  ans=$(zenity --info --title 'Rain World Save Backup Loader' \
      --text="Pick A Option!" --no-wrap \
      --ok-label Quit \
      --extra-button "Backup Rain World Save" \
      --extra-button "Restore Save Backup" \
       )
  
  
  SD=$?
  echo "${SD}-${ans}"
  echo $ans
  if [[ $ans = "Backup Rain World Save" ]]
  then
	  
	  rm -r "/home/deck/CUSTOM PROGRAM FILES/Backup_Saves/Rain World"
	  cp -r "/home/deck/.local/share/Steam/steamapps/compatdata/312520/pfx/drive_c/users/steamuser/AppData/LocalLow/Videocult/Rain World" "/home/deck/CUSTOM PROGRAM FILES/Backup_Saves"
          zenity --info --title="Success" --text="Sucessfully Backed Up Save!" --no-wrap
  	  SD=0
  
  
  
  elif [[ $ans = "Restore Save Backup" ]]
  then
          rm -r "/home/deck/.local/share/Steam/steamapps/compatdata/312520/pfx/drive_c/users/steamuser/AppData/LocalLow/Videocult/Rain World"
          cp -r "/home/deck/CUSTOM PROGRAM FILES/Backup_Saves/Rain World" "/home/deck/.local/share/Steam/steamapps/compatdata/312520/pfx/drive_c/users/steamuser/AppData/LocalLow/Videocult/Rain World"
	  zenity --info --title="Success" --text="Backup Was Restored!" --no-wrap
      	  SD=0
  
    fi
done

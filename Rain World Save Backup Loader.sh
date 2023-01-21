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
	  
	  rm -r "Backup_Saves/Rain World"
	  pwd | xargs -I {} cp -r "{}/AppData/LocalLow/Videocult/Rain World" Backup_Saves/
          zenity --info --title="Success" --text="Sucessfully Backed Up Save!" --no-wrap
  	  SD=0
  
  
  
  elif [[ $ans = "Restore Save Backup" ]]
  then
          pwd | xargs -I {} rm -r "{}/AppData/LocalLow/Videocult/Rain World"
	  pwd | xargs -I {} cp -r "Backup_Saves/Rain World" "{}/AppData/LocalLow/Videocult/Rain World"
	  zenity --info --title="Success" --text="Backup Was Restored!" --no-wrap
      	  SD=0
  
    fi
done

#!/bin/bash
if [ 'XX' != 'XX'"$1" ]; then 
 if [ -f "$1"  ]; then
# mime part start
  IsIt=$(file "$1" --mime-type -b);
  NeedImageOnly="ItIs_"${IsIt/'/'*/}
   if [ "$NeedImageOnly" == "ItIs_image" ] ; then
# mime part end
ImageInfoFEH=($(feh -l "$1"))
IfDamaged=${?}
ImageType=${ImageInfoFEH[9]}
   Height=${ImageInfoFEH[11]}
    Width=${ImageInfoFEH[10]}
   if [ "$IfDamaged" != '0'  ]; then 
    echo "$1" "Damaged" "${IfDamaged}";
   fi;
    echo "$1"'|'W'|'$Width'|'H'|'$Height'|'Format'|'$ImageType'|'Errors'|'$IfDamaged'|' >> collect-info-about-images.txt
# mime part start
  fi
# mime part end
   else
    echo The « "$1" » is not a valid file name.
  fi
 else
  ScriptsName=${0##*/}
   find -type f -exec sh -e "./$ScriptsName" "{}" \;
  #find -type f  -name "*.jpg" -o -name "*.gif" -o -name "*.png" -exec sh -e "./$ScriptsName" "{}" \;
fi

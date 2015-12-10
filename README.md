# photo-stats

Requirements
 * ExifTool: http://www.sno.phy.queensu.ca/~phil/exiftool/
 * R

Command line:
 * exiftool -if '$focallength' -if '$model eq "Canon EOS REBEL T3"' -T -s -R -directory -filename -focallength# -ext CR2 -ext JPG $1
 * exiftool -if '$focallength' -if '$model eq "Canon EOS REBEL T3"' -csv -q -s -R -ISO -createdate -aperture -shutterspeed -focallength -lens -ext CR2 -ext JPG $1

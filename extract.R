folders<-c("~/Pictures/2014", "~/Pictures/2015")
for (f in folders) {
  print(f)
  outFilename <- paste0(basename(f), ".csv")
  system(paste("exiftool -if '$focallength' -if '$model eq \"Canon EOS REBEL T3\"' -csv -q -s -R -ISO -createdate -aperture -shutterspeed -focallength -lens -ext CR2 -ext JPG",f, ">", outFilename))
}
sleep 0s
killall conky
cd "/home/al/.conky/TeejeeTech"
conky -c "/home/al/.conky/TeejeeTech/Network Panel" &
cd "/home/al/.conky/conky_rings/Conky"
conky -c "/home/al/.conky/conky_rings/Conky/cpu" &
cd "/home/al/.conky/conky_rings/Conky"
conky -c "/home/al/.conky/conky_rings/Conky/mem" &
cd "/home/al/.conky/conky_rings/Conky"
conky -c "/home/al/.conky/conky_rings/Conky/notes" &
cd "/home/al/.conky/conky_rings/Conky"
conky -c "/home/al/.conky/conky_rings/Conky/rings" &

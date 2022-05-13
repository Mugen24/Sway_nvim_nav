#!/bin/bash
nvim_plug_path="${HOME}/.config/nvim/plugin"
path="/usr/local/bin"
sway_config_path="${HOME}/.config/sway/config"

if [[ ! -d $nvim_plug_path ]]
then
    mkdir -p $nvim_plug_path
fi
cp -r sway_vim_nav/ $nvim_plug_path

cp sway_focus $path
echo -e '
\n\n

bindsym Control+h exec "sway_focus left"
bindsym Control+j exec "sway_focus down"
bindsym Control+k exec "sway_focus up"
bindsym Control+l exec "sway_focus right"
' >> $sway_config_path

#cython sway_focus.pyx --embed
#gcc -Os -I /usr/include/python3.10 -o sway_focus2 sway_focus2.c -lpython3.10 -lpthread -lm -lutil -ldl


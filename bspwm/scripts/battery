#!/bin/bash

level=$(acpi -b | cut -d "," -f2 | sed 's/%//g')
power=$(acpi -b | grep -c "Full")
if [[ $power -eq 1 && $level -eq 100 ]]
then
export DISPLAY=:0.0
dunstify -t 2500 -i ~/.config/dunst/icons/energy.png "Batería cargada." "Nivel: $level%. Retira el cargador"
espeak -vvenezuala-mbrola-1+f1 -s 150 "Batería cargada. Nivel: $level%. Retira el cargador" 
fi
if [[ $power -eq 0 && $level -gt 30 ]]
then
export DISPLAY=:0.0
dunstify -t 2500 -i ~/.config/dunst/icons/rem-ram.png "Batería aceptable.";
espeak -vvenezuala-mbrola-1+f2 -s 120 "Batería aceptable" 
fi
if [[ $power -eq 0 && $level -lt 20 ]]
then
export DISPLAY=:0.0
dunstify -t 2500 -i ~/.config/dunst/icons/rem-ram.png "Batería baja." "Nivel: $level%. Conecta el cargador" 
espeak -vvenezuala-mbrola-1+f1 -s 150 "Batería baja. Nivel: $level%. Conecta el cargador"
fi


#!/bin/bash
LOW_CAPACITY_PERCENT_THRESHOLD=$((${1:-20}+0))
while true
do
	for bat in $(cd /sys/class/power_supply; ls -1d BAT*)
	do
		if ! grep -q Charging /sys/class/power_supply/${bat}/status
		then
			if grep -q Critical /sys/class/power_supply/${bat}/capacity_level
			then
				i3-nagbar -t critical -m "${bat} is critical: $(cat /sys/class/power_supply/${bat}/capacity)% remaining" &
				sleep 45
			elif grep -q Low /sys/class/power_supply/${bat}/capacity_level
			then
				i3-nagbar -t warning -m "${bat} is low: $(cat /sys/class/power_supply/${bat}/capacity)% remaining" &
				sleep 180
			elif [ $(($(cat /sys/class/power_supply/BAT0/capacity)+0)) -lt $LOW_CAPACITY_PERCENT_THRESHOLD ]
			then
				i3-nagbar -t warning -m "${bat} is low: $(cat /sys/class/power_supply/${bat}/capacity)% remaining" &
				sleep 360
			else
				sleep 120
			fi
		fi
	done
	sleep 120
done

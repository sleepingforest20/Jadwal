#!/bin/bash

# Variable
blue='\e[1;34m'
cyan='\e[1;36m'
cyan1='\e[0;36m'
green='\e[1;32m'
ungu='\e[0;35m'
magenta='\e[1;35m'
red='\e[1;31m'
yellow='\e[1;33m'
white='\e[1;37m'

useragent="Mozilla/5.0 (Linux; Android 7.1.2; Redmi 4X) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.90 Mobile Safari/537.36"

data(){
	curl -s -A "${useragent}" "https://time.siswadi.com/pray/${kota}" >> log.ini
	if [[ $(cat log.ini | grep -Po '(?<="error":").*?(?=")') == "invalid address g118" ]]; then
		echo -e $red"[!]$white Anda salah memasukan nama kota..."
		sleep 1
		echo -e $red"[!]$white Silahkan coba lagi."
		sleep 1
	else
		LozShubuh=$(cat log.ini | grep -Po '(?<="Fajr": ").*?(?=")')
		LozDzuhur=$(cat log.ini | grep -Po '(?<="Dhuhr": ").*?(?=")')
		LozAshar=$(cat log.ini | grep -Po '(?<="Asr": ").*?(?=")')
		LozMaghrib=$(cat log.ini | grep -Po '(?<="Maghrib": ").*?(?=")')
		LozIsya=$(cat log.ini | grep -Po '(?<="Isha": ").*?(?=")')
		Lozstm=$(cat log.ini | grep -Po '(?<="SepertigaMalam": ").*?(?=")')
		Loztm=$(cat log.ini | grep -Po '(?<="TengahMalam": ").*?(?=")')
		Lozdtm=$(cat log.ini | grep -Po '(?<="DuapertigaMalam": ").*?(?=")')
		LozSunrise=$(cat log.ini | grep -Po '(?<="Sunrise": ").*?(?=")')
		LozSunset=$(cat log.ini | grep -Po '(?<="Sunset": ").*?(?=")')
		LozKota=$(cat log.ini | grep -Po '(?<="address": ").*?(?=")')
		LozMethod=$(cat log.ini | grep -Po '(?<="method": ").*?(?=")')
		Loztz=$(cat log.ini | grep -Po '(?<="timezone": ").*?(?=")')

		echo -e $green"[•]$blue Tanggal  : $cyan1`date '+%A, %d-%B-%Y'`"
		echo -e $green"[•]$blue Kota     : $cyan1$LozKota"
		echo -e $green"[•]$blue Timezone : $cyan1$Loztz"
		echo -e "======================================================================" | lolcat
		echo -e $green"=>$cyan Shubuh   : $magenta$LozShubuh `date +%Z`             $ungu ~$cyan Sepertiga Malam  : $magenta$Lozstm `date +%Z`$green <="
		echo -e $green"=>$cyan Dzuhur   : $magenta$LozDzuhur `date +%Z`             $ungu ~$cyan Tengah Malam     : $magenta$Loztm `date +%Z`$green <="
		echo -e $green"=>$cyan Ashar    : $magenta$LozAshar `date +%Z`             $ungu ~$cyan Duapertiga Malam : $magenta$Lozdtm `date +%Z`$green <="
		echo -e $green"=>$cyan Maghrib  : $magenta$LozMaghrib `date +%Z`             $ungu ~$cyan Sunrise          : $magenta$LozSunrise `date +%Z`$green <="
		echo -e $green"=>$cyan Isya     : $magenta$LozIsya `date +%Z`             $ungu ~$cyan Sunset           : $magenta$LozSunset `date +%Z`$green <="
		echo -e "======================================================================" | lolcat
		
	fi
}

banner(){
	figlet -f future "     Jadwal Sholat" | lolcat
}

clear
banner
echo -e $yellow""
read -p "Kota di mana anda berada: " kota;
clear
banner
echo -e ""
data
python text.py
rm -f log.ini


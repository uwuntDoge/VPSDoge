 #!/bin/bash
clear
cd $HOME
SCPdir="/etc/newadm"
mkdir ${SCPdir} &>/dev/null
SCPinstal="$HOME/install"
SCPidioma="${SCPdir}/idioma"
SCPusr="${SCPdir}/ger-user"
SCPfrm="/etc/ger-frm"
SCPinst="/etc/ger-inst"
#SCRIPT INTERNO BY KALIX1
#TESTIANDO SCRIPTS
msg () {
BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' &&NEGRITO='\e[1m' && SEMCOR='\e[0m'
 case $1 in
  -ne)cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -ama)cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verm)cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azu)cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verd)cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;  -bra)cor="${BRAN}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -bar2)cor="\e[0;31m========================================\e[0m" && echo -e "${cor}${SEMCOR}";;
  -bar)cor="\e[1;31m——————————————————————————————————————————————————————" && echo -e "${cor}${SEMCOR}";;
 esac
}
fun_ip () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}
#IP=$(wget -qO- ipv4.icanhazip.com)

function_verify () {

  ### INTALAR VERCION DE SCRIPT
  v1=$(curl -sSL "https://raw.githubusercontent.com/lacasitamx/scripts/master/vercion")
  echo "$v1" > /etc/versin_script
  }
#testiando

fun_ip
clear
msg -bar
msg -verm " ESPERE UN MOMENTO"
msg -bar
dpkg --configure -a &>/dev/null
apt-get install software-properties-common -y &>/dev/null
apt-add-repository universe -y &>/dev/null

myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;
mkdir -p /etc/B-ADMuser &>/dev/null
rm -rf /etc/localtime &>/dev/null
ln -s /usr/share/zoneinfo/America/Mexico_City /etc/localtime &>/dev/null
inst_components () {
echo -e "\033[97m"
echo -e "\033[41m -- Instalando paquetes (Requeridos para el inicio) | Cracked by @maybeDoge "
echo -e "\033[100m  PONER ATENCION A INSTALACION PARA SIGUIENTE PREGUNTA"
echo -e "\033[97m"
msg -bar
#grep
apt-get install grep -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "grep"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "grep"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install grep............ $ESTATUS "
#net-tools
apt-get install net-tools -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "net-tools"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "net-tools"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install net-tools....... $ESTATUS "
#gawk
apt-get install gawk -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install gawk............ $ESTATUS "
#mlocate
apt-get install mlocate -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install mlocate......... $ESTATUS "
#lolcat gem
apt-get install lolcat -y &>/dev/null
sudo gem install lolcat &>/dev/null
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install lolcat.......... $ESTATUS "
#at
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] || apt-get install at -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install at.............. $ESTATUS "
#nano
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || apt-get install nano -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install nano............ $ESTATUS "
#bc
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || apt-get install bc -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install bc.............. $ESTATUS "
#lsof
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] || apt-get install lsof -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install lsof............ $ESTATUS "
#figlet
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || apt-get install figlet -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install figlet.......... $ESTATUS "
#cowsay
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || apt-get install cowsay -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install cowsay.......... $ESTATUS "
#screen
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || apt-get install screen -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install screen.......... $ESTATUS "
#python
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] || apt-get install python -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install python.......... $ESTATUS "
#python3
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] || apt-get install python3 -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install python3......... $ESTATUS "
#python3-pip
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] || apt-get install python3-pip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install python3-pip..... $ESTATUS "
#curl
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || apt-get install curl -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install curl............ $ESTATUS "
#ufw
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] || apt-get install ufw -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install ufw............. $ESTATUS "
#unzip
[[ $(dpkg --get-selections|grep -w "unzip"|head -1) ]] || apt-get install unzip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "unzip"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "unzip"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install unzip........... $ESTATUS "
#zip
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] || apt-get install zip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install zip............. $ESTATUS "
#apache2
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || {
 apt-get install apache2 -y &>/dev/null
 sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
 service apache2 restart > /dev/null 2>&1 &
 }
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install apache2......... $ESTATUS "
msg -bar2
}
funcao_idioma () {
msg -bar2
figlet "    maybeDoge " | lolcat
echo -e "   Fallas y errores ortograficos corregidos por maybeDoge"
msg -bar2
pv="$(echo es)"
[[ ${#id} -gt 2 ]] && id="es" || id="$pv"
byinst="true"
}
install_fim () {
msg -ama "               Finalizando Instalacion" && msg bar2
[[ $(find /etc/newadm/ger-user -name nombre.log|grep -w "nombre.log"|head -1) ]] || wget -O /etc/newadm/ger-user/nombre.log https://raw.githubusercontent.com/lacasitamx/VPSMX/master/ArchivosUtilitarios/nombre.log &>/dev/null
[[ $(find /etc/newadm/ger-user -name IDT.log|grep -w "IDT.log"|head -1) ]] || wget -O /etc/newadm/ger-user/IDT.log https://raw.githubusercontent.com/lacasitamx/VPSMX/master/ArchivosUtilitarios/IDT.log &>/dev/null
[[ $(find /etc/newadm/ger-user -name tiemlim.log|grep -w "tiemlim.log"|head -1) ]] || wget -O /etc/newadm/ger-user/tiemlim.log https://raw.githubusercontent.com/lacasitamx/VPSMX/master/ArchivosUtilitarios/tiemlim.log &>/dev/null
msg -bar
sleep 4.s
wget -O /bin/rebootnb https://raw.githubusercontent.com/lacasitamx/VPSMX/master/ArchivosUtilitarios/rebootnb &> /dev/null
chmod +x /bin/rebootnb
wget -O /bin/resetsshdrop https://raw.githubusercontent.com/lacasitamx/VPSMX/master/ArchivosUtilitarios/resetsshdrop &> /dev/null
chmod +x /bin/resetsshdrop
wget -O /etc/versin_script_new https://raw.githubusercontent.com/lacasitamx/scripts/master/vercion &>/dev/null
msg -bar2
#
rm -rf instalscript
echo '#!/bin/sh -e' > /etc/rc.local
sudo chmod +x /etc/rc.local
echo "sudo rebootnb" >> /etc/rc.local
echo "sudo resetsshdrop" >> /etc/rc.local
echo "sleep 2s" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
/bin/cp /etc/skel/.bashrc ~/
echo 'clear' >> .bashrc
echo 'echo ""' >> .bashrc
echo 'echo -e "\033[91m      __     ______  ____        __  ____  __ " '>> .bashrc
echo 'echo -e "\033[91m      \ \   / /  _ \/ ___|      |  \/  \ \/ / " '>> .bashrc
echo 'echo -e "\033[91m       \ \ / /| |_) \___ \ _____| |\/| |\  /   | Cracked by maybeDoge <3 " '>> .bashrc
echo 'echo -e "\033[91m        \ V / |  __/ ___) |_____| |  | |/  \  " '>> .bashrc
echo 'echo -e "\033[91m         \_/  |_|   |____/      |_|  |_/_/\_\ " '>> .bashrc
echo 'echo "" '>> .bashrc
echo 'mess1="$(less /etc/newadm/message.txt)" ' >> .bashrc
echo 'echo "" '>> .bashrc
echo 'echo -e "\033[92m        Cracked by @maybeDoge"'>> .bashrc
echo 'echo "" '>> .bashrc                                          
echo 'echo -e "\033[97m   Comando de inicio: sudo adm | menu "'>> .bashrc
echo 'echo -e "\e[1;35m VERSIÓN: \e[1;31m$(cat /etc/versin_script_new)"'>> .bashrc
echo 'echo ""'>> .bashrc
echo -e "         Comandos de inicio: "
echo -e "\033[1;41m                    sudo adm | menu                        \033[0;37m" && msg -bar2
sleep 5
}
verificar_arq () {
[[ ! -d ${SCPdir} ]] && mkdir ${SCPdir}
[[ ! -d ${SCPusr} ]] && mkdir ${SCPusr}
[[ ! -d ${SCPfrm} ]] && mkdir ${SCPfrm}
[[ ! -d ${SCPinst} ]] && mkdir ${SCPinst}
case $1 in
"menu"|"message.txt")ARQ="${SCPdir}/";; #Menu
"usercodes")ARQ="${SCPusr}/";; #Panel SSRR
"C-SSR.sh")ARQ="${SCPinst}/";; #Instalacao
"openssh.sh")ARQ="${SCPinst}/";; #Instalacao
"squid.sh")ARQ="${SCPinst}/";; #Instalacao
"dropbear.sh")ARQ="${SCPinst}/";; #Instalacao
"openvpn.sh")ARQ="${SCPinst}/";; #Instalacao
"ssl.sh")ARQ="${SCPinst}/";; #Instalacao
"shadowsocks.sh")ARQ="${SCPinst}/";; #Instalacao
"Shadowsocks-libev.sh")ARQ="${SCPinst}/";; #Instalacao
"Shadowsocks-R.sh")ARQ="${SCPinst}/";; #Instalacao
"v2ray.sh")ARQ="${SCPinst}/";; #Instalacao
"budp.sh")ARQ="${SCPinst}/";; #Instalacao
"sockspy.sh"|"PDirect.py"|"PPub.py"|"PPriv.py"|"POpen.py"|"PGet.py")ARQ="${SCPinst}/";; #Instalacao
*)ARQ="${SCPfrm}/";; #Ferramentas
esac
mv -f ${SCPinstal}/$1 ${ARQ}/$1
chmod +x ${ARQ}/$1
}

echo -e "        INSTALANDO PAQUETES........"
inst_components
function_verify
link=https://raw.githubusercontent.com/lacasitamx/scripts/master/REPOSITORY
casita=("ADMbot.sh" "C-SSR.sh" "Crear-Demo.sh" "PDirect.py" "PGet.py" "POpen.py" "PPriv.py" "PPub.py" "Shadowsocks-R.sh" "Shadowsocks-libev.sh" "Unlock-Pass-VULTR.sh" "apacheon.sh" "blockBT.sh" "budp.sh" "dns-netflix.sh" "dropbear.sh" "fai2ban.sh" "gestor.sh" "menu" "message.txt" "openvpn.sh" "paysnd.sh" "ports.sh" "shadowsocks.sh" "sockspy.sh" "speed.sh" "speedtest.py" "squid.sh" "squidpass.sh" "ssl.sh" "tcp.sh" "ultrahost" "usercodes" "utils.sh" "v2ray.sh")
wget -O /usr/bin/trans https://raw.githubusercontent.com/lacasitamx/VPSMX/master/ArchivosUtilitarios/trans &> /dev/null
wget -O /bin/Desbloqueo.sh https://raw.githubusercontent.com/lacasitamx/VPSMX/master/ArchivosUtilitarios/Desbloqueo.sh &> /dev/null
chmod +x /bin/Desbloqueo.sh
wget -O /bin/monitor.sh https://raw.githubusercontent.com/lacasitamx/rex/master/moni/monitor.sh &> /dev/null
chmod +x /bin/monitor.sh
wget -O /var/www/html/estilos.css https://raw.githubusercontent.com/lacasitamx/VPSMX/master/Monitor-Service/estilos.css &> /dev/null
msg -bar2
msg -bar2
msg -ama "     [ VPS - MX - SCRIPT \033[1;97m ❌ MOD By @? ❌\033[1;33m ]"
msg -ama "  \033[1;96m      🔰Usar Ubuntu 18 a 64 De Preferencia🔰 "
msg -bar2
[[ $1 = "" ]] && funcao_idioma || {
[[ ${#1} -gt 2 ]] && funcao_idioma || id="$1"
 }
NOTIFY () {
msg -bar
msg -ama " Notificación remota lol "
msg -bar
echo -e "\033[1;94m Es una opcion para notificar cuando\n un usuario sea bloquedo o este expirado, e info de VPS."
echo -e "\033[1;97m Debe usar el BOT de Telegram @Noti_VPSMX_Bot"
echo -e "\033[1;92m Para sacar su ID solo Meta el comando /MENU en el BOT @USA1_BOT"
echo -e "\033[1;92m Aparecera un pequeño menu donde aparesera su  ? ID"
msg -bar
echo -e "\033[1;97mIngrese un nombre para el VPS:\033[0;37m"; read -p " " nombr
echo "${nombr}" > /etc/newadm/ger-user/nombre.log
echo -e "\033[1;97Ingrese su ID 👤:\033[0;37m"; read -p " " idbot
echo "${idbot}" > /etc/newadm/ger-user/IDT.log
msg -bar
echo -e "\033[1;32m         ID AGREGADO CON EXITO"
msg -bar
NOM="$(less /etc/newadm/ger-user/nombre.log)"
NOM1="$(echo $NOM)"
IDB1=`less /etc/newadm/ger-user/IDT.log` > /dev/null 2>&1
IDB2=`echo $IDB1` > /dev/null 2>&1

KEY="862633455:AAGJ9BBJanzV6yYwLSemNAZAVwn7EyjrtcY"
URL="https://api.telegram.org/bot$KEY/sendMessage"
MSG="⚠️ AVISO DE VPS: $NOM1 ⚠️
👉 MENSAJE DE PRUEBA
🔰 EXITOSO... SALUDOS"
curl -s --max-time 10 -d "chat_id=$IDB2&disable_web_page_preview=1&text=$MSG" $URL &>/dev/null

echo -e "\033[1;34mSE ENVIO MENSAJE DE PRUEBA SI NO LLEGA CONTACTE A @? "
}
#ESTRAYENDO RECURSOS DE LOS ARCHIVOS
pontos="*"
for arqx in ${casita[@]}; do
   stopping="$(source trans -b es:${id} "Descargando Recursos"|sed -e 's/[^a-z -]//ig')"
   msg -verm "${stopping}${pontos}"
   tput cuu1 && tput dl1
   pontos+="*"
        wget -c -P ${SCPinstal} $link/${arqx} &>/dev/null && verificar_arq "${arqx}"
done
sleep 1s
msg -bar
Key="VpsMx/LaCasita/Kalix/v8.1/1K45*456*Fr33"
   cat /etc/bash.bashrc|grep -v '[[ $UID != 0 ]] && TMOUT=15 && export TMOUT' > /etc/bash.bashrc.2
   echo -e '[[ $UID != 0 ]] && TMOUT=15 && export TMOUT' >> /etc/bash.bashrc.2
   mv -f /etc/bash.bashrc.2 /etc/bash.bashrc
   echo "${SCPdir}/menu" > /usr/bin/menu && chmod +x /usr/bin/menu
   echo "${SCPdir}/menu" > /usr/bin/adm && chmod +x /usr/bin/adm
   echo "$Key" > ${SCPdir}/key.txt
   [[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal}
   [[ ${#id} -gt 2 ]] && echo "es" > ${SCPidioma} || echo "${id}" > ${SCPidioma}
   echo -e "${cor[2]}         DESEAS INSTALAR NOTI-BOT?(Default n)"   echo -e "\033[1;34m  (Deves tener Telegram y el BOT: @Noti_VPSMX_Bot)"
   msg -bar2
   read -p " [ s | n ]: " NOTIFY
   [[ "$NOTIFY" = "s" || "$NOTIFY" = "S" ]] && NOTIFY
   msg -bar
   [[ ${byinst} = "true" ]] && install_fim
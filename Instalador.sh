#!/bin/bash

# Verifica si CheckUser está instalado
check_installed() {
    if [ -f "/usr/lib/chall" ]; then
        return 0
    else
        return 1
    fi
}

# Muestra el menú en español
show_menu() {
    clear
    echo -e "\033[46;1;37m         ★ MENÚ CHECKUSER / DTUNNEL ★        \033[0m"
    echo ""
    echo -e "\033[1;34m[ 01 ]\033[1;37m ➤\033[1;33m Instalar CheckUser Multi-Apps"
    echo -e "\033[1;34m[ 02 ]\033[1;37m ➤\033[1;33m Instalar CheckUser Multi-Apps 2025"
    echo -e "\033[1;34m[ 03 ]\033[1;37m ➤\033[1;33m Instalar CheckUser DTunnel-Go"
    echo -e "\033[1;34m[ 00 ]\033[1;37m ➤\033[1;33m Volver al menú"
    echo ""
    echo -e "\033[0;36m──────────────────────────────────────────────\033[0m"
}

# Lee la opción del usuario
get_user_choice() {
    tput civis
    echo -ne "\033[1;32mIngrese una opción:\033[1;37m "; read x
    tput cnorm
}

# Ejecuta la opción elegida
execute_choice() {
    case $x in
    1 | 01)
        if check_installed; then
            chall
        else
            bash <(curl -sL https://raw.githubusercontent.com/PhoenixxZ2023/checkUser2024/main/instcheck.sh) && chall
        fi
        ;;
    2 | 02)
        clear
        checkmanager
        ;;
    3 | 03)
        bash <(curl -sL https://raw.githubusercontent.com/DTunnel0/CheckUser-Go/refs/heads/master/install.sh)
        ;;
    0 | 00)
        clear
        menu
        ;;
    *)
        echo -e "\033[1;31m¡Opción inválida!\033[0m"
        sleep 2
        show_menu
        ;;
    esac
}

# Inicio del script
show_menu
get_user_choice
execute_choice

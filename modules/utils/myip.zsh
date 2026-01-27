# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                                  MYIP                                        ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  Affiche les informations réseau (IP locale et publique)                     ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

myip() {
    echo "\n\033[1;33m=== 📡 INFOS RÉSEAU ===\033[0m\n"

    # --- LOCAL ---
    local intf=$(route get default 2>/dev/null | grep interface | awk '{print $2}')
    intf=${intf:-en0}

    local local_ipv4=$(ipconfig getifaddr "$intf" 2>/dev/null)
    if [[ -z "$local_ipv4" ]]; then
        local_ipv4=$(ifconfig "$intf" 2>/dev/null | grep "inet " | awk '{print $2}')
    fi

    local local_ipv6=$(ifconfig "$intf" 2>/dev/null | grep "inet6 " | grep -v "%" | awk '{print $2}' | head -1)
    if [[ -z "$local_ipv6" ]]; then
         local_ipv6=$(ifconfig "$intf" 2>/dev/null | grep "inet6 " | awk '{print $2}' | head -1)
    fi

    echo "📦 \033[1;34mLOCAL ($intf)\033[0m"
    echo "  ├─ IPv4 : \033[36m${local_ipv4:-Non disponible}\033[0m"
    echo "  └─ IPv6 : \033[36m${local_ipv6:-Non disponible}\033[0m"
    echo ""

    # --- PUBLIC ---
    echo "🌍 \033[1;35mPUBLIC\033[0m"
    local pub_ipv4=$(curl -s4 --max-time 2 https://api.ipify.org || echo "Non disponible")
    echo "  ├─ IPv4 : \033[36m$pub_ipv4\033[0m"
    local pub_ipv6=$(curl -s6 --max-time 2 https://api64.ipify.org || echo "Non disponible")
    echo "  └─ IPv6 : \033[36m$pub_ipv6\033[0m"
    echo ""
}

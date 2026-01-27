# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                                 PORTS                                        ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  Gestionnaire de ports en écoute avec fzf                                    ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

ports() {
    if ! command -v fzf &>/dev/null; then
        echo "❌ ports nécessite 'fzf'. Installe-le avec : brew install fzf"
        return 1
    fi

    local selected_pid=$(
        lsof -iTCP -sTCP:LISTEN -n -P | grep -v "COMMAND" | \
        awk '{
            n=split($9, a, ":");
            port=a[n];
            addr = substr($9, 1, length($9) - length(port) - 1);
            if (addr == "*") addr = "All Interfaces";
            
            cmd = $1;
            if (cmd ~ /node|python|ruby|go|java/) { icon="⚙️ "; }
            else if (cmd ~ /Chrome|Spotlight|Arc/) { icon="🍎"; }
            else { icon="🔹"; }

            print port, $2, icon, cmd, addr
        }' | \
        sort -n | \
        awk '{
            port=$1; pid=$2; icon=$3; cmd=$4;
            addr=""; for (i=5; i<=NF; i++) addr = addr $i " ";
            printf " \033[1;33m%-6s\033[0m  \033[34m%-6s\033[0m  %s  %-15s  \033[37m%s\033[0m\n", port, pid, icon, cmd, addr
        }' | \
        fzf -m --ansi --height 80% --layout reverse \
            --header "  PORT    PID     PROCESS          INTERFACE (Tab=Multi | Enter=Kill)" \
            --preview "echo '🔍 Port {1} (PID {2})'; ps -p {2} -ww -o args" \
            --preview-window=down:3:wrap \
            | awk '{print $2}'
    )

    if [[ -n "$selected_pid" ]]; then
        echo "$selected_pid" | xargs kill -9
        echo "\n💀 \033[1;31mProcessus (Port) tué(s) avec succès.\033[0m"
    fi
}

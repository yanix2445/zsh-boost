# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                                 FKILL                                        ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  Tueur de processus interactif avec fzf                                      ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

fkill() {
    if ! command -v fzf &>/dev/null; then
        echo "❌ fkill nécessite 'fzf'. Installe-le avec : brew install fzf"
        return 1
    fi

    local pid=$(
        ps -x -o pid,%cpu,%mem,lstart,comm | sort -k1,1n | \
        awk '
        BEGIN {
            months["Jan"]="01"; months["Feb"]="02"; months["Mar"]="03"; months["Apr"]="04";
            months["May"]="05"; months["Jun"]="06"; months["Jul"]="07"; months["Aug"]="08";
            months["Sep"]="09"; months["Oct"]="10"; months["Nov"]="11"; months["Dec"]="12";
        }
        NR>1 {
            time_fmt = $7;
            day = sprintf("%02d", $6);
            mon = months[$5];
            year = $8;
            date_fmt = day "/" mon "/" year;
            datetime = time_fmt " " date_fmt;

            split($9, p, "/");
            short_cmd = p[length(p)];

            if ($0 ~ /\.app/) { icon="🍎"; } 
            else if (short_cmd ~ /node|python|ruby|go|java/) { icon="⚙️ "; }
            else { icon="🔹"; }

            printf "\033[1;34m%-6s\033[0m  %5s%%  %5s%%  \033[33m%-19s\033[0m  %s  \033[1;36m%s\033[0m\n", $1, $2, $3, datetime, icon, short_cmd
        }' | \
        fzf -m --ansi --height 80% --layout reverse \
            --header "   PID    CPU%   MEM%   STARTED              PROCESS (Tab=Multi | Enter=Kill)" \
            --preview "echo '🔍 Détails du Processus {1}'; ps -p {1} -ww -o args" \
            --preview-window=down:3:wrap \
            | awk '{print $1}'
    )

    if [[ -n "$pid" ]]; then
        echo "$pid" | xargs kill -9
        echo "\n💀 \033[1;31mProcessus tué(s) avec succès.\033[0m"
    fi
}

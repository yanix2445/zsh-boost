# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                                  JSON                                        ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  Formate et colore du JSON (depuis argument ou stdin)                        ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

json() {
    if [ -t 0 ]; then # Si entrée standard est un terminal (pas de pipe)
        if [ -z "$1" ]; then
            echo "📋 Collage du presse-papier..."
            pbpaste | python3 -m json.tool | bat -l json -p 2>/dev/null || pbpaste | python3 -m json.tool
        else
             cat "$1" | python3 -m json.tool | bat -l json -p 2>/dev/null || cat "$1" | python3 -m json.tool
        fi
    else # Si pipe (ex: curl ... | json)
        python3 -m json.tool | bat -l json -p 2>/dev/null || python3 -m json.tool
    fi
}

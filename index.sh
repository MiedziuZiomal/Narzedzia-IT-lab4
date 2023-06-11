# mdevelopmentBranch

#!/bin/bash

function print_date {
    echo $(date)
}

function create_files {
    local number=$1
    if [[ -z "$number" ]]; then
        number=100
    fi

    for ((i=1;i<=number;i++)); do
        echo -e "Nazwa pliku: log$i.txt\nNazwa skryptu: $0\nData: $(date)" > log$i.txt
    done
}

function print_help {
    echo "Opcje skryptu:"
    echo "--date: wyświetla aktualną datę"
    echo "--logs [number]: tworzy pliki logx.txt, gdzie x to numer pliku od 1 do 100. Jeśli podano liczbę, tworzy tyle plików."
    echo "--help: wyświetla pomoc"
}

case $1 in
    --date) print_date ;;
    --logs) create_files $2 ;;
    --help) print_help ;;
    *) echo "Nieznana opcja: $1. Użyj --help, aby uzyskać pomoc." ;;
esac

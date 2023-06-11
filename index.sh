#!/bin/bash

function print_date {
    echo $(date)
}

function create_logs {
    local number=$1
    if [[ -z "$number" ]]; then
        number=100
    fi

    for ((i=1;i<=number;i++)); do
        echo -e "Nazwa pliku: log$i.txt\nNazwa skryptu: $0\nData: $(date)" > log$i.txt
    done
}

function create_errors {
    local number=$1
    if [[ -z "$number" ]]; then
        number=100
    fi

    mkdir -p errorx

    for ((i=1;i<=number;i++)); do
        echo -e "Nazwa pliku: errorx/error$i.txt\nNazwa skryptu: $0\nData: $(date)" > errorx/error$i.txt
    done
}

function clone_repo {
    local dir=$(pwd)
    git clone <url-do-repozytorium> $dir
    export PATH=$dir:$PATH
}

function print_help {
    echo "Opcje skryptu:"
    echo "-d, --date: wyświetla aktualną datę"
    echo "-l, --logs [number]: tworzy pliki logx.txt, gdzie x to numer pliku od 1 do 100. Jeśli podano liczbę, tworzy tyle plików."
    echo "-e, --error [number]: tworzy pliki errorx/errorx.txt, gdzie x to numer pliku od 1 do 100. Jeśli podano liczbę, tworzy tyle plików."
    echo "--init: klonuje repozytorium do katalogu, w którym uruchomiony jest skrypt, i dodaje ten katalog do zmiennej środowiskowej PATH."
    echo "-h, --help: wyświetla pomoc"
}

while (( "$#" )); do
  case "$1" in
    -d|--date)
      print_date
      shift
      ;;
    -l|--logs)
      create_logs $2
      shift 2
      ;;
    -e|--error)
      create_errors $2
      shift 2
      ;;
    --init)
      clone_repo
      shift
      ;;
    -h|--help)
      print_help
      shift
      ;;
    *)
      echo "Nieznana opcja: $1. Użyj -h lub --help, aby uzyskać pomoc."
      shift
      ;;
  esac
done

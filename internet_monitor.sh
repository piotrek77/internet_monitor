#!/bin/bash

# Plik logu w formacie CSV
LOGFILE="$HOME/internet_monitor.csv"

# Adres do pingowania (np. Google DNS)
PING_ADDRESS="8.8.8.8"

# Czas w sekundach między kolejnymi sprawdzeniami
INTERVAL=60

# Jeśli log nie istnieje, utwórz go z nagłówkiem
if [ ! -f "$LOGFILE" ]; then
    echo "Timestamp,Status" > "$LOGFILE"
fi

echo "Rozpoczynam monitorowanie internetu: $(date)"

while true; do
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    if ping -c 1 "$PING_ADDRESS" > /dev/null 2>&1; then
        echo "$TIMESTAMP,Connected" >> "$LOGFILE"
    else
        echo "$TIMESTAMP,Disconnected" >> "$LOGFILE"
    fi
    sleep "$INTERVAL"
done

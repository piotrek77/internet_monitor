# Ścieżka do pliku logu
logfile = "./internet_monitor.csv"

# Liczby linii
total_lines = 0
disconnected_lines = 0
connected_lines = 0
retry_lines = 0

# Otwieramy plik i liczymy wystąpienia
with open(logfile, 'r') as file:
    for line in file:
        total_lines += 1
        if "Disconnected" in line:
            disconnected_lines += 1
        elif "Connected" in line:
            if "Retry" in line:
                retry_lines += 1
            else:
                connected_lines += 1

# Obliczanie procentów
disconnected_percent = (disconnected_lines / total_lines) * 100
connected_percent = (connected_lines / total_lines) * 100
retry_percent = (retry_lines / total_lines) * 100

# Wyświetlanie wyników
print(f"Disconnected: {disconnected_percent:.2f}%")
print(f"Connected: {connected_percent:.2f}%")
print(f"Connected (Retry): {retry_percent:.2f}%")

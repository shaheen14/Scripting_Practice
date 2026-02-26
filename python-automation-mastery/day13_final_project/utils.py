import subprocess
from datetime import datetime

def run_command(command):
    """
    Runs a system commmand and returns cleaned output.
    """
    result = subprocess.run(command, capture_output=True, text=True)
    return result.stdout.strip()


def get_memory_usage_percent():
    output = run_command(["free", "-m"])
    lines = output.split("\n")
    memory_line = lines[1]
    parts = memory_line.split()
    total_memory = int(parts[1])
    used_memory = int(parts[2])
    usage_percent = (used_memory / total_memory) * 100
    return round(usage_percent, 2)
def get_disk_usage_percent():
    output = run_command(["df", "-h"])
    lines = output.split("\n")
    for line in lines[1:]:
            parts = line.split()
            if len(parts) >= 6 and parts[5] == "/":
                usage_str = parts[4]
                usage_percent = int(usage_str.replace("%", ""))
                return usage_percent
    return 0    
def get_cpu_load():
    output = run_command(["uptime"])
    parts = output.split("load average:")
    if len(parts) > 1:
        load_values = parts[1].strip().split(",")
        first_load = float(load_values[0])
        return round(first_load, 2)
    return 0.0
def log_to_file(message):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open("logs/system.log", "a") as file:
        file.write(f"[{timestamp}] {message}\n")

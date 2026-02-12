from datetime import datetime

LOGFILE = "system_monitor.log"

def log(message):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open(LOGFILE, "a") as file:
        file.write(f"{timestamp} - {message}\n")
    print(message)
log("System Health Check Started")
log("Disk usage is 82%")
log("Memory usage is normal")
log("Monitoring Complted")

from datetime import datetime

LOGFILE = "sys_mon.log"

system_usage = {
       "disk": 90,
       "memory": 60,
       "ssh_failures": 5
       }
thresholds = {
        "disk": 75,
        "memory": 80,
        "ssh_failures": 3
        }

def log(message):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open(LOGFILE, "a") as file:
                file.write(f"{timestamp} - {message}\n")
    print(message)

log("System Health Check Started")

for item in system_usage:
    if system_usage[item] >= thresholds[item]:
        log(f"CRITICAL {item} usage is {system_usage[item]}")
    else:
        log(f"NORMAL {item} usage is {system_usage[item]}")
log("System Health Check Completed")        

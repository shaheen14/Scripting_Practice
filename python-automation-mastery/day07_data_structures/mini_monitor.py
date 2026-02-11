# Simulated system values
system_usage = {
        "disk": 85,
        "memory": 65,
        "ssh_failures": 3
        }

thresholds = {
        "disk": 80,
        "memory": 70,
        "ssh_failures": 5
        }

for item in system_usage:
    if system_usage[item] >= thresholds[item]:
        print("ALERT:", item, "usage is", system_usage[item])
    else:
        print("OK:", item, "usage is", system_usage[item])

# printing list of disks name
disks = ["/", "/home", "/var"]
print("Printing disk names")
for disk in disks:
    print(disk)


# creating a dictionary of services and their status

services = {
        "ssh": "running",
        "nginx": "stopped"
        }
print("Printing services and status")

for service, status in services.items():
    print(service, "is", status)

# Modify mini_monitor.py

# simulated system values

system_usage = {
        "disk": 80,
        "memory": 70,
        "ssh_failures": 5

        }
thresholds = {
        "disk": 85,
        "memory": 70,
        "ssh_failures": 3
        }
print("Checking usage and threshold")
for item in system_usage:
    if system_usage[item] >= thresholds[item]:
        print("CRITICAL", item, "usage is", system_usage[item])
    else:
        print("NORMAL", item, "usage is", system_usage[item])


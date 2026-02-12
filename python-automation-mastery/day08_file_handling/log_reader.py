LOGFILE = "sys_mon.log"

critical_count = 0
normal_count = 0
with open(LOGFILE, "r") as file:
    for line in file:
        if "CRITICAL" in line:
            critical_count += 1
        elif "NORMAL" in line:
            normal_count += 1
print("Total CRITICAL:", critical_count)
print("TOtal NORMAL:", normal_count)

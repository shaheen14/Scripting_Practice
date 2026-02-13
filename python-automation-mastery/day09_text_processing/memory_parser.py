LOGFILE = "memory.log"

with open(LOGFILE, "r") as file:
    for line in file:
        line = line.strip()
        line_part = line.split(" - ")[1]
        memory_value = line_part.split(": ")[1]
        memory_value = memory_value.replace("%", "")
        memory_value = int(memory_value)
        if memory_value > 80:
            print(f"ALERT: Memory usage is {memory_value}%")
        else:
            print(f"OK: Memory usage is {memory_value}%")

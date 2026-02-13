line = "2026-02-12 - Memory Usage: 92% - CRITICAL"

line_part = line.split(" - ")[1]
memory_value = line_part.split(": ")[1]
memory_value = memory_value.replace("%", "")
memory_value = int(memory_value)

if memory_value > 80:
    print("ALERT")
else:
    print("OK")

text = "Python Automation"

print(text.strip()) # remove space
print(text.lower()) # lowercase
print(text.upper()) # uppercase
print(text.replace("Automation", "Scripting")) # replace the string

log_line = "2026-02-12 - CPU Usage: 87% - CRITICAL"

parts = log_line.split(" - ")

print(parts)
print(parts[0])
print(parts[1])
print(parts[2])

# Extracting cpu percentage only

cpu_part = parts[1]
cpu_value = cpu_part.split(": ")[1]
cpu_value = cpu_value.replace("%", "")
cpu_value = int(cpu_value)

print("CPU value is:", cpu_value)




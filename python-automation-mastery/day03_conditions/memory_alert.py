total = int(input("Enter total memory: "))
used = int(input("Enter used memory: "))
threshold = int(input("Enter threshold: "))

usage_percent = (used * 100) / total

if usage_percent >= threshold:
    print("CRITICAL: Memory usage", usage_percent, "%")
else:
    print("OK: Memory usage", usage_percent, "%")

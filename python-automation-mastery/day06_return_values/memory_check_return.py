def check_memory(total, used, threshold):
    usage_percent = (used * 100) / total
    if usage_percent >= threshold:
        return "CRITICAL"
    else:
        return "OK"

total = int(input("Enter total memory: "))
used  = int(input("Enter used memory: "))
threshold = int(input("Enter threshold: "))

status = check_memory(total, used, threshold)

print("Memory status:", status)

threshold = 70
memory_sample = [55, 64, 76, 87,90]

for usage in memory_sample:
    if usage >= threshold:
        print("ALERT: Memory usage", usage, "%")
    else:
        print("OK: Memory usage", usage, "%")


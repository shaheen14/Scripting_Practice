threshold = int(input("Enter threshold: "))
usage = int(input("Enter current usage: "))

if usage > threshold:
    print("ALERT: Threshold exceeded")
else:
    print("OK: Within limit")

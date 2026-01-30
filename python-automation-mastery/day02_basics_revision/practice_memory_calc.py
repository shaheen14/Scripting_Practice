total = int(input("Enter total memory: "))
used = int(input("enter used memory: "))

percent = (used * 100) / total  # / represents true division i.e returns a float
print("Memory usage:", percent, "%")

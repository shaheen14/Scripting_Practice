# Threshold Configuration
thresholds = {
        "disk": 80,
        "memory": 70,
        "ssh": 5
        }

for key, value in thresholds.items():
    print(key, "threshold is", value)


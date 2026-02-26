import argparse

parser = argparse.ArgumentParser(description="System monitor mode selector")

parser.add_argument("mode", choices=["cpu", "memory", "disk"], help="Slect what to monitor")

args = parser.parse_args()

if args.mode == "cpu":
    print("Monitoring CPU usage...")
elif args.mode == "memory":
    print("Monitoring Memory usage...")
elif args.mode == "disk":
    print("Monitoring Disk usage...")

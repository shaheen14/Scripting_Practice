import argparse
from utils import (run_command, get_memory_usage_percent, get_disk_usage_percent, get_cpu_load, log_to_file)

def main():
    parser = argparse.ArgumentParser(description="Unified System Monitor")
    parser.add_argument("mode", choices=["memory", "disk", "cpu"], help="Select what to monitor")
    parser.add_argument("--threshold", type=int, help="Set alert threshold percentage")
    parser.add_argument("--verbose", action="store_true", help="Enable verbose output")

    args = parser.parse_args()
    if args.mode == "memory":
        usage = get_memory_usage_percent()
        print("=====Memory Info=====")
        print(f"Current Usage: {usage}%")
        if args.threshold:
            if usage > args.threshold:
                alert_message = f"Alert: Memory usage {usage}% exceeded threshold {args.threshold}%"
                print(alert_message)
                log_to_file(alert_message)
            else:
                ok_message = f"OK: Memory usage {usage}% is within limit."
                print("Memory usage is within limit")
                log_to_file(ok_message)
    elif args.mode == "disk":
        usage = get_disk_usage_percent()
        print("=====Disk Info=====")
        print(f"Current Usage: {usage}%")
        if args.threshold:
            if usage > args.threshold:
                alert_message = f"Alert: Disk usage {usage}% is exceeded threshold {args.threshold}%"
                print(alert_message)
                log_to_file(alert_message)
            else:
                ok_message = f"Disk usage { usage}% is within limit."
                print(ok_message)
                log_to_file(ok_message)
    elif args.mode == "cpu":
        load = get_cpu_load()
        print("=====CPU Load (1 min average)=====")
        print(f"Current Load: {load}")
        if args.threshold:
            if load > args.threshold:
                alert_message = f"Alert: CPU load {load} exceeded threshold {args.threshold}"
                print(alert_message)
                log_to_file(alert_message)
            else:
                ok_message = f"OK: CPU load {load} is within limit."
                print(ok_message)
                log_to_file(ok_message)
    if args.verbose:
        print("Verbose mode enabled")
if __name__ == "__main__":
    main()



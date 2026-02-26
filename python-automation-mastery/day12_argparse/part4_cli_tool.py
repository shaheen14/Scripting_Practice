import argparse
import subprocess

parser = argparse.ArgumentParser(description="Simple Monitoring CLI Tools")

parser.add_argument("mode", choices=["memory", "disk", "cpu"], help="Select what to monitor")
parser.add_argument("--verbose", action="store_true", help="Enable detailed output")

args = parser.parse_args()

def run_command(command):
    result = subprocess.run(command, capture_output=True, text=True)
    return result.stdout.strip()

if args.mode == "memory":
    output = run_command(["free", "-m"])
    print("=======Memory Info=======")
    print(output)
elif args.mode == "disk":
    output = run_command(["df", "-h"])
    print("=======Disk Info=======")
    print(output)
elif args.mode == "cpu":
    output = run_command(["uptime"])
    print("=======CPU Info=======")
    print(output)

if args.verbose:
    print("\nVerbose mode enabled")



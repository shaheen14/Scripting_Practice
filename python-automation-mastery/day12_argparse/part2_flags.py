import argparse

parser = argparse.ArgumentParser(description="Demo of boolean flags")

parser.add_argument("--verbose", action="store_true", help="Enable verbose output")

parser.add_argument("--debug", action="store_true", help="Enable debug mode")
args = parser.parse_args()

if args.verbose:
    print("Verbose mode is ON")
else:
    print("Verbose mode is OFF")

if args.debug:
    print("Debug mode is enabled")
    

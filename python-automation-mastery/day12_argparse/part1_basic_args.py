import argparse

# Create parser object

parser = argparse.ArgumentParser(description="Simple greeting program")

# Add positional argument

parser.add_argument("name", help="Name of the person to greet")

# Parse arguments
args = parser.parse_args()

# Use the argument

print(f"Hello, {args.name}!")


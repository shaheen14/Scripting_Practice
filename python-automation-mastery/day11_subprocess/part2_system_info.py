import subprocess

result = subprocess.run(["free", "-m"], capture_output=True, text=True)

output = result.stdout

lines = output.split("\n")
memory_line = lines[1]
parts = memory_line.split()

total_memory = parts[1]
used_memory = parts[2]
free_memory = parts[3]

print("Total Memory:", total_memory, "MB")
print("Used Memory:", used_memory, "MB")
print("Free Memory:", free_memory, "MB")

import os

print("Running system commands...\n")

os.system("date")
os.system("whoami")
os.system("uptime")


print("\nCurrent Directory:")
print(os.getcwd())
print("\nFiles in this directory:")
print(os.listdir())


file_name = "memory.log"
if os.path.exists(file_name):
    print("\nFile exists. Ready to parse")
else:
    print("\nFile not found.")


print("\nEnvironment Variables:")
print("User:", os.environ.get("USER"))
print("Home Directory:", os.environ.get("HOME"))
    


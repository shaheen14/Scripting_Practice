import os
print("Current User:", os.environ.get("USER"))
print("\nCurrent Directory:", os.getcwd())
print("\nListing files in directory:")
print(os.listdir())

file_name = "memory.log"
if os.path.exists(file_name):
    print("\nSystem ready for monitoring")
else:
    print("\nFile not found")


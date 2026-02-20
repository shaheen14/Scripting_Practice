import os

path = input("Enter a filename or directory name: ")

if os.path.exists(path):
    if os.path.isfile(path):
        size = os.path.getsize(path)
        print("It is a file.")
        print("Size:", size, "byte")

    elif os.path.isdir(path):
        items = os.listdir(path)
        print("It is a directory.")
        print("Contains", len(items), "items")
else:
    print("Path does not exist.")






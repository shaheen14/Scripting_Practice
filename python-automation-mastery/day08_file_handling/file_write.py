# writing to a file(overwrites existing content)

file = open("test.log", "w")
file.write("System Monitoring Standard\n")
file.write("Disk usage is 70%\n")
file.close()

print("File written successfully")

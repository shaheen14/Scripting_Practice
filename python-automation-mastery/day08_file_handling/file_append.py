# adding content to the botton without removing old content is called append

file = open("test.log", "a")

file.write("New log entry added\n")

file.close()

print("Log appended successfully")




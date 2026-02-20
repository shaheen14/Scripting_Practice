import subprocess

#getting pwd 
result = subprocess.run(["pwd"], capture_output=True, text=True)

current_directory = result.stdout.strip() #remove extra line

print("Current_directory:", current_directory)

#getting user
user = subprocess.run(["whoami"], capture_output=True, text=True)

current_user = user.stdout.strip()
print("Current User:", current_user)

import subprocess

def run_command(command):
    try:
        result = subprocess.run(command, capture_output=True, text=True, check=True)
        print("✅ Command executed successfully")
        print("Output:", result.stdout.strip())
    except subprocess.CalledProcessError as e:
        print("❎ Command failed")
        print("Error:\n", e.stderr)

if __name__ == "__main__":
    run_command(["pwd"])
    run_command(["whoami"])
    run_command(["ls"])


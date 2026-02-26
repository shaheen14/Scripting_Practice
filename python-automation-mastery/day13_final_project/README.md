# Unified System Monitor

A simple command-line system monitoring tool built with Python.

It allows you to check:

- Memory usage
- Disk usage (root `/`)
- CPU load (1-minute average)

You can also set a threshold to trigger alerts.

---

## Requirements

- Python 3
- Linux (uses `free`, `df`, `uptime` commands)

---

## Usage

### Check memory
python monitor.py memory

### Check disk
python monitor.py disk

### Check CPU
python monitor.py cpu

---

## Using Threshold

python monitor.py memory --threshold 70  
python monitor.py disk --threshold 80  
python monitor.py cpu --threshold 2  

If the value exceeds the threshold, an alert is shown.

---

## Logging

Threshold checks are logged in:

logs/system.log

Each log entry includes a timestamp.

---

## Purpose

This project was built to practice:

- argparse
- subprocess
- Parsing command output
- Modular Python structure

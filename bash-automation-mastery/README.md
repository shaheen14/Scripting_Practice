# Bash Automation Mastery – 12 Days Hands-On Project

## Overview
This repository documents a structured 12-day hands-on journey into Bash
scripting, focused on real Linux system administration and automation tasks.

The objective of this project was to build strong automation fundamentals
using Bash before transitioning to Python for advanced automation.

---

## What This Project Demonstrates
- Strong Bash scripting fundamentals
- Linux system automation mindset
- Defensive and production-style scripting
- Logging, monitoring, and threshold-based alerts
- Command-line argument parsing
- Modular and maintainable script design

---

## Learning Path Summary

### Days 1–5: Bash Fundamentals
- Variables and commands
- Conditional logic
- Loops
- Command-line arguments
- Functions and scope

### Days 6–7: Automation Basics
- Logging
- File handling
- Disk, memory, and service checks

### Days 8–10: Advanced Usage
- Text processing (`awk`, `grep`, `sort`)
- Process inspection
- Scheduling concepts
- Cron job execution

### Day 11: Final Bash Integration
- Unified system health monitoring script
- Modular functions
- Logging and thresholds
- `getopts` based execution

### Day 12: Bash Closure
- Production-ready script
- Argument-driven thresholds
- Safe Bash practices
- Documentation and project freeze
- Transition readiness for Python automation

---

## Final Project
### System Health Monitoring Script
Monitors:
- Disk usage
- Memory usage
- Failed SSH login attempts

Features:
- User-selected checks
- Configurable thresholds
- Centralized logging
- Automation-ready design

---

## How to Run
```bash
chmod +x system_health_check.sh
./system_health_check.sh -d -m -s



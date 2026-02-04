# Project CI/CD Setup

## Overview

This project has been configured with a complete CI/CD pipeline and Python environment setup.

## Generated Files and Their Purpose

- **requirements.txt**: Contains pinned versions of all Python dependencies (requests and mypy) compatible with Python 3.14.0.
- **.venv/**: Virtual environment directory containing all installed dependencies.
- **.gitignore**: Excludes the virtual environment from version control.
- **logs/test_run.log**: Contains the output of the CI and CD pipeline executions.
- **report.json**: Documents all identified and fixed CI/CD issues.

## Modified Files

- **app.py**: Added command-line argument parsing to support `--check-config` option for CD pipeline.
- **config.py**: Updated API_KEY to a valid value to prevent CD pipeline failures.

## How to Check Logs

To view the CI/CD test results, check the `logs/test_run.log` file. It contains the complete output from running both the CI and CD pipelines, including any errors or success messages.

You can view the log file using:
- File explorer: Navigate to `logs/test_run.log`
- Command line: `type logs\test_run.log` (Windows) or `cat logs/test_run.log` (Linux/Mac)
Overview

This repository was updated to fix CI/CD issues and to allow local CI/CD test runs.

Generated/modified files

- requirements.txt: Updated to pin safe, stable dependency versions (requests==2.31.0, mypy==1.9.0).
- .gitignore: Added to prevent committing the virtual environment and common artifacts (.venv/, logs/, __pycache__/, etc.).
- .venv/: A clean virtual environment created for testing (do not commit).
- logs/test_run.log: Captures the output of the CI and CD pipeline runs.
- report.json: Machine-readable report documenting the CI/CD problems found and the applied fixes.
- README.md: This file.

What was fixed

- Replaced an invalid requests pin (requests==0.0.1) with a stable release.
- Added mypy to requirements so the CI linter is installed.
- Corrected application config to avoid CD failure (API_KEY set to VALID_API_KEY).
- Ensured pipelines are executed from their own directories so relative paths resolve.

How to reproduce the CI/CD run locally

1. Ensure you have Python available on your PATH (the environment used here was Python 3.14).
2. From the repository root, create and activate a fresh virtual environment (this was done automatically in the test):
   - Windows (PowerShell): python -m venv .venv; Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force; . .venv\Scripts\Activate.ps1

3. Install pinned dependencies:
   .venv\Scripts\python -m pip install -r requirements.txt

4. Run CI and CD pipelines from their directories (the test run wrote output to logs/test_run.log):
   - CI: Change to the ci/ folder and run ci_pipeline.bat
   - CD: Change to the cd/ folder and run cd_pipeline.bat

Where to find logs

- All test outputs from the automated CI/CD run are in logs/test_run.log. Open that file to review the combined CI and CD output and exit codes.

Notes

- Do not commit the .venv/ directory. It is listed in .gitignore.
- The report.json file contains a concise list of identified CI/CD issues and the corrective actions applied.

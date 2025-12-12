Overview

This repository has been validated and updated to improve CI/CD reproducibility. Files added/modified during the CI/CD checks are documented below.

Generated/Modified files

- requirements.txt: Replaced an invalid package pin (requests==0.0.1) with secure, pinned versions compatible with Python 3.14 (requests==2.31.0). Added mypy==1.12.0 and pytest==7.4.0.
- .gitignore: Added to exclude .venv/, logs/, and common Python artifacts from version control.
- .venv/: A fresh virtual environment was created locally (not committed). Use the helper run_pipelines_with_venv.bat to run pipelines with this venv on Windows.
- run_pipelines_with_venv.bat: Helper batch that prepends .venv\Scripts to PATH and runs CI and CD pipelines from their respective directories. This avoids PowerShell ExecutionPolicy issues when trying to use Activate.ps1.
- logs/test_run.log: Combined output from running CI and CD pipelines using the .venv environment.
- report.json: A summary of discovered CI and CD problems and the fixes applied.

How to re-run CI/CD locally

1. Delete any existing .venv/ and create a fresh environment:
   python -m venv .venv
   .venv\Scripts\python -m pip install --upgrade pip setuptools wheel
   .venv\Scripts\python -m pip install -r requirements.txt

2. To run the project pipelines using the .venv environment on Windows:
   - Use the helper: cmd /c "run_pipelines_with_venv.bat"
   - Or run the pipelines manually from their directories (if you prefer):
       pushd ci && .\ci_pipeline.bat && popd
       pushd cd && .\cd_pipeline.bat && popd

Checking logs

- All test and pipeline outputs were written to logs/test_run.log. To view the latest content:
   - Open logs/test_run.log in your editor, or run: Get-Content logs/test_run.log -Tail 200 (PowerShell)

Notes

- The project runs on Python 3.14. If your system uses a different interpreter, ensure packages in requirements.txt are compatible.
- Do not commit the .venv/ directory. .gitignore has been added to prevent accidental commits.

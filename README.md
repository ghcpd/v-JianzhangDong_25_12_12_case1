Project CI/CD fixes and usage

Overview of generated files:

- `report.json`: A JSON report documenting the CI/CD issues found and fixes applied.
- `.gitignore`: Updated to exclude `.venv/`, caches and `logs/`.
- `.venv/`: Fresh virtual environment created for installing dependencies (not committed).
- `requirements.txt`: Updated to pin stable versions (`requests==2.31.0`, `mypy==1.11.0`).
- `logs/test_run.log`: Captures the outputs of running `ci_pipeline.bat` and `cd_pipeline.bat`.

How to re-run CI/CD locally (Windows PowerShell):

1. Recreate the virtual environment and install dependencies:

```powershell
if (Test-Path .venv) { Remove-Item -Recurse -Force .venv }
python -m venv .venv
.venv\Scripts\python -m pip install -r requirements.txt
```

2. Run CI and CD pipelines (from repository root):

```powershell
#$env:Path = (Resolve-Path .venv\Scripts).Path + ';' + $env:Path
#Push-Location ci; .\ci_pipeline.bat; Pop-Location
#Push-Location cd; .\cd_pipeline.bat; Pop-Location
```

3. Check logs:

- CI/CD output and final exit codes are available in `logs/test_run.log`.

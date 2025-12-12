@echo off
python - <<END
import sys, json
cfg = json.load(open('..\\deploy\\release_config.json'))
if cfg.get('entrypoint') != "app.main:app":
    sys.exit(1)
END
if errorlevel 1 (
    echo CD failed.
    exit /b 1
)

python - <<END
import sys, json
cfg = json.load(open('..\\deploy\\release_config.json'))
if cfg.get('deploy_key') == "REPLACE_ME":
    sys.exit(1)
END
if errorlevel 1 (
    echo CD failed.
    exit /b 1
)

python - <<END
import sys, json
from app import __version__ as v
cfg = json.load(open('..\\deploy\\release_config.json'))
if cfg.get('version') != v:
    sys.exit(1)
END
if errorlevel 1 (
    echo CD failed.
    exit /b 1
)

findstr /C:"gunicorn==20.1.0" ..\requirements.txt >nul
if %errorlevel% neq 0 (
    echo CD failed.
    exit /b 1
)

if not exist ..\deploy\start_server.bat (
    echo CD failed.
    exit /b 1
)

echo CD passed.
exit /b 0

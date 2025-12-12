@echo off
pytest ..\tests > ..\ci_log.txt
if errorlevel 1 (
    echo CI failed.
    exit /b 1
)

python - <<END
import sys
req = open('..\\requirements.txt').read().splitlines()
ground = open('..\\requirements_ground_truth.txt').read().splitlines()
if sorted([l.strip() for l in req]) != sorted([l.strip() for l in ground]):
    sys.exit(1)
END
if errorlevel 1 (
    echo CI failed.
    exit /b 1
)

python - <<END
import sys
from app import config
if config.DEBUG is not False:
    sys.exit(1)
END
if errorlevel 1 (
    echo CI failed.
    exit /b 1
)

findstr /C:"FIXME" ..\app\main.py >nul
if %errorlevel%==0 (
    echo CI failed.
    exit /b 1
)

python - <<END
import sys
from app import config
if config.VERSION != "2.0":
    sys.exit(1)
END
if errorlevel 1 (
    echo CI failed.
    exit /b 1
)

echo CI passed.
exit /b 0

@echo off
echo Running CD pipeline...
python ..\app.py --check-config || (echo CD failed. & exit /b 1)
python ..\app.py || (echo CD failed. & exit /b 1)
echo CD passed.

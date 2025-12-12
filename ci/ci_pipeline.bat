@echo off
echo Running CI pipeline...
pip install -r ..\requirements.txt || (echo CI failed. & exit /b 1)
python -m py_compile ..\app.py || (echo CI failed. & exit /b 1)
mypy ..\utils.py || (echo CI failed. & exit /b 1)
echo CI passed.

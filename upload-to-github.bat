@echo off
echo === Uploading to GitHub ===
echo.
echo Please make sure Git is installed from: https://git-scm.com/download/win
echo.
pause
git init
git add .
git commit -m "Initial commit: Anonymous Messaging Platform API"
git remote add origin https://github.com/amrattia11/saraha.app.git
git branch -M main
git push -u origin main
pause

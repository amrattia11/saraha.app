# Instructions to Upload to GitHub

## Option 1: Using Git Command Line (Recommended)

### Step 1: Install Git (if not installed)
Download and install Git from: https://git-scm.com/download/win

### Step 2: Open Git Bash or PowerShell in the project directory
Navigate to: `C:\Users\amrat\OneDrive\Desktop\Route\saraha app\saraha app\saraha app`

### Step 3: Initialize Git (if not already initialized)
```bash
git init
```

### Step 4: Add all files
```bash
git add .
```

### Step 5: Commit the files
```bash
git commit -m "Initial commit: Anonymous Messaging Platform API"
```

### Step 6: Add the remote repository
```bash
git remote add origin https://github.com/amrattia11/saraha.app.git
```

### Step 7: Push to GitHub
```bash
git branch -M main
git push -u origin main
```

## Option 2: Using GitHub Desktop

1. Download GitHub Desktop from: https://desktop.github.com/
2. Sign in with your GitHub account
3. Click "File" > "Add Local Repository"
4. Select the project folder: `C:\Users\amrat\OneDrive\Desktop\Route\saraha app\saraha app\saraha app`
5. Click "Publish repository" and select the repository: `amrattia11/saraha.app`

## Option 3: Using VS Code

1. Open the project folder in VS Code
2. Open the Source Control panel (Ctrl+Shift+G)
3. Click "Initialize Repository"
4. Stage all changes
5. Commit with message: "Initial commit: Anonymous Messaging Platform API"
6. Click "..." menu > "Remote" > "Add Remote"
7. Enter: `https://github.com/amrattia11/saraha.app.git`
8. Click "Publish Branch"

## Important Notes

- Make sure your `.env` file is NOT uploaded (it's in .gitignore)
- The `node_modules` folder will be ignored (it's in .gitignore)
- You may need to authenticate with GitHub (username and personal access token)


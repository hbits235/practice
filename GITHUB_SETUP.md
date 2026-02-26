# Pushing to GitHub - Setup Guide

## Overview

This guide explains how to push your CLITool project to GitHub and set up the remote repository.

## Prerequisites

- GitHub account
- Git installed on your system
- GitHub credentials configured (HTTPS or SSH)

## Step-by-Step Instructions

### Step 1: Create Repository on GitHub

1. Go to https://github.com/new
2. Create a new repository with these settings:
   - **Repository name**: `practice`
   - **Description**: Simple Java CLI tool installable via WinGet
   - **Visibility**: Public (for open-source) or Private (for personal use)
   - **Initialize with README**: NO (we already have one)
   - **Add .gitignore**: NO (we already have one)

3. Click "Create repository"

### Step 2: Get Your Repository URL

After creating the repository, GitHub shows you the URL. Copy it.

**Two options:**

**Option A: HTTPS (recommended for beginners)**
```
https://github.com/YOUR_USERNAME/practice.git
```

**Option B: SSH (requires SSH keys setup)**
```
git@github.com:YOUR_USERNAME/practice.git
```

### Step 3: Add Remote to Local Repository

Open PowerShell/CMD in the `practice` folder and run:

**For HTTPS:**
```powershell
git remote add origin https://github.com/YOUR_USERNAME/practice.git
```

**For SSH:**
```powershell
git remote add origin git@github.com:YOUR_USERNAME/practice.git
```

Replace `YOUR_USERNAME` with your GitHub username.

### Step 4: Verify Remote Was Added

```powershell
git remote -v
```

You should see:
```
origin  https://github.com/YOUR_USERNAME/practice.git (fetch)
origin  https://github.com/YOUR_USERNAME/practice.git (push)
```

### Step 5: Push to GitHub

Push all commits to the master branch:

```powershell
git push -u origin master
```

The `-u` flag sets the upstream, so future pushes only need `git push`.

**For first push**, GitHub may ask for authentication:
- HTTPS: Enter your GitHub username and password (or personal access token)
- SSH: Authenticate with your SSH key

### Step 6: Verify Push Was Successful

1. Go to https://github.com/YOUR_USERNAME/practice
2. You should see all your files:
   - clitool/ (project directory)
   - README.md
   - LICENSE
   - .gitignore
   - push-to-github.bat, push-to-github.sh (helper scripts)

3. Check the commit history shows your initial commit

---

## Using the Helper Scripts

We've included two helper scripts to make this easier:

### Windows: push-to-github.bat

1. Edit the file and replace:
   ```batch
   set GITHUB_REPO=https://github.com/YOUR_USERNAME/practice.git
   ```

2. Run:
   ```powershell
   .\push-to-github.bat
   ```

### Bash/Linux/Mac: push-to-github.sh

1. Edit the file and replace:
   ```bash
   GITHUB_REPO="https://github.com/YOUR_USERNAME/practice.git"
   ```

2. Run:
   ```bash
   bash push-to-github.sh
   ```

---

## Troubleshooting

### "fatal: remote origin already exists"

The remote was already added. Use:
```powershell
git remote set-url origin https://github.com/YOUR_USERNAME/practice.git
```

### "fatal: unable to access repository"

**HTTPS issues:**
- Check internet connection
- Verify repository URL is correct
- Check GitHub credentials

**SSH issues:**
- Verify SSH key is added to GitHub account
- Run: `ssh -T git@github.com` (should show success)

### Authentication Failed

**HTTPS:**
- Use Personal Access Token instead of password:
  1. Go to GitHub → Settings → Developer Settings → Personal access tokens
  2. Generate new token with 'repo' scope
  3. Use token as password when prompted

**SSH:**
- Generate SSH key: `ssh-keygen -t ed25519 -C "your@email.com"`
- Add public key to GitHub: Settings → SSH Keys
- Test: `ssh -T git@github.com`

### "Everything up-to-date"

This means the remote is properly set up and all commits are pushed. Your repository is synced!

---

## Future Pushes

After the initial setup, pushing new commits is simple:

```powershell
# Make changes, commit them
git commit -m "Your commit message"

# Push to GitHub
git push
```

No need for `-u origin master` on subsequent pushes.

---

## GitHub Integration with WinGet

After pushing to GitHub, next steps for WinGet distribution:

1. **Create a Release**
   - Go to Releases tab in your repository
   - Click "Create a new release"
   - Tag: `v1.0.0`
   - Title: `CLITool v1.0.0`
   - Upload `clitool-1.0.0.zip` as asset

2. **Update WinGet Manifest**
   - Edit `winget/practice.clitool.yaml`
   - Fill in the placeholder values:
     - `InstallerUrl`: Your release download link
     - `InstallerSha256`: Hash of the ZIP file
     - `PublisherUrl`: Your GitHub profile URL

3. **Submit to WinGet**
   - Fork `microsoft/winget-pkgs` repository
   - Create manifests/p/practice/clitool/1.0.0/ directory
   - Copy your manifest files
   - Submit Pull Request

---

## Summary

✅ **What you've done:**
- Created a GitHub repository
- Added remote origin
- Pushed all code to master branch

✅ **Your project is now:**
- Version controlled
- Backed up on GitHub
- Ready for collaboration
- Ready for WinGet distribution

Next: Build locally, test, create releases, submit to WinGet!

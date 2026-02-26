# Push to GitHub - Complete Instructions

## Current Status

Your local repository is ready to push with 2 commits:
- ✓ Initial commit (all source code)
- ✓ Helper scripts commit

## What You Need

1. **GitHub Repository URL** - Not provided yet
   - Format: `https://github.com/YOUR_USERNAME/practice.git`
   
2. **GitHub Credentials** - Will be prompted by Git
   - HTTPS: GitHub username + Personal Access Token
   - SSH: SSH key configured

## How to Push (Choose Your Method)

### Method 1: Using the Windows Batch Script (Easiest)

**Step 1:** Edit `push-to-github.bat`
```batch
# Find this line:
set GITHUB_REPO=https://github.com/YOUR_USERNAME/practice.git

# Replace YOUR_USERNAME with your actual GitHub username
set GITHUB_REPO=https://github.com/harshsheth/practice.git
```

**Step 2:** Save the file

**Step 3:** Run in PowerShell:
```powershell
cd C:\Users\harshsheth\practice
.\push-to-github.bat
```

**Step 4:** When prompted, enter your GitHub credentials:
- Username: your GitHub username
- Password: your GitHub Personal Access Token (recommended) or password

---

### Method 2: Manual Git Commands

**Step 1:** Add the remote origin:
```powershell
cd C:\Users\harshsheth\practice
git remote add origin https://github.com/YOUR_USERNAME/practice.git
```

Replace `YOUR_USERNAME` with your GitHub username.

**Step 2:** Push to GitHub:
```powershell
git push -u origin master
```

**Step 3:** When prompted:
- Username: Enter your GitHub username
- Password: Enter your Personal Access Token

---

## GitHub Credentials

### Option A: Personal Access Token (Recommended)

1. Go to https://github.com/settings/tokens
2. Click "Generate new token" → "Generate new token (classic)"
3. Name: `CLITool` or similar
4. Check these scopes:
   - ✓ repo (Full control of private repositories)
5. Click "Generate token"
6. Copy the token (you won't see it again!)

When git prompts for password, paste the token instead.

### Option B: GitHub Password

If you don't have 2FA enabled, you can use your GitHub password directly.

---

## After Pushing Successfully

You'll see output like:
```
Counting objects: 23, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (18/18), done.
Writing objects: 100% (23/23), 18.24 KiB | 3.05 MiB/s, done.
Total 23 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), done.
To https://github.com/YOUR_USERNAME/practice.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.
```

## Verify Push Success

1. Go to https://github.com/YOUR_USERNAME/practice
2. You should see:
   - All files from your local repo
   - The directory structure
   - The 2 commits in the commit history

## Troubleshooting

### "fatal: remote origin already exists"
```powershell
git remote set-url origin https://github.com/YOUR_USERNAME/practice.git
git push -u origin master
```

### "fatal: unable to access repository"
- Check your GitHub username is correct
- Verify the repository exists on GitHub
- Check your internet connection

### "fatal: could not read Username for 'https://github.com'"
Git is asking for credentials:
- Username: your GitHub username
- Password: your Personal Access Token (not password if you have 2FA)

### "remote: Repository not found"
- The GitHub repository doesn't exist
- Create it at https://github.com/new
- Or check you used the correct username

---

## Quick Reference Commands

```powershell
# Check current remotes
git remote -v

# Add remote
git remote add origin https://github.com/YOUR_USERNAME/practice.git

# Change remote URL
git remote set-url origin https://github.com/YOUR_USERNAME/practice.git

# Push to GitHub
git push -u origin master

# Check what will be pushed
git log --oneline

# Check status
git status
```

---

## What Gets Pushed

Everything in your local repository:
- ✓ clitool/ (Java source code + tests + build config)
- ✓ winget/ (WinGet package manifest)
- ✓ README.md, LICENSE, .gitignore
- ✓ push-to-github.bat, push-to-github.sh, GITHUB_SETUP.md
- ✓ All 2 commits with their history

---

## Next Steps After Push

1. ✓ Code on GitHub
2. Build the project locally (`mvn clean package`)
3. Create a Release on GitHub with the built JAR
4. Update WinGet manifest with release download URL
5. Submit to microsoft/winget-pkgs for WinGet distribution

---

## Summary

1. Edit `push-to-github.bat` OR use manual git commands
2. Replace YOUR_USERNAME with your GitHub username  
3. Create empty repository on GitHub (optional, git can create it)
4. Run the push script or git push command
5. Enter GitHub credentials when prompted
6. Verify at https://github.com/YOUR_USERNAME/practice

That's it! Your code will be on GitHub!

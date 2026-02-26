#!/bin/bash
# push-to-github.sh - Script to push the practice project to GitHub

# This script helps you push the CLITool project to GitHub
# Edit the GITHUB_REPO variable with your GitHub repository URL

# ==============================================================================
# CONFIGURATION - Edit this section with your GitHub details
# ==============================================================================

GITHUB_REPO="https://github.com/YOUR_USERNAME/practice.git"
# Or use SSH:
# GITHUB_REPO="git@github.com:YOUR_USERNAME/practice.git"

BRANCH="master"

# ==============================================================================
# PUSH TO GITHUB
# ==============================================================================

echo "Pushing CLITool project to GitHub..."
echo "Repository: $GITHUB_REPO"
echo "Branch: $BRANCH"
echo ""

# Check if remote already exists
if git remote | grep -q "origin"; then
    echo "✓ Remote 'origin' already exists"
    echo "  Current URL: $(git remote get-url origin)"
    echo ""
    echo "If you need to change the URL, run:"
    echo "  git remote set-url origin $GITHUB_REPO"
else
    echo "Adding remote 'origin'..."
    git remote add origin $GITHUB_REPO
    echo "✓ Remote added"
fi

echo ""
echo "Pushing branch '$BRANCH' to origin..."
git push -u origin $BRANCH

if [ $? -eq 0 ]; then
    echo ""
    echo "✓ Successfully pushed to GitHub!"
    echo ""
    echo "Your repository is now at:"
    echo "  $GITHUB_REPO"
else
    echo ""
    echo "✗ Push failed. Please check:"
    echo "  1. GitHub repository exists"
    echo "  2. You have push permissions"
    echo "  3. SSH keys are configured (if using SSH)"
fi


#!/bin/bash

# Function to pause and wait for user input
pause() {
    read -p "$*"
}

# Initial Setup
echo "Configuring Git user..."
pause "Press [Enter] to continue..."
git config --global user.name "$git_user_name"
git config --global user.email "$git_user_email"

echo "Creating a bare repository..."
pause "Press [Enter] to continue..."
mkdir -p ~/advanced_git_techniques_bare_repo.git
cd ~/advanced_git_techniques_bare_repo.git
git init --bare
cd -

# Setup Local Repository
echo "Creating and initializing a local repository..."
pause "Press [Enter] to continue..."
mkdir -p ~/advanced_git_techniques_local_repo
cd ~/advanced_git_techniques_local_repo
git init

echo "Adding initial content..."
pause "Press [Enter] to continue..."
echo "# Advanced Git Techniques" > README.md
git add README.md
git commit -m "Initial commit with README.md"

# Adding the Bare Repository as a Remote
echo "Adding the bare repository as a remote..."
pause "Press [Enter] to continue..."
git remote add origin ~/advanced_git_techniques_bare_repo.git

# Create Branches and Simulate Conflicts
echo "Creating and switching to branch 'a'..."
pause "Press [Enter] to continue..."
git checkout -b a
echo "Initial content" > conflict_file.txt
git add conflict_file.txt
git commit -m "Add conflict_file.txt in branch a"
git push origin a

echo "Creating and switching to branch 'b'..."
pause "Press [Enter] to continue..."
git checkout -b b
git pull origin a
echo "Conflicting content" > conflict_file.txt
git commit -am "Edit conflict_file.txt in branch b"
git push origin b

echo "Switching back to the main branch..."
pause "Press [Enter] to continue..."
git checkout main
git merge a  # Merge branch 'a' into the main branch

echo "Merging branch 'b' into the main branch causing a merge conflict..."
pause "Press [Enter] to continue..."
git merge b  # Merge branch 'b' into the main branch causing a merge conflict

# Enable Git rerere
echo "Enabling Git rerere..."
pause "Press [Enter] to continue..."
git config --global rerere.enabled true

# Using Git rerere
echo "Resolving the first conflict..."
pause "Press [Enter] to continue..."
git add conflict_file.txt
git commit -m "Resolved conflict between branches 'a' and 'b'"

echo "Reproducing the conflict to see Git rerere in action..."
pause "Press [Enter] to continue..."
git reset --hard HEAD^
git merge b  # This time, rerere should automatically resolve the conflict

# Reverting the Changes
echo "Do you want to revert all changes and reset the repository for a new demo? (y/n)"
read -r REVERT
if [ "$REVERT" == "y" ]; then
    echo "Reverting all changes..."
    pause "Press [Enter] to continue..."
    rm -rf ~/advanced_git_techniques_local_repo
    rm -rf ~/advanced_git_techniques_bare_repo.git
    git rerere clear
    echo "All changes have been reverted."
fi

echo "Demo complete."


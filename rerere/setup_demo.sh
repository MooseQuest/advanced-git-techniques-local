
#!/bin/bash

# Function to pause and wait for user input
pause() {
    read -p "$*"
}

# Get user input for Git configuration
echo "Please enter your Git user name:"
read git_user_name
echo "Please enter your Git user email:"
read git_user_email

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

echo "Setup complete."


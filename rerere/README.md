
# Git `rerere` Demonstration

This repository demonstrates the usage of Git `rerere` (reuse recorded resolution) to automatically resolve previously encountered merge conflicts.

## Initial Setup

```bash
# Configure Git user
git config --global user.name "Kristerpher Henderson"
git config --global user.email "kris@moosequest.net"

# Create a bare repository
mkdir /path/to/advanced_git_techniques_bare_repo.git
cd /path/to/advanced_git_techniques_bare_repo.git
git init --bare
```

## Setup Local Repository

```bash
# Create and initialize a local repository
mkdir /path/to/advanced_git_techniques_local_repo
cd /path/to/advanced_git_techniques_local_repo
git init

# Add initial content
echo "# Advanced Git Techniques" > README.md
git add README.md
git commit -m "Initial commit with README.md"
```

## Adding the Bare Repository as a Remote

```bash
cd /path/to/advanced_git_techniques_local_repo
git remote add origin /path/to/advanced_git_techniques_bare_repo.git
git remote add github https://github.com/yourusername/your-repo.git
```

## Create Branches and Simulate Conflicts

```bash
# Create and switch to branch 'a'
git checkout -b a
echo "Initial content" > conflict_file.txt
git add conflict_file.txt
git commit -m "Add conflict_file.txt in branch a"
git push origin a

# Create and switch to branch 'b'
git checkout -b b
git pull origin a
echo "Conflicting content" > conflict_file.txt
git commit -am "Edit conflict_file.txt in branch b"
git push origin b

# Switch back to the main branch
git checkout main
git merge a  # Merge branch 'a' into the main branch
git merge b  # Merge branch 'b' into the main branch causing a merge conflict
```

## Enable Git `rerere`

```bash
git config --global rerere.enabled true
```

## Using Git `rerere`

1. **Resolve the First Conflict**
   - When merging branch `b` into `main`, there will be a conflict. Resolve the conflict manually.
   - Commit the resolution.

   ```bash
   git add conflict_file.txt
   git commit -m "Resolved conflict between branches 'a' and 'b'"
   ```

2. **Reproduce the Conflict**
   - Reset the main branch and the branches to reproduce the conflict and see `rerere` in action.
   - Merge again to see `rerere` automatically resolve the conflict.

   ```bash
   git reset --hard HEAD^
   git merge b  # This time, rerere should automatically resolve the conflict
   ```

## Reverting the Changes

To revert all changes and reset the repository for a new demo:

```bash
# Remove the local repository
rm -rf /path/to/advanced_git_techniques_local_repo

# Remove the bare repository
rm -rf /path/to/advanced_git_techniques_bare_repo.git

# Clear Git rerere cache
git rerere clear
```


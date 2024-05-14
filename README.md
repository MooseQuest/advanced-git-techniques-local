
# Advanced Git Techniques - Bare Repository

## Anatomy of a Git Repository

A Git repository is composed of several key components:

1. **HEAD**: 
   - A reference to the current branch or commit.
   - Typically points to the latest commit in the currently checked-out branch.

2. **Branches**:
   - Pointers to specific commits in the repository.
   - Used to create different lines of development.
   - Common default branches include `master` or `main`.

3. **Commits**:
   - The fundamental unit of change in Git.
   - Each commit stores the state of the repository at a specific point in time.
   - Contains metadata such as the author, date, and commit message.

4. **Objects**:
   - Git stores all data in objects: blobs, trees, commits, and tags.
   - **Blobs**: Store file data.
   - **Trees**: Represent directories and contain pointers to blobs and other trees.
   - **Commits**: Link trees together to form the history.
   - **Tags**: Named references to commits, often used for release versions.

5. **Refs**:
   - References to commits.
   - Include branches, tags, and other pointers.

6. **Hooks**:
   - Scripts that Git executes before or after certain events, such as committing or pushing.
   - Useful for automating tasks like code quality checks or deployments.

## Setting Up a Bare Repository

A bare repository is a Git repository without a working directory. It is often used as a central repository for collaboration.

To create a bare repository:
```bash
git init --bare <repository-name>.git
```

A bare repository does not contain a working directory, and its contents are meant to be accessed and manipulated through Git commands.


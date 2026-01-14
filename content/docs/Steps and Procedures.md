## How to disconnect your local repo from GitHub and remove Git tracking

1️⃣ Remove the remote link

Enter the following comman in the terminal Git Bash

```git
git remote remove origin
```

2️⃣ Delete the `.git` folder (stop tracking completely)

Enter the following comman in the terminal Git Bash

```rm
rm -rf .git
```

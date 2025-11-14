# Git & GitHub Fundamentals

Consistent version control habits prevent production outages and enable collaboration. This module gets you ready for the automation projects later in the roadmap.

## Learning Objectives

- Create and clone repositories with SSH and HTTPS
- Understand commits, branches, merges, and rebases
- Resolve merge conflicts with confidence
- Work with pull requests and protected branches on GitHub
- Sign commits and enable branch protections for security

## Daily Command Set

```bash
# configure your identity (run once per machine)
git config --global user.name "Your Name"
git config --global user.email "you@example.com"

# create a feature branch from main
git checkout -b feature/ci-hardening origin/main

# stage, commit, and push changes
git add services/12-codepipeline/README.md
git commit -m "docs: add blue/green deployment notes"
git push -u origin feature/ci-hardening

# keep branch up to date with latest main
git fetch origin
git rebase origin/main

# clean up merged branches
git branch --merged | grep -v "^\*\|main" | xargs git branch -d
```

## Workflow Checklist

- 🔐 Use SSH keys or fine-scoped personal access tokens
- ✅ Protect `main` with pull requests and required checks
- 🧪 Run tests locally before pushing
- 🔄 Keep branches small and focused; squash when appropriate

## Resources

- 📺 [Git & GitHub Crash Course – Traversy Media](https://www.youtube.com/watch?v=SWYqp7iY_Tc)
- 📚 [Pro Git Book (free)](https://git-scm.com/book/en/v2)
- 📖 [GitHub Flow Documentation](https://docs.github.com/en/get-started/quickstart/github-flow)

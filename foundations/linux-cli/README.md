# Linux CLI Essentials

Mastering the Linux terminal is a prerequisite for AWS DevOps work. Use this module to refresh core concepts and commands.

## Learning Objectives

- Navigate the filesystem quickly (`cd`, `ls`, `pwd`)
- Manage files and directories (`cat`, `touch`, `mkdir`, `rm`, `mv`, `cp`)
- Inspect processes and system resources (`top`, `ps`, `free`, `df`)
- Work with `ssh` for remote administration
- Chain commands with pipes, redirects, and command substitution

## Quick Reference

```bash
# list files (detailed, human readable)
ls -alh

# create directories and files
mkdir -p /tmp/labs && touch /tmp/labs/notes.txt

# search recursively for a string
grep -R "search-term" /var/log

# stream logs while excluding noisy lines
tail -f /var/log/syslog | grep -v "health-check"

# transfer files between servers
scp ./artifact.zip ec2-user@<public-ip>:/home/ec2-user/
```

## Practice Lab

1. Launch an AWS Cloud9 environment or connect to an EC2 instance.
2. Create a folder structure for a fictional project using `mkdir -p`.
3. Use `curl` to download a file and inspect it with `head`, `tail`, and `less`.
4. Schedule a one-time task with `at` (or a recurring job with `cron`).
5. Create a simple bash script that backs up `/var/log` to `/tmp/backups`.

## Resources

- 🎮 [AWS Cloud9 IDE](https://aws.amazon.com/cloud9/) – browser-based terminal & IDE
- 📺 [Linux Command Line Full Course – freeCodeCamp](https://www.youtube.com/watch?v=ZtqBQ68cfJc)
- 📘 [explainshell.com](https://explainshell.com/) – command breakdowns

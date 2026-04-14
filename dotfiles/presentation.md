# Dotfiles

In this presentation we will take a look at what is known as dotfiles and how to use them to store your configuration files.

# What are dotfiles?

In **Unix** like systems, dotfiles are files that begin with a dot (.), making them hidden by default.

Usually those files are in your home directory. You can always go to your home directory by typing `cd ~` in your terminal.

Most dotfiles are used to store configuration files for programs, such as Neovim, Git, Bash, etc.

Since *Mac* and *Linux* are Unix-like systems, this roundtable will apply for both of them.
In the case of Windows, I do not know if there is something similar of what we will se here.

# Understanding Unix file types

In Unix like systems, everything is a `file`, and there are different types of files:

- **Regular files (-)**: files that contain data
- **Directories (d)**: files that contain other files
- **Symlinks (l)**: files that point to other files
- **Character devices (c)**: files that represent character devices examples are terminals, serial ports and keyboards `/dev/tty`
- **Block devices (b)**: files that represent block devices such as hard drives, ssds, etc examples are `/dev/sda`
- **Named pipes (p)**: files that represent named pipes, this are special files used for inter-process communication
- **Sockets (s)**: files that represent sockets

A regular user will only come across regular filse, directories and symlinks, so we will not worry about other file types.

# What are symlinks

A symbolic link is a file that serves as a **shorcut or pointer** to another file or directory.

To create a symbolic link, we use the `ln` command with the `-s` flag.

```bash
ln -s /path/to/original /path/to/symlink
```

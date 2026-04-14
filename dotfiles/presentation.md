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

# Why are we talking about file types

The reason why we are going to talk about file types is because we will be using them to create symlinks to our dotfiles, 
every configuration we want to save, we will create a file in a specific directory and then create a symbolic link to that file.

The advantage on this approach is that we can add this specific directory tracked by `git` thus being able to store them in
`Github` or `Gitlab`.

# Creating the dotfiles directory

First, we will create the directory where we will store our dotfiles.

```bash
mkdir -p ~/dotfiles/.config
cd dotfiles
git init
git commit --allow-empty -m "Initial commit"
```

# Where to put the files

With this structure all of the files in the root of the `dotfiles` directory will be linked to the user's home directory.
Examples of this files are `.bashrc`, `.gitconfig`.

Inside each directory we create inside that dotfiles will mirror any directory inside the home folder, so in our example,
whatever we add inside the `.config` directory will be mirrored inside the `~/.config` directory.

# Approach on creating the symlinks

There are two main approches on creating the required symlinks:

- Using the `ln` command
- Using the `stow` command

Personally I prefer using the `ls` command.

# Using the Terminal

On this roundtable we will be going on how to use the terminal to imporve your development workflow

## Choosing your terminal emulator

What do I look for in a terminal, it should have transparency, be GPU accelerated, and manage images

- [Alacritty](https://github.com/alacritty/alacritty) - Does not suppport images
- [Ghostty](https://ghostty.org/) - This is my current favorite
- [kitty](https://sw.kovidgoyal.net/kitty/)
- [wezterm](https://github.com/wez/wezterm)

## Choosing a shell

There are a few shells there to choose from

- [zsh](https://www.zsh.org/) - This is the one I use
- [bash](https://www.gnu.org/software/bash/)
- [fish](https://fishshell.com/)
- [nushell](https://www.nushell.sh/)

## Configuring your shell

If using zsh, you can configure it using tools as:

- [starship](https://starship.rs/) - This is my favorite
- [oh-my-zsh](https://ohmyz.sh/)

## Introducing dotfiles

Most of the applications we will be discussing here can be configured, and their configuration will be stored in:

```bash
~/.config/
```

This is known as dotfiles, and you can also save them to a git repository, in Linux we can use symlinks to achieve this

```bash
ln -s /path/to/config ~/.config
```

## Moving around

To move through different directories you can use the `cd` command, however you can also use the *Better CD* tool

- [zoxide](https://github.com/ajeetdsouza/zoxide)

```bash
z /path
```

this will save the history of the directories and later you can use the `z` command to go back to them

```bash
z .config
z chingu andres
```

## fzf

fzf is a tool that allows you to filter through a list of files and directories, it is a good tool to use when you have a lot of files to choose from

- [fzf](https://github.com/junegunn/fzf)

```bash
fzf
``` 

## tmux

tmux is a terminal multiplexer, it allows you to have multiple terminals open at the same time

- [tmux](https://github.com/tmux/tmux)

```bash
tmux
```

## sesh

this is a tmux session manager that uses zoxide and fzf to work

- [sesh](https://github.com/joshmedeski/sesh)

```bash
sesh
```

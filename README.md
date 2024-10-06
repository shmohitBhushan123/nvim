# NVIM Setup 
This is a basic NVIM Setup with plugins to my preference along as well as keybindings.

## Initial Setup

### Install NEOVIM And Lua
Before having cloning this repository, make sure you have [NEOVIM](https://github.com/neovim/neovim/blob/master/INSTALL.md) and [Lua](https://www.lua.org/download.html)  installed

### Adding NEOVIM to $PATH
In your `~/.zshrc` file, make sure you have these two commands added to your path:  

`export PATH="<PATH_TO_nvim_macos-arm64>/bin:$PATH"`

Add vi as an alias to nvim:  

`alias vi="nvim:`  

## Location of NeoVim Setup
When adding this repository to your path, make sure you have these files in this path:

`/Users/<USERNAME>/.config`

## Running Packer
After running `vi` and opening neovim, run `:PackerInstall` to install all plugins or `PackerUpdate` if plugins are due for an update

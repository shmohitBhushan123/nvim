# NVIM Setup 
This is a basic NVIM Setup with plugins to my preference along as well as keybindings.

## Initial Setup

### Install NEOVIM And Lua
Before having cloning this repository, make sure you have [NEOVIM](https://github.com/neovim/neovim/blob/master/INSTALL.md) and [Lua](https://www.lua.org/download.html)  installed

### Adding NEOVIM to $PATH
In your `~/.zshrc` file, make sure you have neovim binary added to your path (if you are not using brew to install neovim):

`export PATH="<PATH_TO_nvim_macos-arm64>/bin:$PATH"`

## Location of NeoVim Setup
When adding this repository to your path, make sure you have this repo added within your .config directory. The path should look like this:

`/Users/<USERNAME>/.config`

## Running Packer
After running `nvim` and opening neovim, run `:PackerSync` to install all plugins or `:PackerUpdate` to list if plugins are due for an update


## Github Copilot
Copilot.vim is a submodule of this repository. Refer to https://github.com/github/copilot.vim for more information on how to set it up.

## Code Companion
Neovim Version 0.11 is required to use Code Companion

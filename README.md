# NeoVim Custom configurations
Welcome to my custom NeoVim setup! This configuration is designed to enhance your productivity with carefully selected plugins and intuitive key mappings. Save time by using a well-tuned setup instead of hunting for the perfect configurations yourself.

## Prerequisite
Neovim needs a special font to show the special symbols, icons also so we have to install first from link download: [Nerd font](https://www.nerdfonts.com/font-downloads), my personal favorite font is [Jetbrains Mono](https://www.programmingfonts.org/#jetbrainsmono)

## Install 
### 1. Install plugin manager
In the project we are going to use the [Packer](https://github.com/wbthomason/packer.nvim) one of the most popular plugin manager repositories

To get started, first clone the repository to somewhere on your pack  path, e.g.:

**Unix, Linux Installation**
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

**Windows Powershell Installation**
```bash
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```
### 2. Clone the configuration repository
Just execute command for specific platform

**Unix, Linux Installation**
```bash
git clone https://github.com/secretdeveloperisme/nvim-config ~/.config/nvim
```

**Windows Powershell Installation**
```bash
git clone https://github.com/secretdeveloperisme/nvim-config %USERPROFILE%\AppData\Local\nvim
```

### 3. Update plugins
Open neovim and execute command `:PackerUpdate`

### 4. Install LSP servers

- Open mason by executing command `:Mason`
- Then find the corresponding LSP languages that you want to install as clangd(C/C++), rust-analyzer(rust)...
- If you would like to install debugger adapter protocol (DAP) servers, just navigate to the DAP tab and install the dap for appropriate languages.

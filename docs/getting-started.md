# Getting Started

This guide will help you install and set up this Neovim configuration.

::: tip Discovering Keybindings
Press `<leader>` (Space) and wait to see available keybindings with which-key, or press `<leader>fk` (Space + f + k) to search keybindings with fuzzy finder!
:::

## Prerequisites

Before installing, make sure you have these tools installed:

### Required

- **Neovim 0.11+**: Required for native LSP features

  ::: code-group
  ```bash [macOS]
  brew install neovim
  ```

  ```bash [Linux (Ubuntu/Debian)]
  # Option 1: Using snap (recommended for latest version)
  sudo snap install nvim --classic

  # Option 2: Using apt (may be older version)
  sudo apt install neovim
  ```

  ```bash [Linux (Fedora)]
  sudo dnf install neovim
  ```

  ```bash [Linux (Arch)]
  sudo pacman -S neovim
  ```

  ```powershell [Windows (Scoop)]
  scoop install neovim
  ```

  ```powershell [Windows (Chocolatey)]
  choco install neovim
  ```

  ```powershell [Windows (Winget)]
  winget install Neovim.Neovim
  ```
  :::

  Verify installation:
  ```bash
  nvim --version
  ```

- **Git**: For plugin management

  ::: code-group
  ```bash [macOS]
  # Usually pre-installed, verify with:
  git --version
  ```

  ```bash [Linux (Ubuntu/Debian)]
  sudo apt install git
  ```

  ```bash [Linux (Fedora)]
  sudo dnf install git
  ```

  ```bash [Linux (Arch)]
  sudo pacman -S git
  ```

  ```powershell [Windows]
  # Git is usually installed with GitHub Desktop or:
  winget install Git.Git
  ```
  :::

- **Node.js & npm**: For LSP servers and formatters

  ::: code-group
  ```bash [macOS]
  brew install node
  ```

  ```bash [Linux (Ubuntu/Debian)]
  # Using NodeSource repository for latest LTS
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt install nodejs
  ```

  ```bash [Linux (Fedora)]
  sudo dnf install nodejs npm
  ```

  ```bash [Linux (Arch)]
  sudo pacman -S nodejs npm
  ```

  ```powershell [Windows (Scoop)]
  scoop install nodejs-lts
  ```

  ```powershell [Windows (Chocolatey)]
  choco install nodejs-lts
  ```

  ```powershell [Windows (Winget)]
  winget install OpenJS.NodeJS.LTS
  ```
  :::

  Verify installation:
  ```bash
  node --version
  npm --version
  ```

### Recommended

- **ripgrep**: For fast searching with fzf-lua

  ::: code-group
  ```bash [macOS]
  brew install ripgrep
  ```

  ```bash [Linux (Ubuntu/Debian)]
  sudo apt install ripgrep
  ```

  ```bash [Linux (Fedora)]
  sudo dnf install ripgrep
  ```

  ```bash [Linux (Arch)]
  sudo pacman -S ripgrep
  ```

  ```powershell [Windows (Scoop)]
  scoop install ripgrep
  ```

  ```powershell [Windows (Chocolatey)]
  choco install ripgrep
  ```

  ```powershell [Windows (Winget)]
  winget install BurntSushi.ripgrep.MSVC
  ```
  :::

- **fd**: For file finding (required on macOS due to BSD `find` incompatibility, highly recommended on all platforms)

  ::: code-group
  ```bash [macOS]
  brew install fd
  ```

  ```bash [Linux (Ubuntu/Debian)]
  sudo apt install fd-find
  # Note: On Ubuntu/Debian, the binary is called 'fdfind' instead of 'fd'
  # Create a symlink to use 'fd':
  mkdir -p ~/.local/bin
  ln -s $(which fdfind) ~/.local/bin/fd
  ```

  ```bash [Linux (Fedora)]
  sudo dnf install fd-find
  ```

  ```bash [Linux (Arch)]
  sudo pacman -S fd
  ```

  ```powershell [Windows (Scoop)]
  scoop install fd
  ```

  ```powershell [Windows (Chocolatey)]
  choco install fd
  ```

  ```powershell [Windows (Winget)]
  winget install sharkdp.fd
  ```
  :::

- **A Nerd Font**: For icons (recommended: JetBrainsMono Nerd Font)

  ::: code-group
  ```bash [macOS]
  brew install --cask font-jetbrains-mono-nerd-font
  ```

  ```bash [Linux]
  # Download and install manually
  mkdir -p ~/.local/share/fonts
  cd ~/.local/share/fonts
  curl -fLo "JetBrains Mono Nerd Font Complete.ttf" \
    https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf
  fc-cache -fv
  ```

  ```powershell [Windows (Scoop)]
  scoop bucket add nerd-fonts
  scoop install JetBrainsMono-NF
  ```

  ```powershell [Windows (Manual)]
  # Download from: https://www.nerdfonts.com/font-downloads
  # 1. Download JetBrainsMono Nerd Font
  # 2. Extract the zip file
  # 3. Right-click font files and select "Install for all users"
  ```
  :::

  After installing, configure your terminal to use the font (see [Terminal Configuration](#terminal-configuration) below).

## Installation

### 1. Backup Existing Configuration

If you have an existing Neovim configuration, back it up first:

::: code-group
```bash [macOS/Linux]
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
```

```powershell [Windows (PowerShell)]
# Backup config
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup -ErrorAction SilentlyContinue

# Backup data
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.backup -ErrorAction SilentlyContinue

# Backup state
Move-Item $env:LOCALAPPDATA\nvim-state $env:LOCALAPPDATA\nvim-state.backup -ErrorAction SilentlyContinue
```

```batch [Windows (CMD)]
:: Backup config
move "%LOCALAPPDATA%\nvim" "%LOCALAPPDATA%\nvim.backup"

:: Backup data
move "%LOCALAPPDATA%\nvim-data" "%LOCALAPPDATA%\nvim-data.backup"

:: Backup state
move "%LOCALAPPDATA%\nvim-state" "%LOCALAPPDATA%\nvim-state.backup"
```
:::

### 2. Install This Configuration

Clone or copy this configuration:

::: code-group
```bash [macOS/Linux]
# Clone from GitHub (update with your repo URL)
git clone https://github.com/jjohnson1994/neojim ~/.config/nvim

# Or if you already have it:
# It should be at ~/.config/nvim
```

```powershell [Windows (PowerShell)]
# Clone from GitHub (update with your repo URL)
git clone https://github.com/jjohnson1994/neojim $env:LOCALAPPDATA\nvim

# Or if you already have it:
# It should be at %LOCALAPPDATA%\nvim
```

```batch [Windows (CMD)]
:: Clone from GitHub (update with your repo URL)
git clone https://github.com/jjohnson1994/neojim %LOCALAPPDATA%\nvim
```
:::

### 3. First Launch

Launch Neovim for the first time:

```bash
nvim
```

**What happens:**

- lazy.nvim will bootstrap itself automatically
- All plugins will be installed
- You'll see a dashboard when plugins finish installing

This may take a few minutes on first launch.

### 4. Install LSP Servers and Tools

After plugins are installed, open Mason to install language servers:

```vim
:Mason
```

**Install these packages:**

#### LSP Servers

- `json-lsp` - JSON language server
- `lua_ls` - Lua language server
- `svelte` - Svelte language server (optional)
- `vtsls` - TypeScript/JavaScript language server

#### Formatters

- `prettierd` - Faster Prettier daemon
- `stylua` - Lua formatter
- `eslint_d` - ESLint daemon for faster linting/formatting

#### Linters

- `eslint_d` - (if not already installed above)

**Tip**: Use `/` to search in Mason, `i` to install, `X` to uninstall.

### 5. Restart Neovim

Close and reopen Neovim:

```bash
nvim
```

### 6. Verify Installation

Check that everything is working:

```vim
:checkhealth lazy
:checkhealth vim.lsp
:checkhealth nvim-treesitter
```

Look for any warnings or errors and address them.

## Configuration Structure

After installation, your configuration will look like this:

```
~/.config/nvim/
├── init.lua              # Entry point
├── doc/
│   └── neojim.txt        # Built-in help documentation
├── lua/
│   ├── options.lua       # Core settings and keymaps
│   └── plugins/          # Plugin configurations
│       ├── lsp-config.lua
│       ├── blink.lua
│       ├── treesitter.lua
│       ├── update-notifier.lua
│       └── ...
└── lsp/                  # LSP server configs
    ├── lua_ls.lua
    ├── vtsls.lua
    └── svelte.lua
```

## First Steps

After installation, try these commands:

### Built-in Help

This configuration includes comprehensive built-in help documentation:

```vim
:help neojim
```

**Browse specific sections:**
```vim
:help neojim-keybindings   " Complete keybinding reference
:help neojim-plugins       " All installed plugins
:help neojim-lsp          " LSP server configuration
:help neojim-customization " Customization guide
```

### Open File Explorer

```
<leader>e  (Space + e)
```

### Find Files

```
<leader>ff  (Space + f + f)
```

### Search in Files

```
<leader>fg  (Space + f + g)
```

### See All Keybindings

**Option 1: which-key popup**
```
<leader>  (Space, then wait)
```
which-key will show you all available keybindings in a popup!

**Option 2: Fuzzy search keybindings**
```
<leader>fk  (Space + f + k)
```
Opens a searchable fuzzy finder list of all keybindings

## Terminal Configuration

### Font Setup

Make sure your terminal is using a Nerd Font:

**macOS - iTerm2:**

1. Preferences → Profiles → Text
2. Font → Change Font
3. Select "JetBrainsMono Nerd Font"

**macOS - Terminal.app:**

1. Preferences → Profiles
2. Font → Change
3. Select "JetBrainsMono Nerd Font"

**macOS - Ghostty:**

JetBrains Mono is configured out of the box! No additional setup needed.

If you want to use the Nerd Font variant specifically, edit `~/.config/ghostty/config`:
```
font-family = JetBrainsMono Nerd Font
```

**Linux - GNOME Terminal:**

1. Preferences → Profile → Text
2. Uncheck "Use the system fixed width font"
3. Click the font button
4. Select "JetBrainsMono Nerd Font"

**Linux - Alacritty:**

Edit `~/.config/alacritty/alacritty.yml`:
```yaml
font:
  normal:
    family: "JetBrainsMono Nerd Font"
  size: 12.0
```

**Linux - Kitty:**

Edit `~/.config/kitty/kitty.conf`:
```
font_family JetBrainsMono Nerd Font
```

**Windows - Windows Terminal:**

1. Settings → Profiles → Defaults (or specific profile)
2. Appearance → Font face
3. Select "JetBrainsMono Nerd Font"

Or edit `settings.json`:
```json
{
  "profiles": {
    "defaults": {
      "font": {
        "face": "JetBrainsMono Nerd Font"
      }
    }
  }
}
```

**Windows - PowerShell (Console):**

1. Right-click title bar → Properties
2. Font tab
3. Select "JetBrainsMono NF"

**VS Code Integrated Terminal (All platforms):**

Settings → Terminal › Integrated: Font Family
```json
"terminal.integrated.fontFamily": "JetBrainsMono Nerd Font"
```

## Updating

### Automatic Updates

**Auto-Update on Startup:**

NeoJim can automatically update everything on startup. Toggle with `<leader>uu` (enabled by default).

When auto-update is enabled, the following are automatically updated:
- **Config**: Checks for new commits and notifies when available
- **Plugins**: Updates all lazy.nvim plugins in the background
- **Treesitter parsers**: Updates all installed parsers silently (only notifies if updates occur)
- **Mason registry**: Refreshes to check for package updates (doesn't auto-install)

All updates run asynchronously without blocking startup. The toggle state persists across sessions.

::: tip
Mason packages are not auto-installed on startup to avoid slowdowns. Use `:MasonUpdateAll` to update all packages, or open `:Mason` and press `U`.
:::

### Manual Updates

**Config Updates:**

```vim
:UpdateConfig
```

This command will:
1. Check for uncommitted changes (warns if any exist)
2. Pull the latest changes from the remote repository
3. Notify you to restart Neovim to apply updates

::: warning
Make sure to commit or stash any local changes before updating to avoid conflicts.
:::

**Plugin Updates:**

```vim
:Lazy sync
```

**LSP Server and Tool Updates:**

```vim
:MasonUpdateAll   # Update all packages automatically
```

Or use the interactive UI:

```vim
:Mason
# Press 'U' to update all installed packages
```

## Uninstalling

To remove this configuration:

::: code-group
```bash [macOS/Linux]
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
```

```powershell [Windows (PowerShell)]
Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim
Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim-data
Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim-state
```

```batch [Windows (CMD)]
rmdir /s /q "%LOCALAPPDATA%\nvim"
rmdir /s /q "%LOCALAPPDATA%\nvim-data"
rmdir /s /q "%LOCALAPPDATA%\nvim-state"
```
:::

Then restore your backup if you made one:

::: code-group
```bash [macOS/Linux]
mv ~/.config/nvim.backup ~/.config/nvim
mv ~/.local/share/nvim.backup ~/.local/share/nvim
mv ~/.local/state/nvim.backup ~/.local/state/nvim
```

```powershell [Windows (PowerShell)]
Move-Item $env:LOCALAPPDATA\nvim.backup $env:LOCALAPPDATA\nvim
Move-Item $env:LOCALAPPDATA\nvim-data.backup $env:LOCALAPPDATA\nvim-data
Move-Item $env:LOCALAPPDATA\nvim-state.backup $env:LOCALAPPDATA\nvim-state
```

```batch [Windows (CMD)]
move "%LOCALAPPDATA%\nvim.backup" "%LOCALAPPDATA%\nvim"
move "%LOCALAPPDATA%\nvim-data.backup" "%LOCALAPPDATA%\nvim-data"
move "%LOCALAPPDATA%\nvim-state.backup" "%LOCALAPPDATA%\nvim-state"
```
:::

## Next Steps

- [Learn the Keybindings](/keybindings)
- [Customize Your Setup](/customization)
- [Explore Plugins](/plugins)
- [Configure LSP Servers](/lsp-servers)

## Getting Help

Having issues? Check the [Troubleshooting](/troubleshooting) guide or the [FAQ](/faq).

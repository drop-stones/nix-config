# Project Context

This is a NixOS and Home Manager configuration repository supporting multiple platforms (NixOS, macOS, WSL2).

## Language

- All code comments, commit messages, and documentation must be written in English
- Conversations with Claude may be in Japanese, but any files committed to the repository must use English

## Repository Structure

- `hosts/` - Host-specific configurations (nixos, nixos-wsl, nixos-wsl-work, darwin)
- `home/` - Home Manager modules
  - `modules/shell/` - Shell environment and terminal tools (fish, zellij, bat, fzf, etc.)
  - `modules/dev/` - Development tools (git, neovim, claude-code, copilot, ssh, etc.)
  - `modules/apps/` - GUI applications (firefox, alacritty, steam, 1password)
  - `modules/desktop/` - Desktop environment (DMS, niri, fonts, theme, fcitx5, etc.)
  - `modules/lang/` - Language toolchains (nix, rust, python, nodejs, etc.)
- `system/` - NixOS/darwin system modules
- `lib/` - Custom Nix library functions
- `pkgs/` - Custom packages
- `overlays/` - Nixpkgs overlays
- `data/` - Per-user/platform data (username, homeDirectory, useSecrets flag, git config)
- `secrets/` - Secret management (agenix, auto-loaded when `data.user.useSecrets` is true)

## Module Classification

Modules are categorized by **purpose**, not by implementation:

- **shell**: Would you use it without a development project? (bat, fzf, fish, zellij)
- **dev**: Requires a development project context (git, neovim, claude-code, copilot)
- **apps**: GUI applications launched by the user (firefox, steam, 1password)
- **desktop**: Desktop environment infrastructure (window manager, input method, theme)
- **lang**: Programming language toolchains

## Platform System

- Modules under `apps/` and `desktop/` use `localLib.listPlatformImports` with `common/` and `<platform>/` subdirectories
- Modules under `shell/`, `dev/`, and `lang/` use `localLib.listImports` (platform-agnostic at the top level)
- Individual modules (e.g., `fish/`, `ssh/`) may use `listPlatformImports` internally for platform-specific variants
- Use `data.user.useSecrets` to conditionally skip modules (e.g., claude-code) or config files (e.g., copilot-instructions.md)

## Nix Conventions

### Module Structure

- Use `default.nix` with `localLib.listImports` for automatic imports
- Separate concerns into individual `.nix` files (e.g., `environment.nix`, `keybindings.nix`)
- For config files, create a `config/` or `settings/` subdirectory

### Config File Management

- Place raw config files (JSON, KDL, etc.) alongside `default.nix`
- Use `localLib.concatConfig` for concatenating multiple config fragments
- Use `xdg.configFile` for XDG-compliant applications
- Use `home.file` for files that must be in `$HOME`

### Function Arguments

- Use `_:` when no arguments are needed (linter preference)
- Destructure only the arguments you need: `{ pkgs, lib, ... }:`

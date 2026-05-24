# Project Context

This is a NixOS and Home Manager configuration repository supporting multiple platforms (NixOS, macOS, WSL2).

## Language

- All code comments, commit messages, and documentation must be written in English
- Conversations with Claude may be in Japanese, but any files committed to the repository must use English

## Repository Structure

The repository is organized into three conceptual layers:

1. **host** — individual machine configurations (`hosts/`)
2. **platform** — per-platform base settings and module enablement (`home/`, `system/`)
3. **module** — reusable module library, basically platform-agnostic (`modules/`)

- `hosts/` - Host-specific configurations (nixos, wsl, wsl-work, darwin)
- `home/` - Per-platform Home Manager base settings and module enablement (common, nixos, darwin, wsl)
- `system/` - Per-platform NixOS/darwin base settings and module enablement (common, nixos, darwin, wsl)
- `modules/` - Reusable module library
  - `home/shell/` - Shell environment and terminal tools (fish, zellij, bat, fzf, etc.)
  - `home/dev/` - Development tools (git, neovim, claude-code, copilot, ssh, etc.)
  - `home/apps/` - GUI applications (firefox, alacritty, steam, 1password)
  - `home/desktop/` - Desktop environment (DMS, niri, fonts, theme, fcitx5, etc.)
  - `home/lang/` - Language toolchains (nix, rust, python, nodejs, etc.)
  - `system/` - NixOS/darwin system modules (apps, desktop, dev, hardware)
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

- Modules under `modules/home/apps/` and `modules/home/desktop/` use `localLib.listPlatformImports` with `common/` and `<platform>/` subdirectories
- Modules under `modules/home/shell/`, `modules/home/dev/`, and `modules/home/lang/` use `localLib.listImports` (platform-agnostic at the top level)
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

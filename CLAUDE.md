# Project Context

This is a NixOS and Home Manager configuration repository.

## Language

- All code comments, commit messages, and documentation must be written in English
- Conversations with Claude may be in Japanese, but any files committed to the repository must use English

## Repository Structure

- `home/` - Home Manager modules
- `system/` - NixOS system modules
- `hosts/` - Host-specific configurations
- `lib/` - Custom Nix library functions
- `pkgs/` - Custom packages
- `overlays/` - Nixpkgs overlays
- `data/` - Data files
- `secrets/` - Secret management

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

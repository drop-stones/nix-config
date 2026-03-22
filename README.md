# nix-config

NixOS and Home Manager configuration for multiple platforms.

## Supported Platforms

| Host | Platform | Architecture | Description |
|------|----------|-------------|-------------|
| [`nixos`](hosts/nixos/) | NixOS | x86_64-linux | Standalone NixOS desktop |
| [`nixos-wsl`](hosts/nixos-wsl/) | NixOS on WSL2 | x86_64-linux | WSL2 personal environment |
| [`nixos-wsl-work`](hosts/nixos-wsl-work/) | NixOS on WSL2 | x86_64-linux | WSL2 work environment (with [secrets](secrets/)) |
| [`darwin`](hosts/darwin/) | macOS (nix-darwin) | x86_64-darwin | Intel Mac |

## Repository Structure

```
.
├── hosts/           # Host-specific configurations
├── home/            # Home Manager modules
│   └── modules/
│       ├── shell/   # Shell and terminal tools (fish, zellij, bat, fzf, ...)
│       ├── dev/     # Development tools (git, neovim, claude-code, ...)
│       ├── apps/    # GUI applications (firefox, alacritty, 1password, ...)
│       ├── desktop/ # Desktop environment (niri, fonts, theme, fcitx5, ...)
│       └── lang/    # Language toolchains (nix, rust, python, nodejs, ...)
├── system/          # NixOS/darwin system modules
├── lib/             # Custom Nix library functions
├── pkgs/            # Custom packages
├── overlays/        # Nixpkgs overlays
├── data/            # Per-user/platform data (username, homeDirectory, ...)
└── secrets/         # Secret management (agenix)
```

## Installation

See the README in each host directory:

- [NixOS installation](hosts/nixos/README.md)
- [macOS (darwin) installation](hosts/darwin/README.md)
- [WSL2 installation](hosts/nixos-wsl/README.md)

## Secrets

See [secrets/README.md](secrets/README.md) for the agenix-based secrets system.

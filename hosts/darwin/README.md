# macOS (darwin) Installation

## Prerequisites

- Intel-based Mac
- Internet connection

## Step 1: Install Nix

Install Nix using the [official installer](https://nixos.org/download/#nix-install-macos):

```bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
```

## Step 2: Rebuild with nix-darwin

```bash
sudo nix --extra-experimental-features "nix-command flakes" run nix-darwin/nix-darwin-25.11#darwin-rebuild -- switch --flake "github:drop-stones/nix-config#darwin"
```

## Step 3: Configure Apps

### 1Password

1. Disable auto updates: Settings > Advanced > Install updates automatically
2. Enable SSH agent: Settings > Developer > Use the SSH Agent

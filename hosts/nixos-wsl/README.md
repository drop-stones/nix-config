# WSL2 (NixOS-WSL) Installation

## Prerequisites

- Windows with WSL2 enabled
- Internet connection

## Step 1: Install NixOS-WSL

1. Download the latest release from [NixOS-WSL Releases](https://github.com/nix-community/NixOS-WSL/releases)
2. Double-click the downloaded file to import
3. Launch NixOS:

   ```bash
   wsl -d NixOS
   ```

4. Update NixOS:

   ```bash
   sudo nix-channel --update
   sudo nixos-rebuild switch
   ```

## Step 2: Rebuild with nix-config

```bash
sudo nixos-rebuild switch --flake "github:drop-stones/nix-config#nixos-wsl"
```

## nixos-wsl-work Variant

The [`nixos-wsl-work`](../nixos-wsl-work/) host uses the same platform (`nixos-wsl`) but with different user data (`work` instead of `drop-stones`). It also enables [secrets](../../secrets/) via `useSecrets = true`.

```bash
sudo nixos-rebuild switch --flake "github:drop-stones/nix-config#nixos-wsl-work"
```

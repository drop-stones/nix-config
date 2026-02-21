# nix-config

## Installation

### 🐧 NixOS

#### Step.1 Create Minimal ISO USB

#### Step.2 Disk partitioning

Check your device name:

```bash
lsblk
```

Create new hosts and set device name for disko.  
And then, execute `disko`.

```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- \
  --mode zap_create_mount \
  --flake github:drop-stones/nix-config#nixos
```

Finally, generate `hardware-configuration.nix` and add this as your a new host module.

```bash
sudo nixos-generate-config --no-filesystems --root /mnt
cat /mnt/etc/nixos/hardware-configuration.nix
```

#### Step.3 Install `nix-config`

```bash
sudo nixos-install --no-write-lock-file --flake github:drop-stones/nix-config#nixos
```

After installation, you need to set password:

```bash
passwd drop-stones
reboot
```

### 🍎 macOS

[nix-darwin](https://github.com/nix-darwin/nix-darwin)

#### Step.1 Install `nix`

[Downlaod Nix](https://nixos.org/download/#nix-install-macos)

```bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
```

#### Step.2 Rebuild with `nix-config`

[nix-config](https://github.com/drop-stones/nix-config)

```bash
sudo nix --extra-experimental-features "nix-command flakes" run nix-darwin/nix-darwin-25.11#darwin-rebuild -- switch --flake "github:drop-stones/nix-config#darwin-intel"
```

#### Step.3 Configure Apps

- [1Password](https://1password.com)
  - Disable auto updates: Settings > Advanced > Install updates automatically
  - Enable ssh-agent: Settings > Developer > Use the SSH Agent

### 🪟 WSL2

[NixOS-WSL](https://github.com/nix-community/NixOS-WSL)

#### Step.1 Install `NixOS-WSL`

1. Download the latest release from [NixOS-WSL Release](https://github.com/nix-community/NixOS-WSL/releases)
2. Double-click the file you just downloaded
3. Run NixOS:

   ```bash
   wsl -d NixOS
   ```

4. Update NixOS:

   ```bash
   sudo nix-channel --update
   sudo nixos-rebuild switch
   ```

#### Step.2 Rebuild with `nix-config`

[nix-config](https://github.com/drop-stones/nix-config)

```bash
sudo nixos-rebuild switch --flake "github:drop-stones/nix-config#nixos-wsl"
```

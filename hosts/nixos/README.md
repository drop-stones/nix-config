# NixOS Installation

## Prerequisites

- A USB drive for the minimal ISO
- Internet connection

## Step 1: Create Minimal ISO USB

Download the [NixOS minimal ISO](https://nixos.org/download/#nixos-iso) and write it to a USB drive.

## Step 2: Disk Partitioning

Boot from the USB and check your device name:

```bash
lsblk
```

Run disko to partition and mount the disk:

```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- \
  --mode zap_create_mount \
  --flake github:drop-stones/nix-config#nixos
```

## Step 3: Generate hardware-configuration.nix

```bash
sudo nixos-generate-config --no-filesystems --root /mnt
cat /mnt/etc/nixos/hardware-configuration.nix
```

Copy the output into `hosts/nixos/hardware-configuration.nix` and commit it.

## Step 4: Install

```bash
sudo nixos-install --no-write-lock-file --flake github:drop-stones/nix-config#nixos
```

## Step 5: Post-install

Set the user password and reboot:

```bash
passwd drop-stones
reboot
```

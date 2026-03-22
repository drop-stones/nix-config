# Secrets Management

This directory configures [agenix](https://github.com/ryantm/agenix) for managing encrypted secrets.

## Overview

Secrets are loaded as NixOS module when `data.user.useSecrets` is `true` (see `lib/nixosSystem.nix`). Currently, only the `nixos-wsl-work` host (using `work` user data) enables secrets.

## Managed Secrets

| Secret | Decrypted Path | Source |
|--------|---------------|--------|
| `gitconfig` | `~/.config/git/config` | `secrets-config/nixos-wsl/git/config.age` |
| `fish-config` | `~/.config/fish/conf.d/zzz-local.fish` | `secrets-config/nixos-wsl/fish/conf.d/local.fish.age` |

## How It Works

1. Encrypted `.age` files are stored in a private repository ([`secrets-config`](https://github.com/drop-stones/secrets-config))
2. The flake input `secrets-config` pulls this repo via SSH
3. `agenix` decrypts the files at activation time using an age key
4. Decrypted files are symlinked to their target paths

## Decryption Key

The age identity key must be placed at:

```
~/.config/age/keys.txt
```

This path is configured in `secrets/default.nix` via `age.identityPaths`.

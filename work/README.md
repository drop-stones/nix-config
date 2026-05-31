# Work Profile

This directory provides the NixOS module loaded for hosts with `host.user.profile == "work"`. It combines:

- [agenix](https://github.com/ryantm/agenix)-based encrypted secrets (from the private [`work-config`](https://github.com/drop-stones/work-config) repo)
- Work-only system packages (e.g., `google-cloud-sdk`) imported from `work-config/modules`

Currently only the `nixos-wsl-work` host uses this profile (see `lib/nixosSystem.nix`).

## Managed Secrets

| Secret | Decrypted Path | Source |
|--------|---------------|--------|
| `gitconfig` | `~/.config/git/config` | `work-config/nixos-wsl/git/config.age` |
| `git-personal-identity` | `~/.config/git/personal-identity` | `work-config/nixos-wsl/git/personal-identity.age` |
| `fish-config` | `~/.config/fish/conf.d/zzz-local.fish` | `work-config/nixos-wsl/fish/conf.d/local.fish.age` |
| `copilot-instructions` | `~/.config/copilot/copilot-instructions.md` | `work-config/nixos-wsl/copilot/copilot-instructions.md.age` |

## How It Works

1. Encrypted `.age` files are stored in a private repository ([`work-config`](https://github.com/drop-stones/work-config))
2. The flake input `work-config` pulls this repo via SSH
3. `agenix` decrypts the files at activation time using an age key
4. Decrypted files are symlinked to their target paths

## Decryption Key

The age identity key must be placed at:

```
~/.config/age/keys.txt
```

This path is configured in `work/default.nix` via `age.identityPaths`.

# 1Password

Multi-platform password manager. Used for SSH key storage, Git commit signing,
and (potentially) the 1Password CLI.

## What Nix Manages

| Item | Location | Platforms |
|------|----------|-----------|
| Install 1Password GUI | [`1password-gui.nix`](./1password-gui.nix) | NixOS, darwin |
| Enable system integration (`programs._1password`) | [`1password.nix`](./1password.nix) | NixOS, darwin |
| polkit policy owner | [`../nixos/`](../nixos/) | NixOS |
| Autostart on graphical session | [`modules/home/apps/1password/systemd.nix`](../../../../../modules/home/apps/1password/systemd.nix) | NixOS |
| `SSH_AUTH_SOCK` / `IdentityAgent` → 1Password agent | [`modules/home/dev/ssh/{nixos,darwin}/1password.nix`](../../../../../modules/home/dev/ssh/) | NixOS, darwin |
| Git commit signing via 1Password SSH key | [`data/git/*.nix`](../../../../../data/git/) | All |
| WSL: symlink Windows `op-ssh-sign-wsl.exe` into WSL `PATH` | [`modules/home/shell/fish/wsl/plugins/wslwrap/interactive.nix`](../../../../../modules/home/shell/fish/wsl/plugins/wslwrap/interactive.nix) | WSL |

## Manual GUI Setup (per device)

The 1Password app stores its preferences in an integrity-protected file, so
these settings cannot be managed declaratively and must be enabled by hand
once per device.

### NixOS / macOS

After installing and signing in to your 1Password account, open the app's
**Settings** and enable:

- **Developer**
  - Use the SSH agent (required: makes `~/.1password/agent.sock` work)
  - Integrate with 1Password CLI (required if you plan to use `op`)
- **Browsers**
  - Connect to your installed browsers (then install the 1Password extension
    from the browser side as well)
- **Updates** (macOS only)
  - Disable "Install updates automatically" (Nix handles updates)

### WSL2

WSL hosts do **not** install 1Password Linux native. They reuse the
Windows-side 1Password through symlinked `.exe` shims:

- `ssh.exe` is used instead of Linux openssh
- `op-ssh-sign-wsl.exe` is used for Git commit signing
- SSH keys live in Windows 1Password and are served by its built-in agent

On the **WSL side**, no extra setup is required after `nixos-rebuild switch` —
the wslwrap plugin handles the symlinks and the Nix config points Git at the
right binaries.

## 1Password CLI (`op`)

The CLI is not currently installed via Nix. If/when adding it:

- NixOS / darwin: add `_1password-cli` to a home module
- WSL: install `op.exe` on the Windows side instead; the Linux `op` cannot
  authenticate against Windows-side 1Password

After installation, run `op signin` once. The GUI will prompt to allow CLI
integration (requires the **Developer > Integrate with 1Password CLI** toggle
above).

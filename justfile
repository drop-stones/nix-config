set shell := ["fish", "-c"]

host_default := if os() == "macos" {
    "darwin"
} else if env("WSL_DISTRO_NAME", "") != "" {
    if env("USER") == "work" { "nixos-wsl-work" } else { "nixos-wsl" }
} else {
    "nixos"
}

# nixos-rebuild runs as root, which bypasses the nix-daemon and downloads
# directly using root's own environment. sudo resets the environment by
# default, so forward the ambient proxy (e.g. the corporate WSL proxy) to
# root. No-op when these vars are unset (personal machines).
rebuild_cmd := if os() == "macos" { "darwin-rebuild" } else { "sudo --preserve-env=http_proxy,https_proxy nixos-rebuild" }

# Interactive recipe picker (default).
_default:
    @just --choose

# Place the age private key from 1Password to /etc/age/keys.txt.
setup-age-key profile="work":
    op read "op://Private/age-{{profile}}/password" \
      | sudo install -D -m 0400 -o root -g root /dev/stdin /etc/age/keys.txt
    @echo "Placed /etc/age/keys.txt for profile '{{profile}}'"

# Rebuild and switch system configuration.
switch host=host_default:
    {{rebuild_cmd}} switch --flake .#{{host}}

# Update flake inputs. Pass an input name to update only that one.
update input="":
    nix flake update {{input}}

# Collect garbage. Default keeps the last 14 days of generations.
gc days="14":
    sudo nix-collect-garbage --delete-older-than {{days}}d
    nix-collect-garbage --delete-older-than {{days}}d

# Format all Nix files with nixfmt.
fmt:
    fd -e nix -x nixfmt

# Run nix flake check.
check:
    nix flake check

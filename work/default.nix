{
  pkgs,
  agenix,
  work-config,
  host,
  config,
  ...
}:
{
  imports = [
    agenix.nixosModules.default
    (work-config + "/modules")
    { environment.systemPackages = [ agenix.packages.${pkgs.stdenv.hostPlatform.system}.default ]; }
  ];

  # decryption key
  age.identityPaths = [ "/etc/age/keys.txt" ];

  age.secrets = {
    # git
    "gitconfig" = {
      symlink = true;
      path = "${host.user.homeDirectory}/.config/git/config";
      file = "${work-config}/nixos-wsl/git/config.age";
      owner = "${host.user.username}";
      group = "users";
      mode = "0400";
    };
    "git-personal-identity" = {
      symlink = true;
      path = "${host.user.homeDirectory}/.config/git/personal-identity";
      file = "${work-config}/nixos-wsl/git/personal-identity.age";
      owner = "${host.user.username}";
      group = "users";
      mode = "0400";
    };
    # fish
    "fish-config" = {
      symlink = true;
      path = "${host.user.homeDirectory}/.config/fish/conf.d/work.fish"; # sorts after plugin-*.fish, so it loads last
      file = "${work-config}/nixos-wsl/fish/conf.d/work.fish.age";
      owner = "${host.user.username}";
      group = "users";
      mode = "0400";
    };
    # copilot
    "copilot-instructions" = {
      symlink = true;
      path = "${host.user.homeDirectory}/.config/copilot/copilot-instructions.md";
      file = "${work-config}/nixos-wsl/copilot/copilot-instructions.md.age";
      owner = "${host.user.username}";
      group = "users";
      mode = "0400";
    };
    # claude-code
    "claude-settings" = {
      symlink = true;
      path = "${host.user.homeDirectory}/.config/claude/settings.json";
      file = "${work-config}/nixos-wsl/claude/settings.json.age";
      owner = "${host.user.username}";
      group = "users";
      mode = "0400";
    };
    "claude-instructions" = {
      symlink = true;
      path = "${host.user.homeDirectory}/.config/claude/CLAUDE.md";
      file = "${work-config}/nixos-wsl/claude/CLAUDE.md.age";
      owner = "${host.user.username}";
      group = "users";
      mode = "0400";
    };
    # nix-daemon proxy (decrypted to /run/agenix, root-owned; not symlinked to home)
    "nix-daemon-proxy" = {
      file = "${work-config}/nixos-wsl/nix-daemon/proxy.env.age";
      mode = "0400";
    };
  };

  # nix-daemon needs the corporate proxy for substitution/builds.
  # EnvironmentFile keeps the proxy host name out of /nix/store.
  systemd.services.nix-daemon.serviceConfig.EnvironmentFile =
    config.age.secrets."nix-daemon-proxy".path;
}

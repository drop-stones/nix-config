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
    # git: identity secret is declared by work-config's modules/git.nix, which
    # also wires it into programs.git via [include]. Base git config lives in
    # nix-config's programs.git.
    # fish
    "fish-config" = {
      symlink = true;
      path = "${host.user.homeDirectory}/.config/fish/conf.d/work.fish"; # sorts after plugin-*.fish, so it loads last
      file = "${work-config}/nixos-wsl/fish/conf.d/work.fish.age";
      owner = "${host.user.username}";
      group = "users";
      mode = "0400";
    };
    # copilot / claude-code: canonical .age files live under work-config's
    # chezmoi/ side (chezmoi can only see files under its .chezmoiroot), and
    # are shared with the Windows deployment from there.
    "copilot-instructions" = {
      symlink = true;
      path = "${host.user.homeDirectory}/.config/copilot/copilot-instructions.md";
      file = "${work-config}/chezmoi/dot_config/copilot/encrypted_copilot-instructions.md.age";
      owner = "${host.user.username}";
      group = "users";
      mode = "0400";
    };
    "claude-settings" = {
      symlink = true;
      path = "${host.user.homeDirectory}/.config/claude/settings.json";
      file = "${work-config}/chezmoi/dot_config/claude/encrypted_settings.json.age";
      owner = "${host.user.username}";
      group = "users";
      mode = "0400";
    };
    # imports the base rules from ~/.config/claude/base.md (deployed by the
    # claude-code module) via CLAUDE.md's @path syntax
    "claude-instructions" = {
      symlink = true;
      path = "${host.user.homeDirectory}/.config/claude/CLAUDE.md";
      file = "${work-config}/chezmoi/dot_config/claude/encrypted_CLAUDE.md.age";
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

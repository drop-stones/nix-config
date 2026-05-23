{
  pkgs,
  agenix,
  secrets-config,
  host,
  ...
}:
{
  imports = [
    agenix.nixosModules.default
    { environment.systemPackages = [ agenix.packages.${pkgs.stdenv.hostPlatform.system}.default ]; }
  ];

  # decryption key
  age.identityPaths = [ "${host.user.homeDirectory}/.config/age/keys.txt" ];

  age.secrets = {
    # git
    "gitconfig" = {
      symlink = true;
      path = "${host.user.homeDirectory}/.config/git/config";
      file = "${secrets-config}/nixos-wsl/git/config.age";
      owner = "${host.user.username}";
      group = "users";
      mode = "0400";
    };
    "git-personal-identity" = {
      symlink = true;
      path = "${host.user.homeDirectory}/.config/git/personal-identity";
      file = "${secrets-config}/nixos-wsl/git/personal-identity.age";
      owner = "${host.user.username}";
      group = "users";
      mode = "0400";
    };
    # fish
    "fish-config" = {
      symlink = true;
      path = "${host.user.homeDirectory}/.config/fish/conf.d/zzz-local.fish"; # load after plugin loading
      file = "${secrets-config}/nixos-wsl/fish/conf.d/local.fish.age";
      owner = "${host.user.username}";
      group = "users";
      mode = "0400";
    };
    # copilot
    "copilot-instructions" = {
      symlink = true;
      path = "${host.user.homeDirectory}/.config/copilot/copilot-instructions.md";
      file = "${secrets-config}/nixos-wsl/copilot/copilot-instructions.md.age";
      owner = "${host.user.username}";
      group = "users";
      mode = "0400";
    };
  };
}

{
  agenix,
  secrets-config,
  system,
  data,
  ...
}:
{
  imports = [
    agenix.nixosModules.default
    { environment.systemPackages = [ agenix.packages.${system}.default ]; }
  ];

  # decryption key
  age.identityPaths = [ "${data.user.homeDirectory}/.config/age/keys.txt" ];

  age.secrets = {
    "gitconfig" = {
      symlink = true;
      path = "${data.user.homeDirectory}/.config/git/config";
      file = "${secrets-config}/nixos-wsl/git/config.age";
      owner = "${data.user.username}";
      group = "users";
      mode = "0400";
    };
    "fish-config" = {
      symlink = true;
      path = "${data.user.homeDirectory}/.config/fish/conf.d/zzz-local.fish"; # load after plugin loading
      file = "${secrets-config}/nixos-wsl/fish/conf.d/local.fish.age";
      owner = "${data.user.username}";
      group = "users";
      mode = "0400";
    };
  };
}

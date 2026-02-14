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
  age.identityPaths = [ "${data.user.homeDirectory}/.local/share/age/key.txt" ];

  age.secrets."gitconfig" = {
    symlink = true;
    path = "${data.user.homeDirectory}/.config/git/config";
    file = "${secrets-config}/git/config.age";
    owner = "${data.user.username}";
    group = "users";
    mode = "0400";
  };
}

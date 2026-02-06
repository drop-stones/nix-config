{
  agenix,
  secrets-config,
  system,
  user,
  ...
}:
{
  imports = [
    agenix.nixosModules.default
    { environment.systemPackages = [ agenix.packages.${system}.default ]; }
  ];

  # decryption key
  age.identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

  age.secrets."gitconfig" = {
    symlink = true;
    path = "${user.homeDirectory}/.config/git/config";
    file = "${secrets-config}/git/config.age";
    owner = "${user.username}";
    group = "users";
    mode = "0400";
  };
}

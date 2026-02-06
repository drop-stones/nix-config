{
  agenix,
  system,
  ...
}:
{
  imports = [
    agenix.nixosModules.default
    { environment.systemPackages = [ agenix.packages.${system}.default ]; }
  ];

  # decryption key
  age.identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
}

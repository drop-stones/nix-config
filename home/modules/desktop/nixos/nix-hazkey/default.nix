{ nix-hazkey, ... }:
{
  # nix-hazkey: fcitx5-hazkey packaged for NixOS
  imports = [ nix-hazkey.homeModules.hazkey ];
  services.hazkey.enable = true;
}

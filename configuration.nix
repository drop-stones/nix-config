{
  config,
  lib,
  pkgs,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  environment.systemPackages = with pkgs; [
    git
    lazygit
    neovim
  ];

  wsl.defaultUser = "drop-stones";
}

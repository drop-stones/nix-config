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

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  wsl.defaultUser = "drop-stones";
}

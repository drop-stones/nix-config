{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # git
    git
    lazygit

    # editor
    neovim
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.stateVersion = "25.05";
}

{ pkgs, user, ... }:
{
  # git: distributed version control system
  programs.git.enable = user.git.enable;

  home.packages = [ pkgs.git ];
}

{ pkgs, ... }:
{
  # yazi: blazing fast terminal file manager
  programs.yazi = {
    enable = true;
    enableFishIntegration = true; # defines the `y` wrapper that cd's on exit
  };

  # Tools yazi shells out to for non-image previews (alacritty can't render
  # images, so the image/video/pdf stack is intentionally omitted):
  #   file  = MIME detection
  #   p7zip = list archive contents
  # fd / rg / fzf / zoxide are already installed and used for navigation/search.
  home.packages = with pkgs; [
    file
    p7zip
  ];
}

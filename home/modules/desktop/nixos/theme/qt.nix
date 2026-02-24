# Qt theme settings configured to follow GTK Adwaita style
{ pkgs, ... }:
{
  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}

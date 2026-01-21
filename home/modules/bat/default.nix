{ ... }:
{
  programs.bat = {
    # install bat
    enable = true;

    # Tokyo Night Theme
    config.theme = "tokyonight_night";
  };

  # setup themes/
  xdg.configFile."bat/themes".source = ./themes;
}

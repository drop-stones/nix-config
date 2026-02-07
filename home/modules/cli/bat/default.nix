_: {
  # bat: A cat(1) clone with wings
  programs.bat = {
    enable = true;

    # Tokyo Night Theme
    config.theme = "tokyonight_night";
  };

  # setup themes/
  xdg.configFile."bat/themes".source = ./themes;
}

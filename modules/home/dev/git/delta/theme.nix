_: {
  programs.delta.options = {
    dark = true; # pin dark mode instead of relying on terminal detection
    syntax-theme = "tokyonight_night"; # reuse the bat theme under ~/.config/bat/themes

    # Keep delta's default add/delete backgrounds (they read fine); only the
    # within-line emphasis was hard to see, so make it brighter + bold so the
    # actually-changed characters stand out from the rest of the line.
    minus-emph-style = ''syntax bold "#5c1217"'';
    plus-emph-style = ''syntax bold "#0c4612"'';

    # Re-style git's moved-line colors (see diff.colorMoved below): keep the
    # syntax-highlighted foreground but use subtle tokyonight backgrounds so
    # moved blocks stand apart from real add/delete without being garish.
    map-styles = ''bold purple => syntax "#3d2c52", bold cyan => syntax "#203a4d"'';
  };

  # Detect lines that moved within a diff; delta restyles them via map-styles above.
  programs.git.settings.diff.colorMoved = "default";
}

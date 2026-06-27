_: {
  # Use delta as the diff pager so lazygit matches git's diff output.
  # delta inherits the [delta] options (theme, side-by-side, ...) from gitconfig.
  programs.lazygit.settings.git.pagers = [
    {
      colorArg = "always";
      pager = "delta --paging=never";
    }
  ];
}

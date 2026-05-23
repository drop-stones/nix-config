_: {
  # register commands for all fish processes (including Tide's background subshells)
  programs.fish.shellInit = ''
    # wslwrap.fish
    wslwrap register git
  '';
}

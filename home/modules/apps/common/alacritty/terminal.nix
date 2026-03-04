_: {
  programs.alacritty.settings = {
    terminal.shell = {
      program = "/run/current-system/sw/bin/fish";
      args = [
        "-c"
        "zellij_scratch"
      ];
    };
  };
}

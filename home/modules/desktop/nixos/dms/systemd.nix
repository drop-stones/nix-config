_: {
  programs.dank-material-shell = {
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
  };
}

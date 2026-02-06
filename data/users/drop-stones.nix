{
  # Unix account
  username = "drop-stones";
  homeDirectory = "/home/drop-stones";

  git = {
    # Enable git
    enable = true;

    # Git identity
    name = "drop-stones";
    email = "s2h6i8z1u7k8u7@gmail.com";

    # Git commit signing (SSH via 1password)
    gpgsign = {
      enable = true;
      signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOlftWsuO8svvievtqfCj6civRTSU+DCqThc23AGbWtp";
      format = "ssh";
      program = "op-ssh-sign-wsl.exe";
    };
  };
}

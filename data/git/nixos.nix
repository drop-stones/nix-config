{
  # Enable git
  enable = true;

  settings = {
    # Git identity
    user = {
      name = "drop-stones";
      email = "s2h6i8z1u7k8u7@gmail.com";
      signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOlftWsuO8svvievtqfCj6civRTSU+DCqThc23AGbWtp";
    };

    # Git commit signing (SSH via 1password)
    commit.gpgsign = true;
    gpg.format = "ssh";
    "gpg \"ssh\"".program = "op-ssh-sign";
  };
}

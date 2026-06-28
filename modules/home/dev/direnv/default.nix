_: {
  # direnv: per-directory environment variables, with Nix flake integration
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    silent = true;
  };
}

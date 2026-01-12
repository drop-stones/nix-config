{ ... }:
{
  imports = [
    # home-manager settings
    ./home.nix

    # packages
    ./git.nix
    ./neovim.nix
  ];
}

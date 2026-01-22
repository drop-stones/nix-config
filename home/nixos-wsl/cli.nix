{ localLib, ... }:
{
  imports = localLib.listHomeModules [
    "bat"
    "eza"
    "fd"
    "fish"
    "fzf"
    "git"
    "neovim"
    "ripgrep"
    "zoxide"
  ];
}

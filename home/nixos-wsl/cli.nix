{ localLib, ... }:
{
  imports = localLib.listHomeModules [
    "bat"
    "eza"
    "fd"
    "fish"
    "fzf"
    "git"
    "mise"
    "neovim"
    "ripgrep"
    "zoxide"
  ];
}

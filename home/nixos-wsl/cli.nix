{ localLib, ... }:
{
  imports = localLib.listHomeModules [
    "bat"
    "fd"
    "fish"
    "fzf"
    "git"
    "neovim"
    "ripgrep"
  ];
}

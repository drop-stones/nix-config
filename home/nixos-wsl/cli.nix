{ localLib, ... }:
{
  imports = localLib.listHomeModules [
    "fd"
    "fish"
    "fzf"
    "git"
    "neovim"
    "ripgrep"
  ];
}

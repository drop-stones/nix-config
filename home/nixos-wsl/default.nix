{ localLib, ... }:
{
  imports = (map localLib.fromRoot [
    "home/common"
    "home/modules/fish"
    "home/modules/fzf"
    "home/modules/git"
    "home/modules/neovim"
    "home/modules/ripgrep"
  ]);
}

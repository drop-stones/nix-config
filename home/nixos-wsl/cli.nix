{ localLib, ... }:
{
  imports = localLib.listHomeModules [
    "bat"
    "eza"
    "fd"
    "fish"
    "fzf"
    "git"
    "hyperfine"
    "mise"
    "neovim"
    "ripgrep"
    "tree-sitter"
    "zellij"
    "zoxide"
  ];
}

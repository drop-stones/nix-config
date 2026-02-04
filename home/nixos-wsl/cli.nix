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
    "lazygit"
    "mise"
    "neovim"
    "ripgrep"
    "tree-sitter"
    "unzip"
    "zellij"
    "zoxide"
  ];
}

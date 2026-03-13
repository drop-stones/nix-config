{ pkgs, ... }:
{
  programs.alacritty.settings = {
    terminal.shell = {
      # program = "${pkgs.tmux}/bin/tmux";
      # program = "${pkgs.zellij}/bin/zellij";
      program = "${pkgs.fish}/bin/fish";
    };
  };
}

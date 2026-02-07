{ pkgs, ... }:
{
  # 0xProto: A high-legibility programming font
  home.packages = with pkgs; [
    nerd-fonts._0xproto
  ];
}

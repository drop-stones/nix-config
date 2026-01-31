{ pkgs, ... }:
{
  # install python
  home.packages = with pkgs; [
    python3
  ];
}

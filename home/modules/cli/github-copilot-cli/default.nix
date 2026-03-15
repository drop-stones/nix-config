{ pkgs-unstable, ... }:
{
  # GitHub Copilot CLI: the power of Copilot coding agent directly to your terminal
  home.packages = [ pkgs-unstable.github-copilot-cli ];
}

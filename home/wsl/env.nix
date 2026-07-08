{ lib, ... }:
{
  home.sessionVariables = {
    # Forwarded to Windows processes for smart-splits-wsl.nvim
    # (nvim.exe <-> WSL zellij pane navigation).
    WSLENV = lib.concatStringsSep ":" [
      "WSL_DISTRO_NAME/w"
      "ZELLIJ/w"
      "ZELLIJ_SESSION_NAME/w"
    ];
  };
}

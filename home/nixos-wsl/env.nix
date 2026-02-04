{ lib, ... }:
{
  home.sessionVariables = {
    WSLENV = (
      lib.concatStringsSep ":" [
        "LS_COLORS/w"
        "WSL_DISTRO_NAME/w"
        "ZELLIJ/w"
        "ZELLIJ_SESSION_NAME/w"
        "ZELLIJ_PANE_ID/w"
      ]
    );
  };
}

{ lib, user, ... }:
{
  # Git identity
  programs.git.settings.user = lib.mkIf user.git.enable {
    inherit (user.git) name;
    inherit (user.git) email;
  };
}

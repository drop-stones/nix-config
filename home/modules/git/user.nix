{ user, ... }:
{
  # Git identity
  programs.git.settings.user = {
    inherit (user.git) name;
    inherit (user.git) email;
  };
}

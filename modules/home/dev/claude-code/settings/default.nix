{ host, lib, ... }:
{
  # Deploy default settings only when not using the work profile
  xdg.configFile."claude/settings.json" = lib.mkIf (host.user.profile != "work") {
    source = ./settings.json;
  };
}

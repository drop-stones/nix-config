{ host, lib, ... }:
{
  # Deploy default CLAUDE.md only when not using the work profile
  xdg.configFile."claude/CLAUDE.md" = lib.mkIf (host.user.profile != "work") {
    source = ./CLAUDE.md;
  };
}

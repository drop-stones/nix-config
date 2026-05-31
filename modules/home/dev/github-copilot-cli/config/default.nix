{ host, lib, ... }:
{
  # Deploy default instructions only when not using the work profile
  xdg.configFile."copilot/copilot-instructions.md" = lib.mkIf (host.user.profile != "work") {
    source = ./copilot-instructions.md;
  };
}

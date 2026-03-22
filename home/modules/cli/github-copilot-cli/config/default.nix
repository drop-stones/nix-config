{ data, lib, ... }:
{
  # Deploy default instructions only when not using secrets
  xdg.configFile."copilot/copilot-instructions.md" = lib.mkIf (!(data.user.useSecrets or false)) {
    source = ./copilot-instructions.md;
  };
}

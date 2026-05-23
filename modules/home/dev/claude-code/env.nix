{ host, ... }:
{
  home.sessionVariables = {
    CLAUDE_CONFIG_DIR = "${host.user.homeDirectory}/.config/claude";
  };
}

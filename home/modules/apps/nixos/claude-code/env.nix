{ data, ... }:
{
  home.sessionVariables = {
    CLAUDE_CONFIG_DIR = "${data.user.homeDirectory}/.config/claude";
  };
}

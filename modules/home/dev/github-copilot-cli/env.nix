{ host, ... }:
{
  home.sessionVariables = {
    COPILOT_CUSTOM_INSTRUCTIONS_DIRS = "${host.user.homeDirectory}/.config/copilot";
  };
}

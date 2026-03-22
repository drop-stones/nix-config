{ data, ... }:
{
  home.sessionVariables = {
    COPILOT_CUSTOM_INSTRUCTIONS_DIRS = "${data.user.homeDirectory}/.config/copilot";
  };
}

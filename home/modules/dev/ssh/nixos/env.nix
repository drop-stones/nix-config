{ data, ... }:
{
  home.sessionVariables = {
    SSH_AUTH_SOCK = "${data.user.homeDirectory}/.1password/agent.sock";
  };
}

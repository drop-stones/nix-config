{ host, ... }:
{
  home.sessionVariables = {
    SSH_AUTH_SOCK = "${host.user.homeDirectory}/.1password/agent.sock";
  };
}

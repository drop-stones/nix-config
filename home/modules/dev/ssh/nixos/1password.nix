{ config, ... }:
{
  programs.ssh.matchBlocks = {
    "*" = {
      identityAgent = "~/.1password/agent.sock";
    };
  };
}

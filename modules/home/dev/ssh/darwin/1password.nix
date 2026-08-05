_: {
  programs.ssh.settings = {
    "*" = {
      # Quoted explicitly: the path contains spaces and values are rendered verbatim.
      IdentityAgent = "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"";
    };
  };
}

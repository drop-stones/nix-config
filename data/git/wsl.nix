# Platform-specific overrides merged onto ./common.nix.
{
  settings = {
    "gpg \"ssh\"".program = "op-ssh-sign-wsl.exe";
    core.sshCommand = "ssh.exe";
  };
}

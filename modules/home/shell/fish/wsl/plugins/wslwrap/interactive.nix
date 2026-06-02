{ lib, host, ... }:
{
  # `wslwrap link` may invoke `sudo ln -s` on the first run, so it must
  # stay in interactive shells where a password prompt can be answered.
  programs.fish.interactiveShellInit = ''
    # wslwrap.fish
    ## symlink
    wslwrap link ssh.exe
    wslwrap link ssh-add.exe
    wslwrap link cmd.exe
    wslwrap link powershell.exe
    wslwrap link pwsh.exe
    ${lib.optionalString host.git.enable "wslwrap link op-ssh-sign-wsl.exe"}
  '';
}

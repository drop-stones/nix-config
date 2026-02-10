{
  pkgs,
  lib,
  localLib,
  data,
  ...
}:
{
  programs.fish = {
    # install wslwrap.fish
    plugins = [ (localLib.mkPlugin pkgs.fishPlugins.wslwrap) ];

    # settings
    interactiveShellInit = ''
      # wslwrap.fish

      ## auto
      wslwrap register bat
      wslwrap register eza
      wslwrap register fd --path-separator=/
      wslwrap register git
      wslwrap register lazygit
      wslwrap register nvim
      wslwrap register rg

      ## windows
      wslwrap register cmd --mode windows
      wslwrap register explorer --mode windows
      wslwrap register powershell --mode windows
      wslwrap register pwsh --mode windows
      wslwrap register wsl --mode windows

      ## symlink
      wslwrap link ssh.exe
      wslwrap link ssh-add.exe
      wslwrap link cmd.exe
      wslwrap link powershell.exe
      wslwrap link pwsh.exe
      wslwrap link win32yank.exe
      ${lib.optionalString data.git.enable "wslwrap link op-ssh-sign-wsl.exe"}
    '';
  };
}

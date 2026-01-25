{ ... }:
{
  programs.fish.shellAliases = {
    # msys2
    msys2 = "cmd.exe /c msys2.cmd -use-full-path -shell fish";
  };
}

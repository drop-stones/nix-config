_: {
  programs.fish.shellAliases = {
    # msys2
    msys2 = "cmd.exe /c msys2.cmd -use-full-path -shell fish";
    # Use wslwrap-aware which to resolve Linux/Windows executables
    which = "wslwrap which";
  };
}

_: {
  # register commands for all fish processes (including non-interactive
  # contexts such as `just` recipes and Tide's background subshells).
  programs.fish.shellInit = ''
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
    wslwrap register op --mode windows
    wslwrap register powershell --mode windows
    wslwrap register pwsh --mode windows
    wslwrap register wsl --mode windows
  '';
}

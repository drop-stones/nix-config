_: {
  # delta: syntax-highlighting pager for git diff/log/show output. Enabling this
  # installs delta and wires it up as git's pager. delta reads the [delta] options
  # (split across theme.nix / layout.nix / header.nix) from gitconfig, so
  # lazygit's delta inherits them too.
  programs.delta = {
    enable = true;
    enableGitIntegration = true; # set delta as git's pager (explicit; auto-enable is deprecated)
    options.navigate = true; # inside the pager, use n/N to jump between files/sections
  };
}

{ config, lib, ... }:
let
  delta = "${config.programs.delta.package}/bin/delta";
in
{
  # Keep the shared [delta] (which lazygit's unified view also reads) free of
  # line-number gutters, so lazygit stays a clean, simple unified diff.
  programs.delta.options.line-numbers = false;

  # The git CLI pager opts into a side-by-side view with real line numbers, while
  # lazygit (delta --paging=never) reads the clean [delta] above and stays unified.
  # HM sets iniContent.core.pager to the delta path, so override it there.
  programs.git.iniContent.core.pager = lib.mkForce "${delta} --side-by-side --line-numbers";
}

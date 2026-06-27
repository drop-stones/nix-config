_: {
  # General, platform-agnostic git quality-of-life defaults. Identity and signing
  # live in data/git (user/platform data); delta-specific settings live under delta/.
  programs.git.settings = {
    init.defaultBranch = "main";

    # Push / pull / fetch
    push.autoSetupRemote = true; # set upstream automatically on first push
    pull.rebase = true; # rebase instead of creating a merge commit on pull
    fetch.prune = true; # drop deleted remote-tracking branches on fetch

    # Rebase ergonomics
    rebase = {
      autostash = true; # stash/unstash around rebase and rebasing pulls
      autosquash = true; # honour fixup!/squash! commits automatically
      updateRefs = true; # move stacked branch refs along with a rebase
    };

    # Diff / merge
    diff.algorithm = "histogram"; # cleaner, more readable hunks
    merge.conflictStyle = "zdiff3"; # show the common ancestor in conflict markers
    rerere.enabled = true; # remember and reapply previous conflict resolutions

    # Listing / output
    branch.sort = "-committerdate"; # most recently used branches first
    tag.sort = "version:refname"; # tags in version order
    column.ui = "auto"; # multi-column output where it fits

    # Misc
    commit.verbose = true; # include the diff in the commit message editor
    help.autocorrect = "prompt"; # suggest the intended command on a typo
  };
}

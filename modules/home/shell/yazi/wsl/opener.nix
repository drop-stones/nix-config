_: {
  # WSL-only openers. yazi runs an opener with its cwd set to the browsed
  # directory, and every opener goes through `fish -c` so the wslwrap.fish
  # registrations (programs.fish.shellInit) are available:
  #
  #   nvim      -> registered `auto`           => Linux nvim on the WSL fs,
  #                                                nvim.exe under /mnt/*
  #   explorer  -> registered `--mode windows` => always explorer.exe
  #
  # edit passes only the basename: wslwrap picks the binary by cwd, and the
  # file lives in that same cwd, so the bare name resolves for both the Linux
  # nvim and nvim.exe (whose Windows cwd is the translated /mnt path). This
  # avoids any /mnt branch or wslpath call for editing.
  #
  # explorer always wants a Windows path, so open/reveal convert with
  # `wslpath -w` (a WSL-fs path becomes a \\wsl.localhost UNC, which Windows
  # opens fine).
  #
  # No [open] rules are overridden: yazi's defaults send text to `edit` and
  # everything else (including *.exe, which explorer launches) to `open`. Use
  # `O` to pick an opener interactively when the default isn't wanted.
  programs.yazi.settings = {
    opener = {
      edit = [
        {
          run = ''fish -c 'nvim (basename $argv[1])' "$1"'';
          desc = "Edit";
          block = true;
        }
      ];
      open = [
        {
          run = ''fish -c 'explorer (wslpath -w $argv[1])' "$1"'';
          desc = "Open in default program";
          orphan = true;
        }
      ];
      reveal = [
        {
          run = ''fish -c 'explorer /select,(wslpath -w $argv[1])' "$1"'';
          desc = "Reveal";
          orphan = true;
        }
      ];
    };
  };
}

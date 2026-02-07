{ pkgs, lib, ... }:
{
  home.activation = {
    # Ensure the login shell points to the nix-darwin managed fish.
    chshFish = lib.hm.dag.entryAfter [ "installPackages" ] ''
      # checks the current login shell and only performs the change when necessary
      FISH_SHELL="/run/current-system/sw/bin/fish"
      CURRENT_SHELL="$(/usr/bin/dscl . -read /Users/$USER UserShell | /usr/bin/awk '{print $2}')"
      if [ "$CURRENT_SHELL" != "$FISH_SHELL" ]; then
        # On macOS, a user’s login shell must be listed in /etc/shells.
        echo "$FISH_SHELL" | /usr/bin/sudo /usr/bin/tee -a /etc/shells
        # register fish as the user's default shell
        /usr/bin/chsh -s "$FISH_SHELL"
      fi
    '';
  };
}

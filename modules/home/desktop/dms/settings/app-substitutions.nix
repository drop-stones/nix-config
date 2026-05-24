# App ID substitutions for proper icon/name matching
_: {
  programs.dank-material-shell.settings = {
    # App ID substitutions (pattern -> replacement)
    appIdSubstitutions = [
      {
        pattern = "com.spotify.Client";
        replacement = "spotify";
        matchType = "exact";
      }
      {
        pattern = "^steam_app_";
        replacement = "steam";
        matchType = "regex";
      }
    ];
  };
}

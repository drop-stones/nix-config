{ lib, user, ... }:
let
  gpgsign = lib.attrByPath [ "git" "gpgsign" ] null user;
  enable = lib.attrByPath [ "enable" ] false gpgsign;
in
{
  # Git commit signing (SSH via 1password)
  programs.git.settings = lib.mkMerge [
    (lib.mkIf enable {
      user.signingKey = gpgsign.signingKey;
      gpg.format = gpgsign.format;
      "gpg \"ssh\"".program = gpgsign.program;
      commit.gpgsign = gpgsign.enable;
    })
  ];
}

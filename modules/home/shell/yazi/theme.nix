{ pkgs, ... }:
let
  src = pkgs.fetchFromGitHub {
    owner = "BennyOe";
    repo = "tokyo-night.yazi";
    rev = "8e6296f14daff24151c736ebd0b9b6cd89b02b03";
    hash = "sha256-LArhRteD7OQRBguV1n13gb5jkl90sOxShkDzgEf3PA0=";
  };

  # The flavor's filetype fallback rules use the `url` key, which yazi 25.x no
  # longer recognises (it expects `name`), so directories/plain files end up
  # uncoloured (everything looks white). Patch those rules to use `name`.
  tokyo-night = pkgs.runCommand "tokyo-night.yazi" { } ''
    cp -r ${src} $out
    chmod -R u+w $out
    substituteInPlace $out/flavor.toml --replace-warn 'url = ' 'name = '
  '';
in
{
  programs.yazi = {
    flavors."tokyo-night" = tokyo-night;
    # yazi can't always detect the terminal background (it fails the OSC query on
    # some terminals and falls back to light), so pin both to the dark flavor.
    theme.flavor = {
      dark = "tokyo-night";
      light = "tokyo-night";
    };
  };
}

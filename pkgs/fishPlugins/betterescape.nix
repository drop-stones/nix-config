{
  prev,
  lib,
  betterescape-fish,
  ...
}:
prev.fishPlugins.buildFishPlugin {
  pname = "betterescape.fish";
  version = "unstable";

  src = betterescape-fish;

  meta = {
    description = "Better escape key mapping for fish";
    homepage = "https://github.com/drop-stones/betterescape.fish";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
  };
}

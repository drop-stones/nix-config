{
  prev,
  lib,
  wslwrap-fish,
  ...
}:
prev.fishPlugins.buildFishPlugin {
  pname = "wslwrap.fish";
  version = "unstable";

  src = wslwrap-fish;

  meta = {
    description = "Auto-switch Linux/Windows executables in WSL2";
    homepage = "https://github.com/drop-stones/wslwrap.fish";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
  };
}

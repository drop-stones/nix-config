{
  prev,
  lib,
  initcache-fish,
  ...
}:
prev.fishPlugins.buildFishPlugin {
  pname = "initcache.fish";
  version = "unstable";

  src = initcache-fish;

  meta = {
    description = "Cache Fish init for faster startup";
    homepage = "https://github.com/drop-stones/initcache.fish";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
  };
}

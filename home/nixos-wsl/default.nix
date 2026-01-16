{ localLib, ... }:
{
  imports = (map localLib.fromRoot [
    "home/base"
  ]);
}

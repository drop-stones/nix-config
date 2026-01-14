{ localLib, ... }:

{
  imports = (map localLib.fromRoot [
    "home/profiles/personal"
    "home/platforms/base"
  ]);
}

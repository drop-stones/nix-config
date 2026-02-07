{ localLib, ... }:
{
  imports = localLib.listHomeModules [
    "cli"
    "desktop"
    "dev"
    "lang"
  ];
}

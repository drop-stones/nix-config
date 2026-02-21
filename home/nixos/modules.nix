{ localLib, ... }:
{
  imports = localLib.listHomeModules [
    "apps"
    "cli"
    "desktop"
    "dev"
    "lang"
  ];
}

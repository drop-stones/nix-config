{ localLib, ... }:
{
  imports = localLib.listHomeModules [
    "apps"
    "shell"
    "desktop"
    "dev"
    "lang"
  ];
}

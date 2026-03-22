{ localLib, ... }:
{
  imports = localLib.listHomeModules [
    "shell"
    "desktop"
    "dev"
    "lang"
  ];
}

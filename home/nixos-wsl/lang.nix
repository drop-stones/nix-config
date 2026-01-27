{ localLib, ... }:
{
  imports = localLib.listHomeModules [
    "clang"
  ];
}

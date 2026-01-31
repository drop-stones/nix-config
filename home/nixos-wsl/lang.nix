{ localLib, ... }:
{
  imports = localLib.listHomeModules [
    "clang"
    "nodejs"
  ];
}

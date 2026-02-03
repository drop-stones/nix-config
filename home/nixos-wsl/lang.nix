{ localLib, ... }:
{
  imports = localLib.listHomeModules [
    "clang"
    "nix"
    "nodejs"
    "python"
  ];
}

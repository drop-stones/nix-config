{ localLib, ... }:
{
  imports =
    (localLib.listImports ./.)
    ++ (map localLib.fromRoot [
      "system/common"
    ]);
}

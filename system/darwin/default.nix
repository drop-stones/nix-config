{ localLib, ... }:
{
  imports =
    (localLib.listImports { dir = ./.; })
    ++ (map localLib.fromRoot [
      "system/common"
    ]);
}

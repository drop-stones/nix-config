{ localLib, ... }:
{
  imports = (localLib.listImports { dir = ./.; }) ++ [ (localLib.fromRoot "home/common") ];
}

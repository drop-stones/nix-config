{ lib }: platform: {
  git = import ./git { inherit lib; } platform;
  user = import ./users platform;
}

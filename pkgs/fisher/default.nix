{
  lib,
  stdenvNoCC,
  localLib,
  fisher,
  ...
}:
stdenvNoCC.mkDerivation {
  pname = "fisher";
  version = localLib.getInputVersionFromLock { name = "fisher"; };

  src = fisher;

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    runHook preInstall

    install -D --mode=644 functions/fisher.fish $out/share/fish/vendor_functions.d/fisher.fish
    install -D --mode=644 completions/fisher.fish $out/share/fish/vendor_completions.d/fisher.fish

    runHook postInstall
  '';

  meta = with lib; {
    description = "A plugin manager for Fish";
    homepage = "https://github.com/jorgebucaran/fisher";
    license = licenses.mit;
    platforms = platforms.all;
  };
}

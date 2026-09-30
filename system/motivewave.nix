{ stdenv, lib, src, dpkg, autoPatchelfHook, makeWrapper
, alsa-lib, freetype, fontconfig, gtk3, glib, libGL, zlib, libxkbcommon
, xorg }:

stdenv.mkDerivation {
  pname = "motivewave";
  version = "latest";
  inherit src;

  nativeBuildInputs = [ dpkg autoPatchelfHook makeWrapper ];

  buildInputs = [
    alsa-lib freetype fontconfig gtk3 glib libGL zlib libxkbcommon
    stdenv.cc.cc.lib
    xorg.libX11 xorg.libXext xorg.libXrender xorg.libXtst
    xorg.libXi xorg.libXxf86vm
  ];

  unpackPhase = "dpkg-deb -x $src .";

  installPhase = ''
  runHook preInstall
  mkdir -p $out/bin
  cp -r opt usr $out/ 2>/dev/null || true
    # adjust this path after checking the deb contents (step 4)
    makeWrapper $out/opt/MotiveWave/MotiveWave $out/bin/motivewave
    runHook postInstall
    '';

    meta = {
      description = "MotiveWave trading and charting platform";
      homepage = "https://www.motivewave.com";
      license = lib.licenses.unfree;
      platforms = [ "x86_64-linux" ];
    };
  }

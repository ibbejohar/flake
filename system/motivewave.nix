{ stdenv, lib, src, dpkg, autoPatchelfHook, makeWrapper
, copyDesktopItems, makeDesktopItem
, alsa-lib, freetype, fontconfig, gtk3, glib, libGL, zlib, libxkbcommon
, pango, cairo, gdk-pixbuf, atk, libxml2, libxslt
, coreutils, gnugrep, gnused, gawk, xdg-utils
, libx11, libxext, libxrender, libxtst, libxi, libxxf86vm
, libxt, libxcursor, libxrandr, libxfixes, libxcomposite, libxdamage }:

let
  runtimeLibs = [
    alsa-lib freetype fontconfig gtk3 glib libGL zlib libxkbcommon
    pango cairo gdk-pixbuf atk libxml2 libxslt
    stdenv.cc.cc.lib
    libx11 libxext libxrender libxtst libxi libxxf86vm
    libxt libxcursor libxrandr libxfixes libxcomposite libxdamage
  ];
in
stdenv.mkDerivation {
  pname = "motivewave";
  version = "latest";
  inherit src;
  sourceRoot = ".";

  nativeBuildInputs = [ dpkg autoPatchelfHook makeWrapper copyDesktopItems ];
  buildInputs = runtimeLibs;

  unpackPhase = "dpkg-deb -x $src .";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share $out/bin
    cp -r usr/share/motivewave $out/share/motivewave
    chmod -R u+w $out/share/motivewave

    # optional JavaFX ffmpeg plugins that need old libav versions
    rm -f $out/share/motivewave/javafx/libavplugin*.so

    install -Dm444 usr/share/motivewave/icons/mwave_256x256.png \
      $out/share/icons/hicolor/256x256/apps/motivewave.png

    makeWrapper $out/share/motivewave/run.sh $out/bin/motivewave \
      --prefix PATH : ${lib.makeBinPath [ coreutils gnugrep gnused gawk xdg-utils ]} \
      --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath runtimeLibs}

    runHook postInstall
  '';

  desktopItems = [
    (makeDesktopItem {
      name = "motivewave";
      desktopName = "MotiveWave";
      exec = "motivewave";
      icon = "motivewave";
      categories = [ "Office" "Finance" ];
    })
  ];

  meta = {
    description = "MotiveWave trading and charting platform";
    homepage = "https://www.motivewave.com";
    license = lib.licenses.unfree;
    platforms = [ "x86_64-linux" ];
    mainProgram = "motivewave";
  };
}

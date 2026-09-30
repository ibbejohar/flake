{ stdenv, lib, src, dpkg, autoPatchelfHook, makeWrapper
, copyDesktopItems, makeDesktopItem, buildFHSEnv
# GUI / runtime libraries
, alsa-lib, freetype, fontconfig, gtk3, glib, libGL, zlib, libxkbcommon
, pango, cairo, gdk-pixbuf, atk, libxml2, libxslt
, libx11, libxext, libxrender, libxtst, libxi, libxxf86vm
, libxt, libxcursor, libxrandr, libxfixes, libxcomposite, libxdamage
# tools that run.sh calls
, coreutils, gnugrep, gnused, gawk, findutils, bc, xrandr, xdg-utils
}:

let
  runtimeLibs = [
    alsa-lib freetype fontconfig gtk3 glib libGL zlib libxkbcommon
    pango cairo gdk-pixbuf atk libxml2 libxslt
    stdenv.cc.cc.lib
    libx11 libxext libxrender libxtst libxi libxxf86vm
    libxt libxcursor libxrandr libxfixes libxcomposite libxdamage
  ];

  runtimeTools = [
    coreutils gnugrep gnused gawk findutils bc xrandr xdg-utils
    glib # provides gsettings
  ];

  # Your existing, working package (unchanged).
  unwrapped = stdenv.mkDerivation {
    pname = "motivewave";
    version = "latest"; # real version is only known inside the deb
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

      # optional JavaFX ffmpeg plugins that link against old libav versions
      rm -f $out/share/motivewave/javafx/libavplugin*.so

      # run.sh hardcodes the Debian install path
      substituteInPlace $out/share/motivewave/run.sh \
        --replace-fail "/usr/share/motivewave" "$out/share/motivewave"

      install -Dm444 usr/share/motivewave/icons/mwave_256x256.png \
        $out/share/icons/hicolor/256x256/apps/motivewave.png

      makeWrapper $out/share/motivewave/run.sh $out/bin/motivewave \
        --prefix PATH : ${lib.makeBinPath runtimeTools} \
        --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath runtimeLibs} \
        --set-default GDK_CORE_DEVICE_EVENTS 1

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
  };
in
# FHS environment around the package above: gives MotiveWave a normal
# /usr, /lib, /lib64 and /etc layout (like the Ubuntu distrobox).
buildFHSEnv {
  name = "motivewave";

  targetPkgs = pkgs: [ unwrapped ] ++ (with pkgs; [
    # general libraries a stock Ubuntu would provide (for dlopen'd libs etc.)
    openssl curl cacert icu zlib stdenv.cc.cc.lib
    alsa-lib freetype fontconfig libGL libxkbcommon
    gtk3 pango cairo gdk-pixbuf atk libxml2 libxslt
    libx11 libxext libxrender libxtst libxi libxxf86vm
    libxt libxcursor libxrandr libxfixes libxcomposite libxdamage

    # tools run.sh calls
    coreutils bash gnugrep gnused gawk findutils bc xrandr xdg-utils glib
  ]);

  runScript = "${unwrapped}/bin/motivewave";

  # Desktop entry and icon from the inner package
  extraInstallCommands = ''
    mkdir -p $out/share/applications $out/share/icons/hicolor/256x256/apps
    ln -s ${unwrapped}/share/applications/* $out/share/applications/
    ln -s ${unwrapped}/share/icons/hicolor/256x256/apps/motivewave.png \
      $out/share/icons/hicolor/256x256/apps/motivewave.png
  '';

  meta = unwrapped.meta;
}

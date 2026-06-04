{ stdenv
, lib
, dpkg
, autoPatchelfHook
, makeWrapper
, alsa-lib
, atk
, cairo
, cups
, dbus
, expat
, ffmpeg
, fontconfig
, freetype
, gdk-pixbuf
, glib
, gtk3
, libdrm
, libGL
, libglvnd
, libX11
, libxcb
, libXcomposite
, libXcursor
, libXdamage
, libXext
, libXfixes
, libXi
, libXrandr
, libXrender
, libXtst
, libXxf86vm
, nss
, nspr
, pango
, systemd
, zlib
}:

stdenv.mkDerivation rec {
  pname = "motivewave";
  version = "7.0.25";

  src = /home/fool/motivewave_x64.deb;

  nativeBuildInputs = [
    dpkg
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    alsa-lib
    atk
    cairo
    cups
    dbus
    expat
    ffmpeg
    fontconfig
    freetype
    gdk-pixbuf
    glib
    gtk3
    libdrm
    libGL
    libglvnd
    libX11
    libxcb
    libXcomposite
    libXcursor
    libXdamage
    libXext
    libXfixes
    libXi
    libXrandr
    libXrender
    libXtst
    libXxf86vm
    nss
    nspr
    pango
    systemd
    zlib
  ];

  unpackPhase = "dpkg-deb -x $src .";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/share/applications
    cp -r usr/share/motivewave $out/share/

    # Clean legacy duplicate audio plugins
    rm -f $out/share/motivewave/javafx/libavplugin*.so

    # Create the correct Java runtime execution target wrapper
    makeWrapper $out/share/motivewave/jre/bin/motivewave $out/bin/motivewave \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath buildInputs}:/run/opengl-driver/lib" \
      --set __GLX_VENDOR_LIBRARY_NAME nvidia \
      --set MESA_LOADER_DRIVER_OVERRIDE nvidia \
      --set MESA_GL_VERSION_OVERRIDE 4.5 \
      --set UserHome "/home/fool" \
      --add-flags "-Xmx2G" \
      --add-flags "-Dprism.forceGPU=true" \
      --add-flags "-Dsun.java2d.opengl=true" \
      --add-flags "-Dprism.order=es2,es1,sw,j2d" \
      --add-flags "-javaagent:$out/share/motivewave/jar/MotiveWave.jar" \
      --add-flags "-Dname=MotiveWave" \
      --add-flags "-Djava.library.path=$out/share/motivewave/lib" \
      --add-flags "-DappDir=$out/share/motivewave" \
      --add-flags "-p $out/share/motivewave/javafx" \
      --add-flags "--add-modules=javafx.controls,javafx.base,javafx.graphics,javafx.media,javafx.web,javafx.swing" \
      --add-flags "-classpath $out/share/motivewave/jar/MotiveWave.jar:$out/share/motivewave/jar/mwave_sdk.jar" \
      --add-flags "-jar $out/share/motivewave/jar/MotiveWave.jar"

    # Fix the .desktop file path so Rofi can find it in the Nix store instead of looking in /usr/bin
    if [ -f usr/share/applications/motivewave.desktop ]; then
      substitute usr/share/applications/motivewave.desktop $out/share/applications/motivewave.desktop \
        --replace "/usr/bin/motivewave" "$out/bin/motivewave"
    fi

    runHook postInstall
  '';

  meta = {
    description = "MotiveWave Trading Platform";
    homepage = "https://www.motivewave.com/";
  };
}

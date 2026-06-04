{ stdenv
, lib
, fetchurl
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

  src = fetchurl {
    url = "https://motivewave.com";
    hash = "sha256:1jf10pbbwjqxnijvjkmla55sgrnscsbqsj1dpsk50ifvfqqa7wqp"; 
  };

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

  # Tells auto-patchelf to ignore the missing legacy media library files it can't find
  autoPatchelfIgnore = [
    "libavcodec.so.54"
    "libavcodec.so.56"
    "libavcodec.so.57"
    "libavcodec.so.58"
    "libavcodec.so.59"
    "libavcodec.so.60"
    "libavcodec.so.61"
    "libavcodec-ffmpeg.so.56"
    "libavformat.so.54"
    "libavformat.so.56"
    "libavformat.so.57"
    "libavformat.so.58"
    "libavformat.so.59"
    "libavformat.so.60"
    "libavformat.so.61"
    "libavformat-ffmpeg.so.56"
  ];

  unpackPhase = "dpkg-deb -x $src .";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/share
    cp -r usr/share/motivewave $out/share/
    cp -r usr/share/applications $out/share/ 2>/dev/null || true

    # Fix the wrapper launcher to point inside the Nix store and inject NVIDIA variables
    makeWrapper $out/share/motivewave/jre/bin/motivewave $out/bin/motivewave \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath buildInputs}:/run/opengl-driver/lib" \
      --set __GLX_VENDOR_LIBRARY_NAME nvidia \
      --set MESA_LOADER_DRIVER_OVERRIDE nvidia \
      --set MESA_GL_VERSION_OVERRIDE 4.5 \
      --add-flags "-Dprism.order=es2,es1,sw,j2d -Dsun.java2d.opengl=true"

    runHook postInstall
  '';

  meta = {
    description = "MotiveWave Trading Platform";
    homepage = "https://motivewave.com";
  };
}

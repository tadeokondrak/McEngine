with import <nixpkgs> {};

mkShell rec {
  name = "McEngine";
  buildInputs = [
    gcc-unwrapped.lib
    freetype
    zlib
    libGL
    libGLU
    xorg.libX11
    xorg.libXi
    xorg.libXext
  ];
  shellHook = ''
    export LD_LIBRARY_PATH=${lib.escapeShellArg (stdenv.lib.makeLibraryPath buildInputs)}:.
    unset SSL_CERT_FILE NIX_SSL_CERT_FILE
  '';
}

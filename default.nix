{ mkDerivation, base, bytestring, http-types, stdenv, text, wai
, web-routes
}:
mkDerivation {
  pname = "web-routes-wai";
  version = "0.24.2";
  src = ./.;
  libraryHaskellDepends = [
    base bytestring http-types text wai web-routes
  ];
  description = "Library for maintaining correctness of URLs within an application";
  license = stdenv.lib.licenses.bsd3;
}

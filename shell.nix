{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, bytestring, http-types, stdenv, text
      , wai, web-routes, cabal-install
      }:
      mkDerivation {
        pname = "web-routes-wai";
        version = "0.24.2";
        src = ./.;
        libraryHaskellDepends = [
          base bytestring http-types text wai web-routes cabal-install
        ];
        description = "Library for maintaining correctness of URLs within an application";
        license = stdenv.lib.licenses.bsd3;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage f {};

in

  if pkgs.lib.inNixShell then drv.env else drv

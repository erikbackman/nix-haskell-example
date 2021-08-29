let pkgs = import ./nixpkgs.nix {};
    package = import ./.;
    haskellTooling = with pkgs; [ 
      ghc 
      ghcid
      cabal-install
      haskellPackages.ormolu
      haskellPackages.hoogle
      (haskell-language-server.override { supportedGhcVersions = [ "8106" ]; })
    ];
in
pkgs.mkShell {
  nativeBuildInputs = [ pkgs.pkg-config ];
  inputsFrom = [ package.env ];
  buildInputs = haskellTooling;
}
  

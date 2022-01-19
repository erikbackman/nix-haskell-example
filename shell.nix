let pkgs = import ./nixpkgs.nix {};
    package = import ./.;
    haskellTooling = with pkgs; [ 
      ghc 
      ghcid
      cabal-install
      haskellPackages.ormolu
      (haskell-language-server.override { supportedGhcVersions = ["8107"]; })
    ];
in
pkgs.mkShell {
  nativeBuildInputs = [ pkgs.pkg-config ];
  inputsFrom = [ package.env ];
  buildInputs = haskellTooling;
}
  

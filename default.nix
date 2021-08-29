let pkgs = import ./nixpkgs.nix {}; in pkgs.haskell.packages.ghc8106.callCabal2nix "nix-example" ./. {} 

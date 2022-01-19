let pkgs = import ./nixpkgs.nix {}; in pkgs.haskell.packages.ghc8107.callCabal2nix "nix-example" ./. {} 

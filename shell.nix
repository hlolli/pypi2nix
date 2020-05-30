let
  nixpkgs = import <nixpkgs> {};
  pythonPackages = import ./requirements.nix { pkgs = nixpkgs; };
in
nixpkgs.mkShell {
  buildInputs = with nixpkgs; [
    pythonPackages.interpreter
    nixfmt
    git
    nix-prefetch-hg
  ];
  shellHook = ''
    export PATH=${./scripts}:$PATH
    export PYTHONPATH=${./src}:$PYTHONPATH
  '';
}

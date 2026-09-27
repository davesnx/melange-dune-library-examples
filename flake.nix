{
  inputs = {
    nixpkgs.url = "github:nix-ocaml/nix-overlays";

    dune = {
      url = "github:anmonteiro/dune/anmonteiro/editor-mode-prototype";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.melange.follows = "melange";
    };

    merlin = {
      url = "github:anmonteiro/merlin/anmonteiro/editor-mode-prototype";
      flake = false;
    };

    ocaml-lsp = {
      url = "github:anmonteiro/ocaml-lsp/anmonteiro/editor-mode-prototype";
      inputs.nixpkgs.follows = "nixpkgs/nixpkgs";
      inputs.ocaml-overlays.follows = "nixpkgs";
      inputs.merlin.follows = "merlin";
    };

    melange = {
      url = "github:melange-re/melange/v7-55";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = "https://anmonteiro.nix-cache.workers.dev";
    extra-trusted-public-keys = "ocaml.nix-cache.com-1:/xI2h2+56rwFfKyyFVbkJSeGqSIYMC/Je+7XXqGKDIY=";
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      forAllSystems =
        f:
        nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (
          system: f system nixpkgs.legacyPackages.${system}
        );
    in
    {
      formatter = forAllSystems (_system: pkgs: pkgs.nixfmt);

      devShells = forAllSystems (
        system: pkgs:
        let
          ocamlPackages = pkgs.ocaml-ng.ocamlPackages_5_5.overrideScope (
            _final: prev:
            pkgs.lib.genAttrs [ "merlin" "merlin-lib" "dot-merlin-reader" "ocaml-index" ] (
              name:
              prev.${name}.overrideAttrs (_: {
                src = inputs.merlin;
              })
            )
          );
        in
        {
          default = pkgs.mkShell {
            packages = [
              inputs.dune.packages.${system}.default
              inputs.melange.packages.${system}.default
              inputs.ocaml-lsp.packages.${system}.default
              ocamlPackages.merlin
              ocamlPackages.ocaml-index
              ocamlPackages.ocaml
              ocamlPackages.findlib
              ocamlPackages.reason
              ocamlPackages.uri
              ocamlPackages.alcotest
              pkgs.ocamlformat_0_29_0
              pkgs.nodejs
              pkgs.opam
            ];
          };
        }
      );
    };
}

(lang dune 3.9)
(using melange 0.1)
(using directory-targets 0.1)

(name melange-dune-library-examples)

(license MIT)

(maintainers "David Sancho <dsnxmoreno@gmail.com>")

(authors "David Sancho <dsnxmoreno@gmail.com>")

(source
 (github davesnx/melange-dune-library-examples))

(generate_opam_files true)

(implicit_transitive_deps false)

(package
 (name melange-dune-library-examples)
 (synopsis "melange-dune-library-examples")
 (depends
  ; General system dependencies
  (ocaml (>= 4.14.1))
  (reason (>= 3.14.0))
  (melange (>= 3.0.0))

  (promise (>= 1.1.2))

  (yojson (>= 2.2.0))
  (melange-json (>= 2.0.0))
  (melange-json-native (>= 2.0.0))

  (lwt (>= 5.6.0))
  (lwt_ppx (>= 2.1.0))

  (uri (>= 4.2.0))

  (odoc :with-doc)

  (ocamlformat
   (and
    (= 0.27.0)
    :with-test)) ; We use ocamlformat on the tests
  (ocaml-lsp-server :with-dev-setup)

  (melange-webapi :with-dev-setup)
  (reason-react :with-dev-setup)
  (melange-fetch :with-dev-setup)
  (reason-react-ppx :with-dev-setup)

  ; Test dependencies
  (alcotest :with-test)
))

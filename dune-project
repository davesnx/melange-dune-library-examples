(lang dune 3.24)
(using melange 1.0)

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
 (synopsis "Shared libraries for OCaml and Melange")
 (depends
  (ocaml (and (>= 5.5) (< 5.6)))
  (reason (>= 3.18.0))
  (melange (>= 7.0.0))
  (uri (>= 4.2.0))
  (odoc :with-doc)
  (ocamlformat
   (and
    (= 0.29.0)
    :with-test))
  (merlin :with-dev-setup)
  (ocaml-lsp-server :with-dev-setup)
  (ocaml-index :with-dev-setup)
  (alcotest :with-test)))

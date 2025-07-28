# Kinds of shared libraries with dune and melange

This repository demonstrates various patterns and implementations for creating shared libraries with dune and melange. It's a collection of minimalistic but real-world examples, extracted and adapted from server-reason-react repo.

## Pure library

- Same implementations: singular files
- No dependencies aside from Stdlib

## A (melange+native) library depending on a (melange+native) library

- Same implementation: singulgar file
- Dependency from a shared library

## Same interface with different implementations

- Different implementations, separate modules (`URL.re`, `URL.melange.re`)
- Different dependencies (`uri`, `melange.js`)
- Same `URL.rei`

## A library with different implementations and different interfaces with dependencies

- Different implementations, separate modules (`Promise.re`, `Promise.melange.re`)
- Different dependencies (`lwt`, `melange.belt melange.js`)
- Different preprocess (`lwt_ppx`, `melange.ppx`)
- Different interface (`Promise.rei`, `Promise.melange.rei`)

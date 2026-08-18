# familiar

Noctalia plugin with an animated pixel owl in the bar. Plugin page:
[familiar/README.md](familiar/README.md).

## Install

    noctalia msg plugins source add familiar git https://github.com/tanrendev/familiar
    noctalia msg plugins enable tanren/familiar

## Develop

    noctalia msg plugins source add dev path "$PWD"
    nix develop -c prek run --all-files

Sprites are drawn in `familiar/art/owl.aseprite`; `export.sh` re-exports both
palettes to `familiar/sprites/` (needs `aseprite`, or set `ASEPRITE`).

Layout and tooling follow
[noctalia-plugin-template](https://github.com/tanrendev/noctalia-plugin-template).
Releases: run the release workflow, or `nix develop -c ./release.sh`.

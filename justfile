set positional-arguments
set shell := ["bash", "-cue"]
root := justfile_directory()

# Build template.
build-template *args:
  typst compile \
    --root "{{root}}" \
    "{{src}}" "{{pdf}}" {{args}}

# Continuously rebuild template.
watch-template *args:
  typst watch \
    --open \
    --root "{{root}}" \
    "{{src}}" "{{pdf}}" {{args}}

# Nix development shell.
develop:
  nix develop ./tools/nix


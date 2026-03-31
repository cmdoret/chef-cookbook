set positional-arguments
set shell := ["bash", "-cue"]
root := justfile_directory()
template := "docs/template/main.typ"
pdf := "build/template.pdf"

[private]
default:
  just --list

# Build template.
build-template *args:
  typst compile \
    --root "{{root}}" \
    "{{template}}" "{{pdf}}" {{args}}

# Continuously rebuild template.
watch-template *args:
  typst watch \
    --open \
    --root "{{root}}" \
    "{{template}}" "{{pdf}}" {{args}}

# Nix development shell.
develop:
  nix develop ./tools/nix

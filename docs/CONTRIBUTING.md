# Contributing

When contributing to this repository, please first discuss the change you wish to make via issue,
email, or any other method with the owners of this repository before making a change.

## Development environment

Although not necessary, a development environment is available in this repository.
Below are the instructions to use it.

**Requirements:**

- [nix](https://nixos.org/)
- [just](https://just.systems/man/en/) or [`direnv`](https://direnv.net/)

The development environment consists of:

- A `justfile` to run common commands easily (e.g. `just build-template`). `just` lists available commands.
- A [`nix`](https://nix.dev/) development shell embedding all the tooling required to work in the repo, as well as fonts.
- Pre-commits hooks (via `prek`) to check and format the code automatically before every commit.

The shell can be activated either by running `just develop`, or `direnv allow` in the repository, if you have `direnv` set up.
The advantage of `direnv` is that it then auto-activates the shell every time you `cd` into the repo.

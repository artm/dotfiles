# Managed command line configuration

## Installation

```bash
# or a fork
git clone https://github.com/artm/dotfiles.git ~/.config/dotfiles
~/.config/dotfiles/.local/bin/setup-dotfiles.sh
# herstart shell?
```

## Inspiration

- the symlink-less dotfile management technique is based on [the article by
  Gabrielle Young][1]
  - which in turn is an elaboration of [a technique by Nicola Paolucci][2]

## Assumptions and conventions

- stock Rocky Linux 9 bash config (perhaps in turn based on RHEL 9 or Fedora, I
  don't know)
  - files inside `.bashrc.d` are expected to be sourced from `.bashrc`
    - this is only added in 9.x
    - had to start managing since I had to downgrade `admin-shell` to 8.x
- personal executables
  - better be avoided, but if I must:
    - executables to be run manually go to `~/bin`
    - executables used by the integrations go to `/.local/bin`
    - the latter is also used by some package managers to install user
      executables
    - both are added to the `$PATH` by Rocky Linux 9's stock `.bashrc`

## Integration: VSCode's Dev Containers

- [Dev Containers][3] extension provides [a way to inject managed dotfiles into
  the built containers][4]:
  - it will clone the configured repository into configured target direcotry
    then execute the configured installation script
  - it has sensible defaults for target directory and the installation script
    which I override to:
      - avoid having the installation script in the home directory (this would
        happen as consequence of configuring `$HOME` as git work tree)
      - hide the seemingly empty local dotfiles repository (it only contains
        `.git` subdirectory)

Hence my Dev Containers configuration:

- Dotfiles: Install Command
	- `~/.config/dotfiles/.local/bin/setup-dotfiles.sh`
- Dotfiles: Repository
	- `https://github.com/artm/dotfiles.git` (or a fork when I'm someone else)
- Dotfiles: Target Path
	- `~/.config/dotfiles`

The articles describe a variation of the technique with the bare cloned
repository. I find this cleaner than what my integration does, but Dev
Containers doesn't allow to configure how the cloning is performed, so I'm stuck
with the non-bare variant.


[1]: https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/
[2]: https://www.atlassian.com/git/tutorials/dotfiles
[3]: https://code.visualstudio.com/docs/devcontainers/containers
[4]: https://code.visualstudio.com/docs/devcontainers/containers#_personalizing-with-dotfile-repositories

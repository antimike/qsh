# Queue-based dotfiles and config management

## Tools

* Standard Linux tools:
    * git
    * awk / sed
    * gpg
        * pass
        * encfs
    * Bash v4
    * systemd
* GNU tools:
    * Make
    * M4 (template language)
    * Stow
* Forked / cloned from Github:
    * Esh (Bash templating based on Perl syntax)
* Speculative / possible overkill:
    * Puppet

## Requirements

* Idempotence
* Should backup any files or data removed
* Retroactively adding config files should be easy
    * git bare

## Repos

* vincentbernat/i3wm-configuration
    * Primary i3 / aesthetic reference
    * Very clean, modular code
    * Uses systemd to manage services and X session
    * Excellent i3 scripts
    * Forked as "i3wm-configuration"
* aduros/dotfiles
    * Original source of "i3-tabbed" script
    * Forked as "dotfiles-1"
* masasam/dotfiles
    * Single monolithic Makefile
    * Forked as "dotfiles-2"
* lanej/dotfiles
    * Slightly better-organized, but still monolithic, Makefile
    * Forked as "dotfiles-3"
* LoLei/dotfiles
    * Some nice shell scripts
    * Good Polybar / Picom examples
    * Forked as "dotfiles-4"
* peteryates/dotfiles
    * Nice, clean Makefile
        * Has simple "up" and "down" targets for quick install / teardown
    * Uses GNU Stow
    * Forked as "dotfiles-5"

## TODOs

- [ ] Use or write a templating library instead of using env variables

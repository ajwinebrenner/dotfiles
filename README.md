# dotfiles

My shell setup and various configuration for dev tooling.

## Scope

This repo mostly provides configuration files that would usually reside under `~/.config`.
Config is not user specific and can be applied to UNIX-based operating systems.
I use this config with both macOS and linux.

## How to Use

For simplicity, interacting with configuration relies on both `make` and `stow` to symlink the relevant files to `$HOME`.
Any files or directories in this repo will have the prefix `dot-` replaced with `.` when creating symlinks. 
To apply the config use:

`make apply`

This can also be used to reapply any changes to dotfiles.
This will also create directories for each tool in `~/.config` so any new files written by tooling will not pollute this repo.
> example: zsh creates history and compdump files

To remove the config use:

`make remove`

Because this process uses symlinks, applying and removing config is non-destructive.

## Conflicts

Setup may fail if exisiting configuration contains files with the same name as those found in this repo.
This will cause a conflict with `stow`. Exisiting config can be renamed, moved, or deleted.
Handling of these cases is left to the user to remediate in the way they prefer.

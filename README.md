# Get started

```sh
git pull https://github.com/jintonic/bash.git
cd bash
./install
```

# Understand BASH configuration files

BASH provides login/non-login and interactive/non-interactive shells. Here are some examples:

- login shell:
  * login from console (interactive)
  * ssh (interactive)
  * non-interactive shell with --login option (non-interactive)
- non-login shell:
  * open a new terminal emulator inside X (interactive)
  * invoke bash from command line (interactive)
  * scp (non-interactive)
  * run bash script (non-interactive)

A login shell loads the system configuration file `/etc/profile` first, and then try to load user configuration files in the following order:

1. `~/.bash_profile`
2. `~/.bash_login`
3. `~/.profile`

If one of the above is found, the rest will be ignored.

A non-login shell loads only `~/.bashrc`.

The non-login interactive shell is the mostly used one, e.g. open an xterm and start type in command. `$PATH` and aliases should be available for this type of shells. They hence need to be set in` ~/.bashrc`. A login interactive shell needs also `$PATH` and aliases.  `~/.bashrc` hence needs to be sourced inside `~/.profile`.

A non-login non-interactive shell will load `~/.bashrc`, but doesn't need fancy stuff such as aliases in it, the following command needs to be put at the beginning of `~/.bashrc` before stuff that aren't needed in a non-interactive shell:

```sh
# If not running interactively, just set PATH
PATH=.:~/bin:$PATH
[ -z "$PS1" ] && return
```

A shell script started with `#!/bin/sh` doesn't load any configuration files. If it is invoked in an interactive shell, it inherits all the setup from that shell. If it is invoked in a non-interactive shell, it loads nothing.

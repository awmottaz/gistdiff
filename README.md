# gistdiff

This is a simple script that can be used to create a GitHub Gist from your work-in-progress Git repository. It is useful for when you need to quickly sketch out ideas and need to share them or save them for yourself as notes for future work.

Suppose you have some uncommitted changes to your repository.

```
$ git status --short
 M README.md
 M gistdiff.sh
```

Simply run this script from the root of your repository…

```
$ gistdiff
```

…and the Git diff will be added to a new, private Gist.

## Install

### Prerequisites

- Git must be installed
- This Gist CLI client must be installed: https://github.com/defunkt/gist

Login to GitHub to enable creating Gists:

```sh
gist --login
```

### Install

1. Clone this repository
2. (Optionally) change the `install_path` in the Makefile. The default is `$HOME/.local/bin/gistdiff`.
3. Run `make install`.

## Features

This tool will run a `git diff` in your current directory and create a private Gist that includes every file in the diff (with a `.diff` file extension for correct highlighting).

This script was created on Arch Linux, but is hopefully portable to other OSes. Pull requests are welcome to fix any issues with that.

## In the future…

I might make this script more sophisticated, but no promises. Some things I would like:

- Checking that `git` and `gist` are installed, and offer to install either if not
- Accept many of the arguments that `git diff` supports for modifying the output
- Ability to select a subset of files

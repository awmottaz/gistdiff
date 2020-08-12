# gistdiff

Create a Gist containing your Git diff

## Install

- Git must be installed
- Install this Gist CLI client: https://github.com/defunkt/gist

Login to GitHub to enable creating Gists:

```sh
gist --login
```

Then run the `gistdiff.sh` script from the Git repository you're interested in! It's recommended to install this script on your machine so it's available everywhere. For example, save it to `$HOME/.local/bin/gistdiff` (and make it executable).

## Features

This tool will run a `git diff` in your current directory and create a private Gist that includes every file in the diff (with a `.diff` file extension for correct highlighting).

This script was created on Arch Linux, but is hopefully portable to other OSes. PRs welcome to fix any issues with that.

## In the future…

I might make this script more sophisticated, but no promises. Some things I would like:

- Checking for `git` and `gist`
  - Offer to install if not present
- Accept many of the arguments that `git diff` supports for modifying the output
- Ability to select a subset of files

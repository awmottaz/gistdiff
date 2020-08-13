#!/usr/bin/env bash

## This script uses the gist CLI tool to create a private
## Gist with the details of your current Git diff.
## See: https://github.com/defunkt/gist

tmp_dir=$(mktemp -d -t gist-XXXXXXXXXX)

for file in $(git diff --name-only); do
    git diff --minimal -- $file >$tmp_dir/$file.diff
done

if [ -z "$(ls -A $tmp_dir)" ]; then
    echo "the diff is empty"
    exit 1
fi

gist -p -d "$(git diff --shortstat --no-color)" -o $tmp_dir/*

# cleanup
rm -rf $tmp_dir

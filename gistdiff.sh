#!/usr/bin/env bash

# MIT License
#
# Copyright (c) 2020 Tony Mottaz
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

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

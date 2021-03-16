#!/usr/bin/env bash

# Gets the git commit hash of the working dir and adds an additional hash of any tracked modified files
commit=$(git describe --tags)
dirty=$(git ls-files -m)
if [[ -n ${dirty} ]]; then
    commit="$commit+dirty.$(echo ${dirty} | git hash-object --stdin | dd bs=8 count=1 status=none)"
fi
echo "$commit"


#!/bin/bash
# Generate tags for the entire repo

root="$(git rev-parse --show-toplevel 2>/dev/null)"
forg=".gitignore" # https://git-scm.com/docs/gitignore (persistant)
list="taggit" # file containing list of files to tag (temporary)
tags="tags" # file containing tags (persistant but ignored by git)

if [[ -n "$root" ]]; then
  old_path=$(pwd)
  cd "$root"
 
  # create tags for all files tracked in repo
  touch "$list" 
  git ls-files --recurse-submodules > "$list"
  ctags -L "$list" -f "$tags"
  rm "$list"
  echo "$tags created"

  # add tags file to .gitignore
  if [[ !(-f "$forg") || !(-f "$forg") ]]; then
    echo $(realpath --relative-to="$root" "$tags") >> "$forg" 
  fi
  
  cd "$old_path"
else
  echo "error: not in a git repo"
fi


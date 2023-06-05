#!/bin/bash
# Generate tags for the entire repo

root="$(git rev-parse --show-toplevel 2>/dev/null)"
forg="$root/.gitignore" # https://git-scm.com/docs/gitignore (persistant)
list="$root/taggit" # file containing list of files to tag (temporary)
tags="/tags" # file containing tags (persistant but ignored by git)

if [[ -n "$root" ]]; then
  git ls-files --recurse-submodules $root > "$list"
  ctags -L "$list" -f "$tags"
  rm "$list"
  echo "$tags created"
  
  if [[ ! -f "$forg" ]]; then
	touch "$forg"
	# echo "$forg created"
  fi
  if !(grep -a "$tags" "$forg"); then
	echo "$tags" >> "@forg"
    # echo "$tags added to $forg"
  fi
else
  echo "error: not in a git repo"
fi


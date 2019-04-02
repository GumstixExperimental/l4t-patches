#! /bin/bash

function join_by { local IFS="$1"; shift; echo "$*"; }

if [ $# -eq 0 ]; then
  echo "Error: Not enough args"
  exit
fi

swd=$PWD
src_path=$1

patchfiles=$(ls patches/*)

for file in $patchfiles
do
  echo $file
  fullpath="$PWD/$file"
  subpath=${file#"patches/"}
  len=`expr match $subpath '.*.patch'`
  len=$((len - 6))
  if [ $len -le 0 ]; then
    continue
  fi
  subpath=${subpath:0:$len}
  paths=$(echo $subpath | tr "+" "\n")
  dest=$(realpath $src_path/$(join_by / ${paths[@]}))
  pushd $dest
  echo "We are going to $dest"
  echo "We are at $PWD"
  if [[ $PWD == $dest ]]; then
    git apply "$fullpath" --verbose
    popd
  else
    echo "ERROR, I'm not where i should be!"
    echo "dest = $dest"
    echo "PWD = $PWD"
  fi
  if [[ $PWD != $swd ]]; then
    echo "ERROR, I didn't make it home!"
  else
    echo "I'm home"
  fi
done
#!/usr/bin/env bash
for file in requirements.txt requirements/*.txt; do
	filename="${file##*/}"
	perl -pe's=^([^#\n]\S*)=- [\1](https://pypi.org/project/\1)=g;
  s/^#\s*//g;s/^!.*/## '"${filename%%.txt}"'/g' <"$file"
done

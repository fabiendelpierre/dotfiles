if [ ! -e /usr/local/bin/diff-so-fancy ]
then
  echo "diff-so-fancy is not installed, aborting..."
  return 1
else
  diff-so-fancy --set-defaults
fi

package=bash-language-server
if pacman -Qs $package > /dev/null ; then
  echo "The package $package is installed"
else
  echo "The package $package is not installed"
fi

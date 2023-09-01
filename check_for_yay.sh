#!/bin/bash

package=yay
if pacman -Qi $package > /dev/null ; then
  echo "The package $package is installed"
else
  echo "The package $package is not installed"
fi
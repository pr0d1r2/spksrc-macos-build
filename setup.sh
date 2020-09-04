#!/usr/bin/env bash

UNAME="$(uname)"
case "$UNAME" in
  "Darwin")
    ;;
  *)
    echo "Unsupported platform: $UNAME"
    exit 100
    ;;
esac


function no_command() {
  command -v "$1" 1>/dev/null || return 0
  return 1
}

if (no_command docker); then
  if (no_command brew); then
    echo "Homebrew is missing. Installing..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" || exit $?
  fi

  echo "Installing Docker from Homebrew..."
  brew cask install docker || exit $?
fi

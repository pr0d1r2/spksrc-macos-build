#!/usr/bin/env bash

PACKAGE="$1"
ARCHITECTURE="$2"
DSM="6.1"
SYNO="syno-$ARCHITECTURE-$DSM"

cd "$(dirname "$0")" || exit $?
CWD="$(pwd -P)"

bash setup.sh || exit $?

BUILD_SCRIPT="packages/$PACKAGE_$ARCHITECTURE.build.sh"
if [ ! -e "$BUILD_SCRIPT" ]; then
  BUILD_SCRIPT_FROM_TEMPLATE="1"
  cat "$CWD/packages/TEMPLATE.build.sh" |
    sed -e "s/SYNO/$SYNO/g" -e "s/PACKAGE/$PACKAGE/g" -e "s/ARCHITECTURE/$ARCHITECTURE/g" > "$BUILD_SCRIPT"
fi

docker pull synocommunity/spksrc || exit $?
docker run -it -v "$CWD/packages:/packages" synocommunity/spksrc /bin/bash "/$BUILD_SCRIPT" "$SYNO" || exit $?

if [ -n "$BUILD_SCRIPT_FROM_TEMPLATE" ]; then
  rm -f "$BUILD_SCRIPT" || exit $?
fi

#! /bin/sh
export POSTGRESQL_URL="postgres://127.0.0.1/mahercash"
export SORUCE_PACKAGE_DIRS="$(dirname $0)/../packages/"
export METEOR_PACKAGE_DIRS="$(dirname $0)/../pckgs/"
export MONGO_URL="nope"

# rm -rf "$METEOR_PACKAGE_DIRS"
rsync -av "$SORUCE_PACKAGE_DIRS" "$METEOR_PACKAGE_DIRS"

cd "$(dirname $0)"

meteor "$@"

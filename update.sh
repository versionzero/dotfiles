#!/bin/sh

# Move over to the directory containing the base dot files
DIR=`dirname $0`
pushd ${DIR} >/dev/null

printf "\nPulling latest dot files...\n"

# Pull the latest version of the dot file
git pull

# Now, install them
./install.sh

# Return to the directory from where we came from
popd >/dev/null

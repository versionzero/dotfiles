#!/bin/sh

printf "\nRemoving garbage files...\n"

find . -name *~ -name .*~ -name *# -name .*# -exec rm -vf {} \;

printf "Installing new dot files...\n\n"

##
# dot files
##

# Create a set of command line options to ignore some of the files in
# the working directory
IGNORE=
for FILE in `cat IGNORE | grep -E -v "\#|^$"`; do
    IGNORE="-not -name ${FILE} ${IGNORE}"
done

# Process all the files in the working directory, skipping only the
# ones we have explicitly set to be ignored.
CWD=`pwd`
for FILE in `find ${CWD}/. -maxdepth 1 ${IGNORE} -type f`; do
    NAME=`basename "${FILE}"`
    ln -fsv ${CWD}/${NAME} ~/.${NAME}
done

##
# dot directories
##

# Process all the local directories, except any hidden ones.  If we
# see that there exists a directory by the same name as the link we
# are about to make, we will move it out of the way.  If there is a
# link already in place, then we just trample it.
CWD=`pwd`
for DIRECTORY in `find ${CWD}/. -maxdepth 1 -not -name '.*' -type d`; do
    NAME=`basename "${DIRECTORY}"`
    DESTINATION=${HOME}/.${NAME}
    if [ -L ${DESTINATION} ]; then
	rm -f ${DESTINATION}
    elif [ -d ${DESTINATION} ]; then
	mv -v ${DESTINATION} ${DESTINATION}-
    fi
    ln -fsv ${CWD}/${NAME} ${DESTINATION}
done

printf "\nAll done!\n"


#!/bin/bash

# Will update the installed version of DBeaver Community Edition

DBEAVER_FILE_NAME=dbeaver-ce-latest-linux.gtk.x86_64.tar.gz
DBEAVER_DIR_NAME=dbeaver

cd /tmp
rm -rf $DBEAVER_DIR_NAME
rm -rf $DBEAVER_FILE_NAME

echo "Downloading latest version of dbeaver"

wget https://dbeaver.io/files/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz

echo "Extracting dbeaver-ce-latest-linux.gtk.x86_64.tar.gz..."

tar xvf dbeaver-ce-latest-linux.gtk.x86_64.tar.gz

OLD_DBEAVER_VERSION=$(head -n 3 /usr/share/dbeaver/readme.txt | tail -n 1)
NEW_DBEAVER_VERSION=$(head -n 3 /tmp/${DBEAVER_DIR_NAME}/readme.txt | tail -n 1)

if [ $OLD_DBEAVER_VERSION = $NEW_DBEAVER_VERSION ]; then
    echo "DBeaver is already up-to-date (version ${OLD_DBEAVER_VERSION})"
    exit 0;
fi

echo "The old dbeaver version is ${OLD_DBEAVER_VERSION}. Making backup..."

sudo mv /usr/share/dbeaver /usr/share/dbeaver-${OLD_DBEAVER_VERSION}

echo "Moving new version of DBeaver directory"

sudo mv /tmp/${DBEAVER_DIR_NAME} /usr/share/dbeaver

echo "Done!"

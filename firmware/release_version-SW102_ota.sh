#!/bin/sh

echo
echo This script will release a new version of the 850C, 860C and SW102 firmwares
echo 
echo Please enter the new version number, e.g. 0.5.1

read VERSION

RELEASE_FOLDER=${PWD}/releases/$VERSION

if [ ! -d "$RELEASE_FOLDER" ]; then
	
  # create folder
	mkdir -p $RELEASE_FOLDER

	cd SW102
        make -f Makefile clean
        make -f Makefile generate_dfu_package VERSION=$VERSION
	cp _release/sw102-otaupdate-xxx.zip $RELEASE_FOLDER/sw102-otaupdate-$VERSION.zip
	cd ..

	echo 
	echo Done! If the build went correctly, find the files on: $RELEASE_FOLDER
else
	echo 
	echo Release $VERSION already exists!
fi


#!/bin/bash
#
# Using to generate a ZIP file used to install direct on QGIS via local file
# or to Upload to QGIS plugin store
#
# get current tag from git used as version
VERSION=$(git describe --tags --abbrev=0)
TAG_TEST=$(echo "${VERSION}" | cut -d'v' -f1)

if [[ "${TAG_TEST}" = "" ]]; then
    TAG_VERSION=$(echo ${VERSION} | cut -d'v' -f2)
else
    TAG_VERSION="${VERSION}"
fi;

# search the current version inside metadata file
CUR_VERSION=$(grep -r "version=" ./src/metadata.txt)
# define new version string to put inside metadata file
NEW_VERSION="version=${TAG_VERSION}"

# change version into metadata.txt
sed -i "s/${CUR_VERSION}/${NEW_VERSION}/g" "./src/metadata.txt"

DIR_NAME="terrabrasilis_datasource"
FILE_NAME="${DIR_NAME}-${TAG_VERSION}"

mkdir "${DIR_NAME}"

cp -a src/* "${DIR_NAME}/"
cp -a README.md "${DIR_NAME}/"

zip -r ${FILE_NAME}.zip "${DIR_NAME}" \
-x "${DIR_NAME}/pb_tool.cfg" \
"${DIR_NAME}/Makefile" \
"${DIR_NAME}/pylintrc" \
"${DIR_NAME}/test/*" \
"${DIR_NAME}/scripts/*" \
"${DIR_NAME}/res/*"

rm -rf "${DIR_NAME}"
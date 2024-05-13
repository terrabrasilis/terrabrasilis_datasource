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
exit

FILE_NAME="terrabrasilis_datasource-${TAG_VERSION}"

mkdir "${FILE_NAME}"

cp -a src/* "${FILE_NAME}/"
cp -a README.md "${FILE_NAME}/"

zip -r ${FILE_NAME}.zip "${FILE_NAME}" \
-x "${FILE_NAME}/pb_tool.cfg" \
"${FILE_NAME}/Makefile" \
"${FILE_NAME}/pylintrc" \
"${FILE_NAME}/test/*" \
"${FILE_NAME}/scripts/*" \
"${FILE_NAME}/res/*"

rm -rf "${FILE_NAME}"
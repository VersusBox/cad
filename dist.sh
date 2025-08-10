#!/bin/bash
set -e

if [ -d dist ]; then
	rm -r dist
fi
mkdir dist

cp *.FCStd dist
cp *.stl dist
cp *.pdf dist
cp *.xhtml dist
cp ChangeLog dist
cp AUTHOR LICENSE dist
cp dist.sh dist

TAG=$(git describe --tags)
CWD=$(pwd)
pushd dist
zip -r "${CWD}/versusbox-cad-${TAG}.zip" *
popd

rm -r dist
echo "Dist archive created at ${CWD}versusbox-cad-${TAG}.zip"


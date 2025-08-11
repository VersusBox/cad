#!/bin/bash
set -e

if [ -d dist ]; then
	rm -r dist
fi
mkdir dist

cp *.FCStd dist
cp *.stl dist
mkdir dist/accessories
cp accessories/*.FCStd dist/accessories
cp accessories/*.stl dist/accessories
mkdir dist/placeholders
cp placeholders/*.FCStd dist/placeholders
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


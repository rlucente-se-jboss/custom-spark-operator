#!/usr/bin/env bash

. $(dirname $0)/demo.conf

PUSHD $WORKDIR

id=$(podman images | grep spark-operator | awk '{print $3; exit}')
ctr=$(buildah from $id)
mnt=$(buildah mount $ctr)

rm -fr jar-content
mkdir jar-content

pushd jar-content
find $mnt -type f -name spark-operator.jar -exec jar xf {} \;
popd

buildah unmount $ctr

echo
echo The contents of the jar embedded in the spark operator are available in
echo the $(pwd)/jar-content directory.
echo

POPD


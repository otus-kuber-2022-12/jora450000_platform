#!/bin/bash -x

declare -x CM=ch.150.230.151.237.nip.io

helm plugin install https://github.com/chartmuseum/helm-push || echo Allready exist cm-push plugin


find ./ -iname '*.tgz' -type f -exec helm cm-push  {} https://$CM  \;

curl https://$CM/api/charts






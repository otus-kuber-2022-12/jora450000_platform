#!/bin/bash

declare -x CM=chart.150.230.151.237.nip.io

helm plugin install https://github.com/chartmuseum/helm-push || echo Allready exist cm-push plugin
helm cm-push ./test-chart-0.1.0.tgz    https://$CM  || echo Allready exist test-chart


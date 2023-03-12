#!/bin/bash -x
helm uninstall chartmuseum || echo  not installed
helm repo add chartmuseum https://chartmuseum.github.io/charts  || echo allready added
helm install  -f values.yaml chartmuseum  chartmuseum/chartmuseum

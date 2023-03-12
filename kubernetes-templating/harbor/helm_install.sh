#!/bin/bash -x

helm uninstall harbor || echo not installed

helm repo add harbor https://helm.goharbor.io || echo allready added

helm install -f values.yaml harbor harbor/harbor

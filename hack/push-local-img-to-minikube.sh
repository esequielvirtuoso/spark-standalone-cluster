#!/bin/bash
imagetag=$1
repo=$2
minikube image load esequielvirtuoso/$repo:$imagetag

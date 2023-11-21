#!/bin/bash
port=$(minikube kubectl -- get svc --all-namespaces -o go-template='{{range .items}}{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}{{end}}')
echo $(google-chrome $(minikube ip):$port)

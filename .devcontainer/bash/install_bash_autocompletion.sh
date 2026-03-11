#!/bin/bash

###
### Shell completions
###
# generate gh completions
gh completion -s bash > "/usr/share/bash-completion/completions/gh"
# kubectl completions
kubectl completion bash > "/usr/share/bash-completion/completions/kubectl"
# kind completions
kind completion bash > "/usr/share/bash-completion/completions/kind"
# docker completions (only if docker is available)
if command -v docker >/dev/null 2>&1; then
    docker completion bash > "/usr/share/bash-completion/completions/docker"
else
    echo "Docker not found, skipping Docker bash completion setup"
fi
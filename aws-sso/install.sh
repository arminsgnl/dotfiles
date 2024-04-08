#!/usr/bin/env zsh

set -e

if test ! $(which aws-sso); then
  printf "\n🚀 Installing the aws-sso-cli tool\n"
  /bin/bash -c "$(go install github.com/synfinatic/aws-sso-cli/cmd/aws-sso@latest)"
fi


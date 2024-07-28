#!/bin/bash

if [ -z "$GITHUB_USER" ]; then
  GITHUB_USER="albertyItzep"
  export GITHUB_USER
fi

gitUser=$GITHUB_USER

httpPathModified="https://api.github.com/users/$gitUser"
jsonResponse=$(curl $httpPathModified)

idUser=$(echo $jsonResponse | jq '.id')
createdAt=$(echo $jsonResponse | jq '.created_at')
actualyDate=$(date +"%F")
stringFinaly="Hola $gitUser, UserID:$idUser, createAt: $createdAt"

if ! test -f "/tmp/$actualyDate/saludos.log"; then
  $(mkdir "/tmp/$actualyDate/")
  $(touch "/tmp/$actualyDate/saludos.log")
fi

$(echo "$stringFinaly" >>"/tmp/$actualyDate/saludos.log")

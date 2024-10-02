#!/bin/bash

FILE=$1

EXPIRATION=604800

aws s3 cp "$FILE" "s3://lab4eva/"

URL=$(aws s3 presign "s3://lab4eva/$FILE" --expires-in $EXPIRATION)


clear
echo "Presigned URL: $URL"

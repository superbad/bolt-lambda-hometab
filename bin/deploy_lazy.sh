#!/bin/bash
# rm -rf vendor && mkdir -p vendor/slack_bolt && cp -pr ../../slack_bolt/* vendor/slack_bolt/
source ../.env
rm -rf /tmp/app-build
# mkdir /tmp/app-build && cp -pr ../../app /tmp/app-build
mkdir /tmp/app-build || exit
cp -pf ../config/lambda_config.yaml ../requirements.txt ../hometab.py /tmp/app-build
cp -prf /tmp/app-build/
pip install python-lambda -U
cd /tmp/app-build || exit
lambda deploy \
  --config-file lambda_config.yaml \
  --requirements requirements.txt
#!/bin/bash

## Guide links
# https://www.zaproxy.org/docs/docker/full-scan/
# https://mydeveloperplanet.com/2021/05/11/automate-zap-with-docker/


## -------------------------------------------------------------------------------- ##
## The scripts should be same on the Github and on the new staging server           ##
## Github: https://github.com/munishgandhi/devops/tree/main/zap                     ##
## New staging Server IP: 23.22.221.64 (contains zap scripts and run scan itself)   ##
## Scripts path on the server: /home/ubuntu/.zap/scripts/                           ##
## -------------------------------------------------------------------------------- ##

# Whitelist IP
docker exec myhyly-redis_db-1 sh -c 'redis-cli set "rack::attack:safeip-23.22.221.64" 1'

# Run full scan
docker run --rm -v $(pwd):/zap/wrk/:rw --net zapnet --cpus="2.5" --memory="10g" -t ictu/zap2docker-weekly zap-full-scan.py -d -I -j \
  -t "https://test.hyly.us" \
  --hook=/zap/auth_hook.py \
  -r hyly-new-stage-full-scan.html \
  -z "auth.loginurl=https://test.hyly.us/login \
      auth.username=cxp@hy.ly \
      auth.password=A8V5J.<(j]:> \
      auth.auto=1"

# Remove IP from whitelist
docker exec myhyly-redis_db-1 sh -c 'redis-cli del "rack::attack:safeip-23.22.221.64"'

# Install wkhtmltopdf on the server where you running this script
wkhtmltopdf hyly-new-stage-full-scan.html hyly-new-stage-full-scan.pdf

# Send report to Slack channel
FILE_PATH="./hyly-new-stage-full-scan.pdf"
FILE_NAME="hyly-new-stage-full-scan.pdf"
CHANNEL="hyly-zap-alerts"
CHANNEL_ID="C05M1A77XUN"
TOKEN="xoxb-3491998352-5724054001493-4RSWJcBu1WGrhYl62DWMMcnT"

CURRENT_DATE_TIME=$(date +"%Y-%m-%d %H:%M:%S")
MESSAGE="Scan Report of new staging at $CURRENT_DATE_TIME!"

curl -v https://slack.com/api/files.upload -F token="${TOKEN}" -F channels="${CHANNEL}" -F title="${MESSAGE}" -F filename="${FILE_NAME}" -F file=@"${FILE_PATH}"

# Remove reports from server 
rm -rf hyly-new-stage-full-scan.pdf hyly-new-stage-full-scan.html




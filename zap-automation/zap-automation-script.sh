#!/bin/bash

ssh -i ~/Documents/hyly/keys/ja-keypair ubuntu@23.22.221.64 "docker exec myhyly-redis_db-1 sh -c 'redis-cli set "rack::attack:safeip-58.27.193.244" 1'"

docker run --rm -v $(pwd):/zap/wrk/:rw --net zapnet -t ictu/zap2docker-weekly zap-full-scan.py -I -j -T 30\
  -t "https://test.hyly.us/login?old=1" 
  --hook=/zap/auth_hook.py \
  -r ictuzap-full-scan.html \
  -z "auth.loginurl=https://test.hyly.us/login?old=1 \
      auth.username=cxp@hy.ly \
      auth.password=A8V5J.<(j]:> \
      auth.auto=1"


ssh -i ~/Documents/hyly/keys/ja-keypair -o StrictHostKeyChecking=no ubuntu@23.22.221.64 "redis-cli del "rack::attack:safeip-58.27.193.244s""







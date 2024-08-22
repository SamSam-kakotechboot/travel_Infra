#!/bin/bash

ACTIVE_COLOR=$(cat /etc/nginx/samsam/active_color.txt)

# 반대 환경 설정
if [ "$ACTIVE_COLOR" == "blue" ]; then
    NEW_COLOR="green"
elif [ "$ACTIVE_COLOR" == "green" ]; then
    NEW_COLOR="blue"
else
    echo "ERROR: Invalid color in /etc/nginx/samsam/active_color.txt"
    exit 1
fi

echo "현재 활성화된 환경: $ACTIVE_COLOR"
echo "새로운 환경: $NEW_COLOR"

if [ "$NEW_COLOR" == "green" ]; then
    sudo ln -sf /etc/nginx/sites-available/green.conf /etc/nginx/sites-enabled/project
elif [ "$NEW_COLOR" == "blue" ]; then
    sudo ln -sf /etc/nginx/sites-available/blue.conf /etc/nginx/sites-enabled/project
fi

echo "$NEW_COLOR" | sudo tee /etc/nginx/samsam/active_color.txt > /dev/null

sudo nginx -t && sudo systemctl reload nginx

if [ $? -eq 0 ]; then
    echo "성공적으로 $NEW_COLOR 환경으로 전환되었습니다."
else
    echo "ERROR: Nginx 설정에 문제가 있습니다."
    exit 1
fi
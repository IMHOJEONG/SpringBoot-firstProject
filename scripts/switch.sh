#!/usr/bin/env bash

ABSPATH=$(readlink -f $0)
ABSDIR=$(dirname $ABSPATH)
source ${ABSDIR}/profile.sh

function switch_proxy() {
    IDLE_PORT=$(find_idle_port)

    echo "> 전환할 port: $IDLE_PORT"
    echo "> Port 전환"
    echo "set $service_url http://127.0.0.1:${IDLE_PORT};" | sudo tee /etc/nginx/conf.d/service-url.inc
    # ec2 인스턴스에서 service-url.inc 파일 오타 주의

    echo "> 엔진엑스 Reload"
    sudo service nginx reload
}
#!/bin/sh
set -ex

cp -rf /locust/ --recursive --region ${AWS_REGION}

LOCUST_MODE=${LOCUST_MODE:-standalone}
MASTER_PORT=${MASTER_PORT:-8089}
LOCUST_FILE=${LOCUST_FILE:-main.py}

LOCUST_OPTS="-f ${LOCUST_FILE} --no-reset-stats"

if [ -n ${LOCUST_MODE}] ; then
    if [ -z ${MASTER_IP}] ; then
        LOCUST_OPTS="--host=${MASTER_IP} $LOCUST_OPTS"
    else
        echo "No value set for (MASTER_IP), falling back to host value in the locust class"
    fi
fi

case `echo ${LOCUST_MODE} | tr 'a-z' 'A-Z'` in
"MASTER")
    LOCUST_OPTS="--master --master-bind-port=${MASTER_PORT} $LOCUST_OPTS"
    ;;

"SLAVE")
    LOCUST_OPTS="--slave --master-host=${LOCUST_MASTER} --master-port=${MASTER_PORT} $LOCUST_OPTS"
    if [ -z ${LOCUST_MASTER} ] ; then
        echo "You need to set LOCUST_MASTER."
        exit 1
    fi
    ;;
esac

exec "$@" ${LOCUST_OPTS}
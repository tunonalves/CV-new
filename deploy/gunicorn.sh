#!/bin/bash
NAME="CV"
DJANGODIR=$(dirname $(cd `dirname $0` && pwd))
SOCKFILE=/tmp/gunicorn-tunonalves.sock
LOGDIR=${DJANGODIR}/logs/gunicorn.log
USER=fta
GROUP=fta
NUM_WORKERS=5
DJANDO_WSGI_MODULE=portfolio.wsgi

rm -frv $SOCKFILE

echo $DJANGODIR

cd $DJANGODIR

exec ${DJANGODIR}/venv/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
 --name $NAME \
 --workers $NUM_WORKERS \
 --user=$USER --group=$GROUP \
 --bind=unix:$SOCKFILE \
 --log-level=debug \
 --log-file=$LOGDIR


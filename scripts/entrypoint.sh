#!/bin/bash
# pubsub コンテナ立ち上げ時に使用
set -em

gcloud beta emulators pubsub start --project=$PUBSUB_PROJECT_ID --host-port=$PUBSUB_EMULATOR_HOST --quiet &

while ! nc -z localhost 8085; do
  sleep 0.1
done

python3 publisher.py $PUBSUB_PROJECT_ID create $TOPIC_ID
python3 subscriber.py $PUBSUB_PROJECT_ID create-push $TOPIC_ID $SUBSCRIPTION_ID $PUSH_ENDPOINT

fg %1

FROM gcr.io/google.com/cloudsdktool/cloud-sdk:367.0.0-emulators

RUN apt-get update && \
  apt-get install -y git python3-pip netcat && \
  git clone https://github.com/googleapis/python-pubsub.git

WORKDIR /python-pubsub/samples/snippets
RUN pip3 install -r requirements.txt

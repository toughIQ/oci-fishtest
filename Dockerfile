FROM docker.io/python:latest
LABEL maintainer="toughIQ@gmail.com"

RUN mkdir /fishtest
RUN useradd -r -s /bin/bash -g root -G root -u 1000 fishtest
    
WORKDIR /fishtest
RUN git clone https://github.com/glinscott/fishtest.git

RUN chgrp -R 0 /fishtest && \
    chmod -R g=u /fishtest

USER fishtest

CMD ["bash", "-c", "python3 fishtest/worker/worker.py $USERNAME $PASSWORD --concurrency $CORES"]

# USERNAME and PASSWORD have to be created here: https://tests.stockfishchess.org/signup
# CORES is the max number of CPU cores used by default. We set 1 here.
ENV USERNAME="SET_YOUR_FISHTEST_USERNAME" \
    PASSWORD="SET_YOUR_FISHTEST_PASSWORD" \
    CORES="1"

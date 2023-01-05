FROM docker.io/python:3
LABEL maintainer="toughIQ@gmail.com"

RUN adduser --shell /bin/bash fishtest
USER fishtest


WORKDIR /fishtest
RUN git clone https://github.com/glinscott/fishtest.git

CMD python3 fishtest/worker/worker.py $USERNAME $PASSWORD --concurrency $CORES

# USERNAME and PASSWORD have to be created here: https://tests.stockfishchess.org/signup
# CORES is the max number of CPU cores used by default. We set 1 here.
ENV USERNAME="SET_YOUR_FISHTEST_USERNAME" \
    PASSWORD="SET_YOUR_FISHTEST_PASSWORD" \
    CORES="1"

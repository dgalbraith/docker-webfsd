FROM alpine AS builder

ARG WEBFSD_VERSION
ARG WEBFSD_PORT
ARG WEBFSD_HOSTING_DIR

# Set the CFLAGS to suppress warnings - the code is old and not maintained
# Needs to be passed as an environment variable as it breaks if we pass in
# the RUN command
ENV CFLAGS="-Wno-pointer-sign -Wno-cpp -Wno-format-truncation"

RUN apk update && apk add build-base mailcap openssl-dev

# Download and extract the source code
RUN wget https://github.com/ourway/webfsd/archive/refs/tags/$WEBFS_VERSION.tar.gz -O - | tar xzf -

# Replace <sys/signal.h> with <signal.h> to fix warnings
RUN sed -i 's|<sys/signal.h>|<signal.h>|g' webfsd-$WEBFS_VERSION/webfsd.c

#  Build the application
RUN cd webfsd-$WEBFS_VERSION \
    && make install \
    && cd .. \
    && rm -r webfsd-$WEBFS_VERSION

FROM alpine

ENV WEBFSD_PORT=$WEBFSD_PORT
ENV WEBFSD_HOSTING_DIR=$WEBFSD_HOSTING_DIR

COPY --from=builder /etc/mime.types /etc/mine.types
COPY --from=builder /usr/local/bin/webfsd /usr/local/bin/webfsd
EXPOSE  $WEBFSD_PORT
CMD /usr/local/bin/webfsd -p $WEBFSD_PORT -d -r $WEBFSD_HOSTING_DIR
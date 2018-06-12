FROM alpine:3.7

# Install necessary stuff
RUN apk -U --no-progress upgrade && \
    apk -U --no-progress add taskd taskd-pki && \
    rm -rf /var/cache/apk/*

# Import build and startup script
COPY run.sh /app/taskd/

# Set the data location
ARG TASKDDATA
ENV TASKDDATA ${TASKDDATA:-/var/taskd}

# Configure container
VOLUME ["${TASKDDATA}"]
EXPOSE 53589
ENTRYPOINT ["/app/taskd/run.sh"]

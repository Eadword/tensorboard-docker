FROM python:3-alpine

EXPOSE 6006/tcp
VOLUME /tflogs

RUN apk add --no-cache g++ linux-headers make musl-dev \
 && pip install --no-cache-dir tensorboard \
 && apk del linux-headers make musl-dev

ENTRYPOINT [ "tensorboard" ]
CMD [ "--logdir=/tflogs", "--bind_all" ]



FROM alpine:latest

# Install kamikaze
RUN set -exuo pipefail \
  && apk --no-cache add curl \
  && curl https://raw.githubusercontent.com/olegbukatchuk/kamikaze/main/install.sh | sh

# Install tls-tofu
RUN set -exuo pipefail \
  && apk --no-cache add \
    openssl

COPY tls-tofu.sh /
ENTRYPOINT ["/tls-tofu.sh"]
CMD ["sh"]

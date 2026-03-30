FROM node:20-bookworm

RUN apt-get update \
  && apt-get install -y --no-install-recommends git make \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

CMD bash -lc "set -euo pipefail; \
echo '[1/3] Checking repository'; \
if [ ! -d /app/js-fastify-blog/.git ]; then \
  echo '[2/3] Cloning repository'; \
  git clone https://github.com/hexlet-components/js-fastify-blog.git /app/js-fastify-blog; \
else \
  echo '[2/3] Repository already exists, skip clone'; \
fi; \
echo '[3/3] Installing dependencies. Run tests and start dev server'; \
cd /app/js-fastify-blog; \
make install && make test"
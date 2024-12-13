FROM node:current-alpine

ENV PNPM_HOME=/usr/local/bin

WORKDIR /opt/bentobox/

# Copy everything into the container
COPY . .

##TODO: use cache to make this faster

# Install dependencies, including devDependencies
RUN apk update && \
    corepack enable && corepack prepare pnpm@latest --activate && \
    pnpm config set store-dir /opt/bentobox/.pnpm-store && \
    pnpm install --unsafe-perm --force

#BUILDS
RUN pnpm build:server
RUN pnpm build:client

#TODO: environment configs

# Use the global start script defined in package.json
ENTRYPOINT ["pnpm"]
CMD ["start"]

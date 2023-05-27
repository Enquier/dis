FROM registry.access.redhat.com/ubi7/nodejs-12
WORKDIR /opt/app-root

USER 0

COPY . ./

RUN chmod 755 /opt/app-root \
  && chown -R 1001:0 /opt/app-root

USER 1001

# Install yarn
RUN npm install -g yarn

# Copy Project
COPY . ./

RUN yarn install --production

EXPOSE 8000

# Run server
ENTRYPOINT ["/bin/bash", "-c"]
CMD ["node index.js"]

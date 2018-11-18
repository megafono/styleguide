FROM node

ENV PATH="$(yarn global bin):${PATH}"

RUN yarn global add svgexport
RUN apt-get update && apt-get install pngquant zip -y

RUN mkdir -p /tmp/svg-embed-font && wget -qO- https://github.com/BTBurke/svg-embed-font/releases/download/v1.0.0/svg-embed-font.linux_x64.tar.gz | tar xvz -C /tmp/svg-embed-font && mv /tmp/svg-embed-font/svg-embed-font /bin

COPY . /usr/src/app
WORKDIR /usr/src/app

ENTRYPOINT ["bin/generate-all"]

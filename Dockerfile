FROM node

ENV PATH="$(yarn global bin):${PATH}"

RUN yarn global add svgexport

COPY . /usr/src/app
WORKDIR /usr/src/app

ENTRYPOINT ["bin/generate-all"]

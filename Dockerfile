FROM node

ENV PATH="$(yarn global bin):${PATH}"

RUN yarn global add svgexport
RUN apt-get update && apt-get install pngquant

COPY . /usr/src/app
WORKDIR /usr/src/app

ENTRYPOINT ["bin/generate-all"]

FROM node:latest

ENV APP_ROOT /src

RUN mkdir ${APP_ROOT}
WORKDIR ${APP_ROOT}
ADD . ${APP_ROOT}

RUN npm install
RUN npm rebuild
RUN npm run build

EXPOSE 8080

ENV HOST 0.0.0.0
ENV PORT 8080

HEALTHCHECK CMD curl -f http://localhost:8080/ || exit 1

CMD npm start
LABEL startpage.hidden=true

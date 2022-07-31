FROM node:lts-alpine3.16
RUN apk add firefox
USER node
WORKDIR /code
COPY package-lock.json package.json ./
RUN npm ci
COPY --chown=node:node . .
CMD ["npm","run", "test:headless"]


##FROM circleci/node:14.18.2-browsers
#FROM testcafe/testcafe
#
#WORKDIR /build
#COPY package-lock.json package.json ./
#RUN npm ci
#COPY . .
#
#CMD ["chromium", "tests/test.js"]


# TAGS: https://mcr.microsoft.com/v2/playwright/tags/list
#FROM mcr.microsoft.com/playwright:v1.9.2-focal
#
#WORKDIR /code
#COPY package-lock.json package.json ./
#RUN npm ci
#RUN #npm build
#COPY . .
#CMD ["npm","run", "test:local"]

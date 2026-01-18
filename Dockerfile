FROM floryn90/hugo:ext-alpine

RUN apk add git && \
    git config --global --add safe.directory /src

# A Dockerfile is a recipe that tells Docker how to build a reproducible environment for your project.
FROM ghcr.io/gohugoio/hugo:v0.161.1 AS build
WORKDIR /project
COPY --chown=hugo:hugo . .
USER root
RUN mkdir /output && chown hugo:hugo /output
USER hugo
RUN hugo --baseURL http://localhost/ --destination /output --minify

FROM nginx:1.30-alpine
COPY --from=build /output /usr/share/nginx/html
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1/ || exit 1

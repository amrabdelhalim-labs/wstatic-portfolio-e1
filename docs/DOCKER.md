# Docker preview

This image builds the Hugo site and serves the generated `public/` output with
NGINX. It has no runtime dependencies.

```sh
docker pull ghcr.io/amrabdelhalim-labs/wstatic-portfolio-e1:v1.0.0
docker run --rm -p 8080:80 ghcr.io/amrabdelhalim-labs/wstatic-portfolio-e1:v1.0.0
```

Open `http://localhost:8080`.

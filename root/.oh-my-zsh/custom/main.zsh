# node
alias dnode="ddocker run -it --rm \"node:<DOCKER_NODE_VERSION|lts-alpine>\""
alias dyarn="ddocker run -it --rm \"node:<DOCKER_YARN_VERSION|DOCKER_NODE_VERSION|lts-alpine>\" yarn"
alias dnpm="ddocker run -it --rm \"node:<DOCKER_NPM_VERSION|DOCKER_NODE_VERSION|lts-alpine>\" npm"
alias dnpx="ddocker run -it --rm \"node:<DOCKER_NPM_VERSION|DOCKER_NODE_VERSION|lts-alpine>\" npx"

# rust
alias dcargo="ddocker run -it --rm ghcr.io/mikojs/rust:main cargo"

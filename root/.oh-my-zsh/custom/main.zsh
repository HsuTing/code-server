# dnode
alias dyarn="dnode yarn"
alias dnpm="dnode npm"
alias dnpx="dnode npx"

# dcargo
function dcargo {
  ddocker run -it rust:${DOCKER_RUST_VERSION:=alpine} cargo $@
}

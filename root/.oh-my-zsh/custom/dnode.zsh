_dnode() {
  local parsed_node_version=$(node-parser $1)
  local node_version=${DOCKER_NODE_VERSION:=lts-alpine}

  if [[ $parsed_node_version ]]; then
    node_version=$parsed_node_version
  fi

  if [[ $node_version != lts-alpine ]]; then
    echo "custom node version: $node_version"
  fi

  ddocker run \
    -it \
    --rm \
    node:$node_version $@
}

dnode() {
  _dnode node $@
}

dyarn() {
  _dnode yarn $@
}

dnpm() {
  _dnode npm $@
}

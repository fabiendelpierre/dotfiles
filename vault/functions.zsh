vault_oidc_login() {
  local method=${1:-oidc}
  local role=${2:-oidc}
  vault login -method=$method role=$role -format=json
}

vault_set_env() {
  export VAULT_TOKEN=$(cat ~/.vault-token)
}

vcurl() {
  local method=${1:-GET}
  local endpoint=${2:-"/auth/token/lookup-self"}
  local api_version="/v1"
  local data=$3
  vault_set_env
  https GET ${VAULT_ADDR}${api_version}${endpoint} X-Vault-Token:$VAULT_TOKEN $3
}

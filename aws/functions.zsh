set_env() {
  export AWS_ACCESS_KEY_ID=`grep aws_access ~/.aws/credentials | cut -d '=' -f 2 | tr -d '[:space:]'`
  export AWS_SECRET_ACCESS_KEY=`grep aws_secret ~/.aws/credentials | cut -d '=' -f 2 | tr -d '[:space:]'`
  export AWS_SESSION_TOKEN=`grep aws_session_token ~/.aws/credentials | awk '{print $3}'`
  # export TF_VAR_access_key=$AWS_ACCESS_KEY_ID
  # export TF_VAR_secret_key=$AWS_SECRET_ACCESS_KEY
  # export TF_VAR_token=$AWS_SESSION_TOKEN
}

awslogin() {
  if [[ $1 == "--force" ]]
  then
    saml2aws login --force
  else
    saml2aws login
  fi
  set_env
}

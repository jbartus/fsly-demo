source .env

FASTLY_SID="$(terraform output -raw fastly_sid)"

curl -X PUT https://dashboard.signalsciences.net/api/v0/corps/${SIGSCI_CORP}/sites/${TF_VAR_site_name}/edgeDeployment/${FASTLY_SID}/backends \
-H "content-type:application/json" \
-H "x-api-user: ${SIGSCI_EMAIL}" \
-H "x-api-token: ${SIGSCI_TOKEN}" \
-H "fastly-key: ${FASTLY_KEY}"
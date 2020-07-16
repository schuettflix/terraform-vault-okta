module "okta" {
  source  = "onetwopunch/okta/vault"
  version = "0.1.0"

  okta_discovery_url = "<Okta Authorization Server Issuer>"
  okta_client_id     = "<Okta Vault App Client ID>"
  okta_client_secret = "<Okta Vault App Client Secret>"
  vault_addr         = "https://<Vault Domain>:8200"
  okta_bound_audiences = [
    "api://vault",
    "<Okta Vault App Client ID>"
  ]

  roles = {
    okta_admin = {
      token_policies = ["admin"]
      bound_groups   = ["vault_admins"]
    },
    okta_devs = {
      token_policies = ["devs"]
      bound_groups   = ["vault_devs"]
    }
  }
}

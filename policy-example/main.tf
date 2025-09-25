terraform {
  required_providers {
    keycloak = {
      source  = "terraform.local/keycloak/keycloak"
      version = ">= 5.0.0"
    }
  }
}

provider "keycloak" {
  client_id     = "terraform"
  client_secret = "UO7PcG33jalWJnIAqRvSn9gnxlyDau6n"
  url           = "http://localhost:8080"
}

resource "keycloak_realm" "test" {
  realm             = "policy-test"
  enabled           = true
  display_name      = "foo"
  display_name_html = "<b>foo</b>"

#   account_theme        = "base"
#   access_code_lifespan = "30m"


#   ssl_required    = "external"
#   password_policy = "upperCase(1) and length(8) and forceExpiredPasswordChange(365) and notUsername"

#   attributes = {
#     mycustomAttribute  = "myCustomValue"
#     userProfileEnabled = true
#   }

#   client_profile {
#     name        = "my profile"
#     description = "My profile"
#     executor {
#       name = "secure-ciba-signed-authn-req"
#       configuration = {
#         available-period = "3600"
#       }
#     }
#     executor {
#       name = "pkce-enforcer"
#       configuration = {
#         auto-configure = true
#       }
#     }
#   }
#   client_policy {
#     name        = "my policy23"
#     description = "My policy is <description>"
#     profiles    = ["my profile"]
#     enabled     = false
#     condition {
#         name = "client-attributes"
#         configuration  = {
#             is_negative_logic = false
#             attributes        = jsonencode([{ "key" : "something", "value" : "other3" }])
#         }
#     }
#     condition {
#         name          = "client-roles"
#         configuration = {
#             roles = jsonencode(["role-c", "role-d", "role-e", "role-f", "role-g", "role-a", "role-b"])
#         }
#     }
#   }
#   client_profile {
#     name        = "my second profile"
#     description = "My second profile"
#     executor {
#         name = "intent-client-bind-checker"
#         configuration = {
#             auto-configure = true
#         }
#     }
#     executor {
#         name = "secure-session"
#     }
#   }
}

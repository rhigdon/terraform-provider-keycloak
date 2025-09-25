resource "keycloak_realm_client_policy_profile" "profile" {
  name     = "my-profile"
  realm_id = keycloak_realm.test.id
  executor {
    name = "intent-client-bind-checker"
    configuration = {
      auto-configure = true
    }
  }
  executor {
    name = "secure-session"
  }
}

resource "keycloak_realm_client_policy_profile_policy" "policy" {
  name        = "my-profile-policy"
  realm_id    = keycloak_realm.test.id
  description = "Some desc"
  profiles = [
    keycloak_realm_client_policy_profile.profile.name
  ]

  condition {
    name = "client-type"
    configuration = {
      "protocol" = "openid-connect"
    }
  }

  condition {
    name = "client-attributes"
    configuration = {
      "is-negative-logic" = false
      "attributes"        = jsonencode([{ "key" : "something", "value" : "other3" }])
    }
  }
}

resource "keycloak_realm_client_policy_profile" "list_profile" {
  name     = "my-list-profile"
  realm_id = keycloak_realm.test.id
  executor {
    name = "intent-client-bind-checker"
    configuration = {
      auto-configure = true
    }
  }
  executor {
    name = "secure-session"
  }
}

resource "keycloak_realm_client_policy_profile_policy" "list_policy" {
  name        = "my-list-profile-policy"
  realm_id    = keycloak_realm.test.id
  description = "Some desc2"
  profiles = [
    keycloak_realm_client_policy_profile.list_profile.name
  ]

  condition {
    name          = "client-access-type"
    configuration = {
      access_type = "confidential"
    }
  }

 condition {
    name          = "client-roles"
    configuration = {
      roles = jsonencode(["role-a", "role-b"])
    }
  }
}
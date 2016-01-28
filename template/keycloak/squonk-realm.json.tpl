{
  "clientAuthenticationFlow": "clients",
  "resetCredentialsFlow": "reset credentials",
  "directGrantFlow": "direct grant",
  "registrationFlow": "registration",
  "browserFlow": "browser",
  "requiredActions": [
    {
      "config": {},
      "defaultAction": false,
      "enabled": true,
      "providerId": "VERIFY_EMAIL",
      "name": "Verify Email",
      "alias": "VERIFY_EMAIL"
    },
    {
      "config": {},
      "defaultAction": false,
      "enabled": true,
      "providerId": "UPDATE_PASSWORD",
      "name": "Update Password",
      "alias": "UPDATE_PASSWORD"
    },
    {
      "config": {},
      "defaultAction": false,
      "enabled": true,
      "providerId": "CONFIGURE_TOTP",
      "name": "Configure Totp",
      "alias": "CONFIGURE_TOTP"
    },
    {
      "config": {},
      "defaultAction": false,
      "enabled": false,
      "providerId": "terms_and_conditions",
      "name": "Terms and Conditions",
      "alias": "terms_and_conditions"
    },
    {
      "config": {},
      "defaultAction": false,
      "enabled": true,
      "providerId": "UPDATE_PROFILE",
      "name": "Update Profile",
      "alias": "UPDATE_PROFILE"
    }
  ],
  "authenticatorConfig": [],
  "authenticationFlows": [
    {
      "authenticationExecutions": [
        {
          "priority": 10,
          "userSetupAllowed": false,
          "requirement": "REQUIRED",
          "autheticatorFlow": true,
          "flowAlias": "registration form",
          "authenticator": "registration-page-form"
        }
      ],
      "builtIn": true,
      "topLevel": true,
      "providerId": "basic-flow",
      "description": "registration flow",
      "alias": "registration"
    },
    {
      "authenticationExecutions": [
        {
          "priority": 10,
          "userSetupAllowed": false,
          "requirement": "REQUIRED",
          "autheticatorFlow": false,
          "authenticator": "direct-grant-validate-username"
        },
        {
          "priority": 20,
          "userSetupAllowed": false,
          "requirement": "REQUIRED",
          "autheticatorFlow": false,
          "authenticator": "direct-grant-validate-password"
        },
        {
          "priority": 30,
          "userSetupAllowed": false,
          "requirement": "OPTIONAL",
          "autheticatorFlow": false,
          "authenticator": "direct-grant-validate-otp"
        }
      ],
      "builtIn": true,
      "topLevel": true,
      "providerId": "basic-flow",
      "description": "OpenID Connect Resource Owner Grant",
      "alias": "direct grant"
    },
    {
      "authenticationExecutions": [
        {
          "priority": 10,
          "userSetupAllowed": false,
          "requirement": "REQUIRED",
          "autheticatorFlow": false,
          "authenticator": "reset-credentials-choose-user"
        },
        {
          "priority": 20,
          "userSetupAllowed": false,
          "requirement": "REQUIRED",
          "autheticatorFlow": false,
          "authenticator": "reset-credential-email"
        },
        {
          "priority": 30,
          "userSetupAllowed": false,
          "requirement": "REQUIRED",
          "autheticatorFlow": false,
          "authenticator": "reset-password"
        },
        {
          "priority": 40,
          "userSetupAllowed": false,
          "requirement": "OPTIONAL",
          "autheticatorFlow": false,
          "authenticator": "reset-otp"
        }
      ],
      "builtIn": true,
      "topLevel": true,
      "providerId": "basic-flow",
      "description": "Reset credentials for a user if they forgot their password or something",
      "alias": "reset credentials"
    },
    {
      "authenticationExecutions": [
        {
          "priority": 10,
          "userSetupAllowed": false,
          "requirement": "ALTERNATIVE",
          "autheticatorFlow": false,
          "authenticator": "client-secret"
        },
        {
          "priority": 20,
          "userSetupAllowed": false,
          "requirement": "ALTERNATIVE",
          "autheticatorFlow": false,
          "authenticator": "client-jwt"
        }
      ],
      "builtIn": true,
      "topLevel": true,
      "providerId": "client-flow",
      "description": "Base authentication for clients",
      "alias": "clients"
    },
    {
      "authenticationExecutions": [
        {
          "priority": 10,
          "userSetupAllowed": false,
          "requirement": "ALTERNATIVE",
          "autheticatorFlow": false,
          "authenticator": "auth-cookie"
        },
        {
          "priority": 20,
          "userSetupAllowed": false,
          "requirement": "DISABLED",
          "autheticatorFlow": false,
          "authenticator": "auth-spnego"
        },
        {
          "priority": 30,
          "userSetupAllowed": false,
          "requirement": "ALTERNATIVE",
          "autheticatorFlow": true,
          "flowAlias": "forms"
        }
      ],
      "builtIn": true,
      "topLevel": true,
      "providerId": "basic-flow",
      "description": "browser based authentication",
      "alias": "browser"
    },
    {
      "authenticationExecutions": [
        {
          "priority": 10,
          "userSetupAllowed": false,
          "requirement": "REQUIRED",
          "autheticatorFlow": false,
          "authenticator": "auth-username-password-form"
        },
        {
          "priority": 20,
          "userSetupAllowed": false,
          "requirement": "OPTIONAL",
          "autheticatorFlow": false,
          "authenticator": "auth-otp-form"
        }
      ],
      "builtIn": true,
      "topLevel": false,
      "providerId": "basic-flow",
      "description": "Username, password, otp and other auth forms.",
      "alias": "forms"
    },
    {
      "authenticationExecutions": [
        {
          "priority": 20,
          "userSetupAllowed": false,
          "requirement": "REQUIRED",
          "autheticatorFlow": false,
          "authenticator": "registration-user-creation"
        },
        {
          "priority": 40,
          "userSetupAllowed": false,
          "requirement": "REQUIRED",
          "autheticatorFlow": false,
          "authenticator": "registration-profile-action"
        },
        {
          "priority": 50,
          "userSetupAllowed": false,
          "requirement": "REQUIRED",
          "autheticatorFlow": false,
          "authenticator": "registration-password-action"
        },
        {
          "priority": 60,
          "userSetupAllowed": false,
          "requirement": "DISABLED",
          "autheticatorFlow": false,
          "authenticator": "registration-recaptcha-action"
        }
      ],
      "builtIn": true,
      "topLevel": false,
      "providerId": "form-flow",
      "description": "registration form",
      "alias": "registration form"
    }
  ],
  "supportedLocales": [],
  "internationalizationEnabled": false,
  "identityFederationEnabled": false,
  "adminEventsDetailsEnabled": false,
  "adminEventsEnabled": false,
  "enabledEventTypes": [],
  "eventsListeners": [
    "jboss-logging"
  ],
  "eventsEnabled": false,
  "smtpServer": {},
  "browserSecurityHeaders": {
    "xFrameOptions": "SAMEORIGIN",
    "contentSecurityPolicy": "frame-src 'self'"
  },
  "clients": [
    {
      "protocolMappers": [
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "email",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "email"
          },
          "consentText": "${email}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "email",
          "id": "b3698d23-621b-4bdd-9b29-6c23cc4427ee"
        },
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "firstName",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "given_name"
          },
          "consentText": "${givenName}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "given name",
          "id": "88e1fe7c-4440-441e-805c-5689248b02b2"
        },
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "username",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "preferred_username"
          },
          "consentText": "${username}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "username",
          "id": "1c8e56fd-6633-4319-8f4a-639ab22b5531"
        },
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "lastName",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "family_name"
          },
          "consentText": "${familyName}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "family name",
          "id": "ad2445b3-17a6-4483-a781-076d922d4a4b"
        },
        {
          "config": {
            "attribute.name": "Role",
            "attribute.nameformat": "Basic",
            "single": "false"
          },
          "consentRequired": false,
          "protocolMapper": "saml-role-list-mapper",
          "protocol": "saml",
          "name": "role list",
          "id": "549a622c-afe4-4156-ad4c-30e13476c188"
        },
        {
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true"
          },
          "consentText": "${fullName}",
          "consentRequired": true,
          "protocolMapper": "oidc-full-name-mapper",
          "protocol": "openid-connect",
          "name": "full name",
          "id": "60593698-71a5-48d3-be35-07d341094e60"
        }
      ],
      "nodeReRegistrationTimeout": 0,
      "fullScopeAllowed": false,
      "attributes": {},
      "frontchannelLogout": false,
      "secret": "d0187e88-3f15-4857-856b-aae5c63e0202",
      "clientAuthenticatorType": "client-secret",
      "enabled": true,
      "surrogateAuthRequired": false,
      "baseUrl": "/auth/admin/xwiki/console/index.html",
      "name": "${client_security-admin-console}",
      "clientId": "security-admin-console",
      "id": "40fcbd61-6802-487c-8193-b9d7b4ea0562",
      "redirectUris": [
        "/auth/admin/xwiki/console/*"
      ],
      "webOrigins": [],
      "notBefore": 0,
      "bearerOnly": false,
      "consentRequired": false,
      "serviceAccountsEnabled": false,
      "directGrantsOnly": false,
      "publicClient": true
    },
    {
      "protocolMappers": [
        {
          "config": {
            "attribute.name": "Role",
            "attribute.nameformat": "Basic",
            "single": "false"
          },
          "consentRequired": false,
          "protocolMapper": "saml-role-list-mapper",
          "protocol": "saml",
          "name": "role list",
          "id": "79cace74-b86f-41e5-93be-9ef5559d87b2"
        },
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "lastName",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "family_name"
          },
          "consentText": "${familyName}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "family name",
          "id": "a913e128-16df-4cb9-99a6-44c2fd4518a5"
        },
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "email",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "email"
          },
          "consentText": "${email}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "email",
          "id": "33e638b5-e1c6-476d-ad39-547108372933"
        },
        {
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true"
          },
          "consentText": "${fullName}",
          "consentRequired": true,
          "protocolMapper": "oidc-full-name-mapper",
          "protocol": "openid-connect",
          "name": "full name",
          "id": "bfd2fc42-b6b8-4287-9a90-d6cf1a73e8fa"
        },
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "firstName",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "given_name"
          },
          "consentText": "${givenName}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "given name",
          "id": "bb47bc0d-946d-4126-9f0d-42a2b564ab9e"
        },
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "username",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "preferred_username"
          },
          "consentText": "${username}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "username",
          "id": "f0b8a222-e4ac-42c3-86d1-2e0a749893a4"
        }
      ],
      "nodeReRegistrationTimeout": 0,
      "fullScopeAllowed": false,
      "attributes": {},
      "frontchannelLogout": false,
      "publicClient": false,
      "secret": "50422ae6-e1a8-4035-b650-0632ea71c9e6",
      "clientAuthenticatorType": "client-secret",
      "enabled": true,
      "surrogateAuthRequired": false,
      "baseUrl": "/auth/realms/xwiki/account",
      "name": "${client_account}",
      "clientId": "account",
      "id": "6fde7ede-ba65-4be1-b0a5-724a12b68050",
      "defaultRoles": [
        "view-profile",
        "manage-account"
      ],
      "redirectUris": [
        "/auth/realms/xwiki/account/*"
      ],
      "webOrigins": [],
      "notBefore": 0,
      "bearerOnly": false,
      "consentRequired": false,
      "serviceAccountsEnabled": false,
      "directGrantsOnly": false
    },
    {
      "protocolMappers": [
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "lastName",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "family_name"
          },
          "consentText": "${familyName}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "family name",
          "id": "70862512-bfb6-4a1d-97be-61d97c402d45"
        },
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "username",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "preferred_username"
          },
          "consentText": "${username}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "username",
          "id": "99ec6d1f-a8ea-482a-aec7-384c7440e74e"
        },
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "email",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "email"
          },
          "consentText": "${email}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "email",
          "id": "c3f8b8a1-d192-455d-b5a6-b66e9182be38"
        },
        {
          "config": {
            "attribute.name": "Role",
            "attribute.nameformat": "Basic",
            "single": "false"
          },
          "consentRequired": false,
          "protocolMapper": "saml-role-list-mapper",
          "protocol": "saml",
          "name": "role list",
          "id": "040ec1ea-584f-40e4-aecb-d81aa9e232e1"
        },
        {
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true"
          },
          "consentText": "${fullName}",
          "consentRequired": true,
          "protocolMapper": "oidc-full-name-mapper",
          "protocol": "openid-connect",
          "name": "full name",
          "id": "f796df3c-825b-4f6c-9105-e68b59eed24c"
        },
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "firstName",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "given_name"
          },
          "consentText": "${givenName}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "given name",
          "id": "ff8e3218-17d9-4360-93ae-2683fd190d98"
        }
      ],
      "nodeReRegistrationTimeout": -1,
      "fullScopeAllowed": true,
      "attributes": {
        "saml.authnstatement": "true",
        "saml_force_name_id_format": "false",
        "saml.client.signature": "false",
        "saml_name_id_format": "username",
        "saml.signature.algorithm": "RSA_SHA256",
        "saml.multivalued.roles": "false",
        "saml_signature_canonicalization_method": "http://www.w3.org/2001/10/xml-exc-c14n#",
        "saml.encrypt": "false",
        "saml.server.signature": "false",
        "saml.assertion.signature": "false",
        "saml.force.post.binding": "false"
      },
      "protocol": "openid-connect",
      "redirectUris": [
        "http://{{fqdn}}/*",
        "https://{{fqdn}}/*"
      ],
      "secret": "fa007a05-a152-426c-ae75-6cbed2c43319",
      "clientAuthenticatorType": "client-secret",
      "enabled": true,
      "surrogateAuthRequired": false,
      "name": "XWiki",
      "clientId": "xwiki",
      "id": "955917a7-5bb1-46df-84a1-3d63c5a57590",
      "webOrigins": [
        "http://{{fqdn}}",
        "https://{{fqdn}}"
      ],
      "notBefore": 0,
      "bearerOnly": false,
      "consentRequired": false,
      "serviceAccountsEnabled": false,
      "directGrantsOnly": false,
      "publicClient": false,
      "frontchannelLogout": false
    },
    {
      "protocolMappers": [
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "email",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "email"
          },
          "consentText": "${email}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "email",
          "id": "c713eece-8c94-4175-a6fb-294b9c747d2e"
        },
        {
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true"
          },
          "consentText": "${fullName}",
          "consentRequired": true,
          "protocolMapper": "oidc-full-name-mapper",
          "protocol": "openid-connect",
          "name": "full name",
          "id": "6d5de700-6610-4e86-bd8a-c3269c0af55f"
        },
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "lastName",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "family_name"
          },
          "consentText": "${familyName}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "family name",
          "id": "80903449-4d8e-471a-bfdc-35580cff9ed8"
        },
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "username",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "preferred_username"
          },
          "consentText": "${username}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "username",
          "id": "1ab95fda-a7ad-409d-a890-578c9c025742"
        },
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "firstName",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "given_name"
          },
          "consentText": "${givenName}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "given name",
          "id": "c770bf93-9fb5-43a4-93dd-b714faeb7f97"
        },
        {
          "config": {
            "attribute.name": "Role",
            "attribute.nameformat": "Basic",
            "single": "false"
          },
          "consentRequired": false,
          "protocolMapper": "saml-role-list-mapper",
          "protocol": "saml",
          "name": "role list",
          "id": "0cc30775-2710-459f-bd3a-aac293675a80"
        }
      ],
      "nodeReRegistrationTimeout": 0,
      "fullScopeAllowed": false,
      "attributes": {},
      "redirectUris": [],
      "secret": "711b7129-0687-4f14-9f04-cde944e9726e",
      "clientAuthenticatorType": "client-secret",
      "enabled": true,
      "surrogateAuthRequired": false,
      "name": "${client_realm-management}",
      "clientId": "realm-management",
      "id": "1a92e238-3e6b-4782-8507-1a1940742560",
      "webOrigins": [],
      "notBefore": 0,
      "bearerOnly": true,
      "consentRequired": false,
      "serviceAccountsEnabled": false,
      "directGrantsOnly": false,
      "publicClient": false,
      "frontchannelLogout": false
    },
    {
      "protocolMappers": [
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "username",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "preferred_username"
          },
          "consentText": "${username}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "username",
          "id": "9cc59458-e217-4ae2-9a1c-ed56455673ea"
        },
        {
          "config": {
            "attribute.name": "Role",
            "attribute.nameformat": "Basic",
            "single": "false"
          },
          "consentRequired": false,
          "protocolMapper": "saml-role-list-mapper",
          "protocol": "saml",
          "name": "role list",
          "id": "8ed72bf0-762f-40fa-b38c-47e9a92da0a1"
        },
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "firstName",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "given_name"
          },
          "consentText": "${givenName}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "given name",
          "id": "59e68a2a-f7fc-472d-b58e-4d41f045621f"
        },
        {
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true"
          },
          "consentText": "${fullName}",
          "consentRequired": true,
          "protocolMapper": "oidc-full-name-mapper",
          "protocol": "openid-connect",
          "name": "full name",
          "id": "c66c0407-c0e1-4314-87f2-efaa2a371b8c"
        },
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "lastName",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "family_name"
          },
          "consentText": "${familyName}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "family name",
          "id": "9241ba29-0218-4664-967d-cfbf56333731"
        },
        {
          "config": {
            "id.token.claim": "true",
            "user.attribute": "email",
            "access.token.claim": "true",
            "Claim JSON Type": "String",
            "claim.name": "email"
          },
          "consentText": "${email}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "email",
          "id": "1f05e449-15e4-47ed-908a-9b9560fa360a"
        }
      ],
      "nodeReRegistrationTimeout": 0,
      "fullScopeAllowed": false,
      "attributes": {},
      "redirectUris": [],
      "secret": "31759755-1ab3-4f1f-9fa0-829ddd89012e",
      "clientAuthenticatorType": "client-secret",
      "enabled": true,
      "surrogateAuthRequired": false,
      "name": "${client_broker}",
      "clientId": "broker",
      "id": "06ad1123-772b-420a-a011-a03d1f7b11a5",
      "webOrigins": [],
      "notBefore": 0,
      "bearerOnly": false,
      "consentRequired": false,
      "serviceAccountsEnabled": false,
      "directGrantsOnly": false,
      "publicClient": false,
      "frontchannelLogout": false
    },
    {
      "protocolMappers": [
        {
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true"
          },
          "consentText": "${fullName}",
          "consentRequired": true,
          "protocolMapper": "oidc-full-name-mapper",
          "protocol": "openid-connect",
          "name": "full name",
          "id": "b6623abd-52df-4d3e-b962-e8df732a576d"
        },
        {
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true",
            "user.attribute": "firstName",
            "jsonType.label": "String",
            "claim.name": "given_name"
          },
          "consentText": "${givenName}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "given name",
          "id": "5cdb7d73-5e0a-4636-a509-a628723244a6"
        },
        {
          "config": {
            "attribute.name": "Role",
            "single": "false",
            "attribute.nameformat": "Basic"
          },
          "consentRequired": false,
          "protocolMapper": "saml-role-list-mapper",
          "protocol": "saml",
          "name": "role list",
          "id": "14faeb4d-78b6-4457-ade5-008581a9c742"
        },
        {
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true",
            "user.attribute": "lastName",
            "jsonType.label": "String",
            "claim.name": "family_name"
          },
          "consentText": "${familyName}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "family name",
          "id": "56986992-eb37-4c27-948a-d878b98fb8a5"
        },
        {
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true",
            "user.attribute": "username",
            "jsonType.label": "String",
            "claim.name": "preferred_username"
          },
          "consentText": "${username}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "username",
          "id": "e75ca674-ba65-4e71-bbf5-0cd8cd50c9f9"
        },
        {
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true",
            "user.attribute": "email",
            "jsonType.label": "String",
            "claim.name": "email"
          },
          "consentText": "${email}",
          "consentRequired": true,
          "protocolMapper": "oidc-usermodel-property-mapper",
          "protocol": "openid-connect",
          "name": "email",
          "id": "1d1460ce-565c-44a3-a3c4-f8408ba654aa"
        }
      ],
      "nodeReRegistrationTimeout": -1,
      "fullScopeAllowed": true,
      "attributes": {
        "saml.authnstatement": "true",
        "saml_force_name_id_format": "false",
        "saml.client.signature": "false",
        "saml_name_id_format": "username",
        "saml.signature.algorithm": "RSA_SHA256",
        "saml.multivalued.roles": "false",
        "saml_signature_canonicalization_method": "http://www.w3.org/2001/10/xml-exc-c14n#",
        "saml.encrypt": "false",
        "saml.server.signature": "false",
        "saml.assertion.signature": "false",
        "saml.force.post.binding": "false"
      },
      "webOrigins": [
        "http://{{fqdn}}"
      ],
      "redirectUris": [
        "http://{{fqdn}}/sampleapp/*"
      ],
      "secret": "434ecd6b-586d-4db8-a3fa-83bfeb16bf44",
      "clientAuthenticatorType": "client-secret",
      "enabled": true,
      "surrogateAuthRequired": false,
      "clientId": "sampleapp",
      "id": "201a4a6c-03a0-42ab-a85a-3174ae545920",
      "notBefore": 0,
      "bearerOnly": false,
      "consentRequired": false,
      "serviceAccountsEnabled": false,
      "directGrantsOnly": false,
      "publicClient": false,
      "frontchannelLogout": false,
      "protocol": "openid-connect"
    }
  ],
  "clientScopeMappings": {
    "realm-management": [
      {
        "roles": [
          "realm-admin"
        ],
        "client": "security-admin-console"
      }
    ]
  },
  "users": [
    {
      "clientRoles": {
        "account": [
          "view-profile",
          "manage-account"
        ]
      },
      "realmRoles": [
        "admin-user"
      ],
      "id": "98c24379-c79b-4011-b4ed-7791dd0166e9",
      "createdTimestamp": 1445362547023,
      "username": "admin",
      "enabled": true,
      "totp": false,
      "emailVerified": false,
      "credentials": [
        {
          "temporary": false,
          "digits": 0,
          "counter": 0,
          "hashIterations": 1,
          "salt": "HX/aFv/FvlX2rC0MKysqkQ==",
          "hashedSaltedValue": "6wZjHjH0+Chy4WciB2mDIHNOAtWoJMewYYXfUoEGP+hnZrbS79N7O53oasWiuLjbxcwUGaXLMpSqffTL+oqHxw==",
          "type": "password"
        }
      ],
      "requiredActions": []
    },
    {
      "clientRoles": {
        "account": [
          "view-profile",
          "manage-account"
        ]
      },
      "realmRoles": [
        "XWiki.XWikiAllGroup",
        "standard-user"
      ],
      "id": "4c09d169-e68d-4de2-845a-616d91ee9716",
      "createdTimestamp": 1445362574025,
      "username": "user1",
      "enabled": true,
      "totp": false,
      "emailVerified": false,
      "credentials": [
        {
          "temporary": false,
          "digits": 0,
          "counter": 0,
          "hashIterations": 1,
          "salt": "4h7J+oQJFcXnKTPX3fuv2A==",
          "hashedSaltedValue": "hkb5JZAbOZIKfEjjrAg1hJ1Wwv5DC568ZiYgITU/q0LdNLpOrcmRwCJeV3T5bXIa2UcWTNVupC8iS5BneO5c+Q==",
          "type": "password"
        }
      ],
      "requiredActions": []
    },
    {
      "clientRoles": {
        "account": [
          "view-profile",
          "manage-account"
        ]
      },
      "realmRoles": [
        "XWiki.XWikiAllGroup",
        "standard-user"
      ],
      "id": "727170dc-ebfa-4c2c-88f5-928773b31ab9",
      "createdTimestamp": 1445362599823,
      "username": "user2",
      "enabled": true,
      "totp": false,
      "emailVerified": false,
      "credentials": [
        {
          "temporary": false,
          "digits": 0,
          "counter": 0,
          "hashIterations": 1,
          "salt": "wnWIitHecRqmoKJFQ2pmig==",
          "hashedSaltedValue": "17hSqScaITpnwvVbKZLsEZlELIhdfOoGbzOUAgoDhxbMEbzcAM4cZ2tw2+OtKGBTwOJWEvpZyeG9FMWvX25oTQ==",
          "type": "password"
        }
      ],
      "requiredActions": []
    }
  ],
  "otpPolicyPeriod": 30,
  "otpPolicyLookAheadWindow": 1,
  "otpPolicyDigits": 6,
  "otpPolicyInitialCounter": 0,
  "otpPolicyAlgorithm": "HmacSHA1",
  "otpPolicyType": "totp",
  "requiredCredentials": [
    "password"
  ],
  "rememberMe": false,
  "registrationEmailAsUsername": false,
  "registrationAllowed": false,
  "sslRequired": "external",
  "enabled": true,
  "accessCodeLifespanLogin": 1800,
  "accessCodeLifespanUserAction": 300,
  "accessCodeLifespan": 60,
  "id": "71b2ae4c-8412-4c34-89a7-c4bfcedf9f77",
  "realm": "squonk",
  "notBefore": 1449679367,
  "revokeRefreshToken": false,
  "accessTokenLifespan": 300,
  "ssoSessionIdleTimeout": 1800,
  "ssoSessionMaxLifespan": 36000,
  "offlineSessionIdleTimeout": 2592000,
  "verifyEmail": false,
  "resetPasswordAllowed": false,
  "editUsernameAllowed": false,
  "bruteForceProtected": false,
  "maxFailureWaitSeconds": 900,
  "minimumQuickLoginWaitSeconds": 60,
  "waitIncrementSeconds": 60,
  "quickLoginCheckMilliSeconds": 1000,
  "maxDeltaTimeSeconds": 43200,
  "failureFactor": 30,
  "privateKey": "MIIEowIBAAKCAQEAjSZraYYf/0NBuEr8HlbLfoJxerquD0l1Q3ZZP3CiLAU4+qYfR4bph2LsWbxXpWCIaKfLn2bPAy942l6AI3ZOw2dCUBobT1TpPAr7rVYciM9IGsTAyOgac5FYBW7JE4+A4BYJcZCtARRn4BsZ+dZYXQGnEtvCY0LfBIs1BrJqF2oY38xxfytYHP3ZvV1+ngf1mQ/R5XzrXknJGkIB0ZkwmyyCmfn9L96ntO4RXGJrAsx1vybpuCuz5yzuTANbuF2gfQGFEYrshFS7oW6JtNNsUyhwcs7JaCXdKVjpFOcdWgLskc3FajKVKfpekidr0QE16lHUfn9NCVyKAFwEo1fBSwIDAQABAoIBAHuXvYvLtq7EDIK7neFO7KZcv9LQLWMTVkt5EJK9JDNZa1gGJ/NwjYFPvFai1Tfou+ivrFtqIS/P3ImRH7BtgnAVNXqAMZOYbRV3JILVmOyuW5uc1pXUrnytMp6nMAghqp4Mjb5UCTidzorsECW0avEdZlbb+G0D+9W1svunM8BFiI8psHIRr6VQQeCA648wqtAQHk2qqoRLgqDGD0Y/W18QZqzAgHlFK4sfvD+FB7ALvSO88spYCtx8Nj+C5obFKwyHFOXzY1/r4GtH4+4Nda/C8ub0HMvrJbHqglPKDTIUpgRHS6zY8vtS7DTdDd5hJkplt3oCYfCV7X3AploVptkCgYEAwKfCnfWa7tGGuQ3ZdiqLj0dcEEYhsmwxvd/PaszTDLf7aozZ0UTOWcz6G0Xfp7+i85i1ddEItiTUqh0ee4g8pMhcgI3Ua2RwMYJec7fXxYQdHSNpiGeVvNSR8iuV6td5HM78FBhIY4kXA8C2FSfG/M7IPTZT/Gn+3sWNRb5CNz8CgYEAu49Ya1BYcriY+kWtWfWVeJWGRz4AgVcsXnQIaB0CIDNirP0eU/9qs0mhw5CcGKyVuY8vUtTbGYpe/9O40n5wtnY83M5fXmp2mm0Kmi3+zoeFZ6Kk21xGQt09wOQBvH/8vgq3mrgsekNIBqSF1YBfZPd0whilUTUCbiCkhDggnvUCgYEAmNT86P5r+ESzkZ5RAxLhP7qmaCqalMaL90rTarAuRQq3ImG2cfMZl9eqGXSm5pZ6GLDuUxaOyKATLRiIlAsRwM9JwpnBB6jX8A6yCy6ut3wE9JahI5q5COHBHdJBzdk9tQLmqrJQytV4Mnvwdnvluav44cZ1fepATE1/svIp6VUCgYB+wBuPwidTt95h266PycAuUlYBVSxAPCoW1rFLsrbaDf/USeYx+70e1lbEc7iZkCBK2zGu93vtoa4bkvgnAB2poPP2gFzA0I/AQopUsVquNbV42NgyCgTNcPgnn65wtcmWoGV94JLmOQu2uX5cTzmoYPZ9qOwnmfw/cj3bwJaC9QKBgAbitLAQw5RbWu8vbn+qInU7IXFjoZEjd1mEUXRGUBq6Q4d/0L9uumuUpcqdB2TKLuHEm3vqlRTTc2HGbbD7P8Kdf3XaViAbPMEU3zFndbEjqqYEbtIaN2kFKge/3pUHbkrpKJ2dNoxUvBFCLvMYiQYeasvEI/L4n7xszeuZ3NC3",
  "publicKey": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjSZraYYf/0NBuEr8HlbLfoJxerquD0l1Q3ZZP3CiLAU4+qYfR4bph2LsWbxXpWCIaKfLn2bPAy942l6AI3ZOw2dCUBobT1TpPAr7rVYciM9IGsTAyOgac5FYBW7JE4+A4BYJcZCtARRn4BsZ+dZYXQGnEtvCY0LfBIs1BrJqF2oY38xxfytYHP3ZvV1+ngf1mQ/R5XzrXknJGkIB0ZkwmyyCmfn9L96ntO4RXGJrAsx1vybpuCuz5yzuTANbuF2gfQGFEYrshFS7oW6JtNNsUyhwcs7JaCXdKVjpFOcdWgLskc3FajKVKfpekidr0QE16lHUfn9NCVyKAFwEo1fBSwIDAQAB",
  "certificate": "MIICmTCCAYECBgFQhk6X9zANBgkqhkiG9w0BAQsFADAQMQ4wDAYDVQQDDAV4d2lraTAeFw0xNTEwMjAxNzMwMDlaFw0yNTEwMjAxNzMxNDlaMBAxDjAMBgNVBAMMBXh3aWtpMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjSZraYYf/0NBuEr8HlbLfoJxerquD0l1Q3ZZP3CiLAU4+qYfR4bph2LsWbxXpWCIaKfLn2bPAy942l6AI3ZOw2dCUBobT1TpPAr7rVYciM9IGsTAyOgac5FYBW7JE4+A4BYJcZCtARRn4BsZ+dZYXQGnEtvCY0LfBIs1BrJqF2oY38xxfytYHP3ZvV1+ngf1mQ/R5XzrXknJGkIB0ZkwmyyCmfn9L96ntO4RXGJrAsx1vybpuCuz5yzuTANbuF2gfQGFEYrshFS7oW6JtNNsUyhwcs7JaCXdKVjpFOcdWgLskc3FajKVKfpekidr0QE16lHUfn9NCVyKAFwEo1fBSwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBbuRp0T//EcAwbJCW1VVfX44Ibcang5iM3ecL6T2VKqP1SVJjB91DjVEPTV00kxbwDnGm6WUbzT5w3sECMY+6fZT6lTfbSxddp0AOYv0Yvhx44/PvYtzZiL3DHTap4fyAU0A5UAjawd5kVjMFg9DqZgYnBlj1Ng63SX6Lh/rUB7Fu347chgboo8Loin8QIvw4P8C1qjDnML5JDHygy0ohv1kej2TXF3pZfoC76oVwO6AUfCuq0vPXPyvtCKaKFxy4555rJ/4yxz9Lohi3pi5W+clU4XBRTjC56YKuF83sIZJSjJ/1ejEqptY4kquHG5DhFsw049MoV4YmsVQG4l2Qa",
  "codeSecret": "c03cf497-acb4-4f4a-a9dc-01867eae670e",
  "roles": {
    "client": {
      "realm-management": [
        {
          "composites": {
            "client": {
              "realm-management": [
                "manage-realm",
                "view-identity-providers",
                "view-clients",
                "impersonation",
                "manage-identity-providers",
                "manage-users",
                "view-realm",
                "manage-events",
                "view-events",
                "view-users",
                "manage-clients"
              ]
            }
          },
          "composite": true,
          "scopeParamRequired": false,
          "description": "${role_realm-admin}",
          "name": "realm-admin",
          "id": "9e0873ef-9f95-4401-994a-012a452c2dde"
        },
        {
          "composite": false,
          "scopeParamRequired": false,
          "description": "${role_manage-realm}",
          "name": "manage-realm",
          "id": "d5cfc725-aad4-4521-8faf-b130c74f63f5"
        },
        {
          "composite": false,
          "scopeParamRequired": false,
          "description": "${role_view-identity-providers}",
          "name": "view-identity-providers",
          "id": "41084204-be7f-4a5b-8249-7a91dc59e810"
        },
        {
          "composite": false,
          "scopeParamRequired": false,
          "description": "${role_view-clients}",
          "name": "view-clients",
          "id": "acf4999f-015a-4ee8-ad72-a17613b19fa2"
        },
        {
          "composite": false,
          "scopeParamRequired": false,
          "description": "${role_impersonation}",
          "name": "impersonation",
          "id": "6aedfeb1-e4e9-49e6-a85d-ee7180e8e737"
        },
        {
          "composite": false,
          "scopeParamRequired": false,
          "description": "${role_manage-identity-providers}",
          "name": "manage-identity-providers",
          "id": "833a3dc3-a6b0-4805-a5a0-974cc657ab32"
        },
        {
          "composite": false,
          "scopeParamRequired": false,
          "description": "${role_manage-users}",
          "name": "manage-users",
          "id": "6548145d-8fbe-459f-a5e9-f4f4ed2ca70f"
        },
        {
          "composite": false,
          "scopeParamRequired": false,
          "description": "${role_view-realm}",
          "name": "view-realm",
          "id": "0f34c089-aa2e-4097-968b-75aaa164a460"
        },
        {
          "composite": false,
          "scopeParamRequired": false,
          "description": "${role_manage-events}",
          "name": "manage-events",
          "id": "07e8c1db-714f-4428-991e-3821f44dd8a8"
        },
        {
          "composite": false,
          "scopeParamRequired": false,
          "description": "${role_view-events}",
          "name": "view-events",
          "id": "a411a7c7-4e28-4843-8739-86930ce2d5a3"
        },
        {
          "composite": false,
          "scopeParamRequired": false,
          "description": "${role_view-users}",
          "name": "view-users",
          "id": "24a780b0-aa6e-4b52-a9b2-98f67db11aeb"
        },
        {
          "composite": false,
          "scopeParamRequired": false,
          "description": "${role_manage-clients}",
          "name": "manage-clients",
          "id": "33b4dd26-a853-48a3-8873-062dc3fd37ad"
        }
      ],
      "broker": [
        {
          "composite": false,
          "scopeParamRequired": false,
          "description": "${role_read-token}",
          "name": "read-token",
          "id": "16c3dbe6-a0e1-4f1c-bb7e-0960d2c9aa89"
        }
      ],
      "sampleapp": [],
      "xwiki": [],
      "account": [
        {
          "composite": false,
          "scopeParamRequired": false,
          "description": "${role_view-profile}",
          "name": "view-profile",
          "id": "6234a170-56ee-4a70-b0bc-4641ee3a13c6"
        },
        {
          "composite": false,
          "scopeParamRequired": false,
          "description": "${role_manage-account}",
          "name": "manage-account",
          "id": "a3f1a156-e45c-4003-8471-ba9d9a8d2565"
        }
      ],
      "security-admin-console": []
    },
    "realm": [
      {
        "composite": false,
        "scopeParamRequired": false,
        "name": "admin-user",
        "id": "b98acf80-2d80-4b2b-a3be-11a564ba8e3a"
      },
      {
        "composite": false,
        "scopeParamRequired": false,
        "name": "XWiki.XWikiAllGroup",
        "id": "dccb5e84-be9d-4ac5-8cbe-7b22d5938419"
      },
      {
        "composite": false,
        "scopeParamRequired": false,
        "name": "standard-user",
        "id": "3253e0ad-33a9-4560-ae4f-50e8cb9e0e9f"
      },
      {
        "composite": false,
        "scopeParamRequired": true,
        "description": "${role_offline-access}",
        "name": "offline_access",
        "id": "b8b78505-204e-4016-ab46-c7899ee4e362"
      }
    ]
  },
  "defaultRoles": [
    "offline_access"
  ]
}

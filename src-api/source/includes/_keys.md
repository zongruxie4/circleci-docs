# Keys

## List Checkout Keys

```sh
curl https://circleci.com/api/v1.1/project/:vcs-type/:username/:project/checkout-key?digest=sha256 -H "Circle-Token: <circle-token>"
```

```json
[{"public_key": "ssh-rsa...",
  "type": "deploy-key", // can be "deploy-key" or "github-user-key"
  "fingerprint": "AddwN379YO1pnTyrOqALUZmo6XU4zJ2RLuOZslrl7c4",
  "preferred": true,
  "time" : "2015-09-21T17:29:21.042Z" // when the key was issued
  }]
```

**`GET` Request**: Returns an array of checkout keys for `:project.`

Parameter | Description
------- | -------------
digest | Fingerprint digest. Optional; 'md5' by default. Pass 'sha256' to return SHA-256 key fingerprint.

## New Checkout Key

```sh
curl -X POST --header "Content-Type: application/json" -d '{"type":"github-user-key"}' https://circleci.com/api/v1.1/project/:vcs-type/:username/:project/checkout-key -H "Circle-Token: <circle-token>"
```

```json
{"public_key": "ssh-rsa...",
  "type": "deploy-key", // can be "deploy-key" or "user-key"
  "fingerprint": "c9:0b:1c:4f:d5:65:56:b9:ad:88:f9:81:2b:37:74:2f",
  "preferred": true,
  "time" : "2015-09-21T17:29:21.042Z" // when the key was issued
  }
```

**`POST` Request**: Creates a new checkout key. This API request is only usable with a user API token. Organizations using GitHub OAuth with SAML SSO may require [an additional authorization step](https://docs.github.com/en/enterprise-cloud@latest/authentication/authenticating-with-saml-single-sign-on/authorizing-an-ssh-key-for-use-with-saml-single-sign-on#authorizing-an-ssh-key) to use the key.

Parameter | Description
------- | -------------
type | The type of key to create. Can be 'deploy-key' or 'github-user-key'.


## Get Checkout Key

```sh
curl https://circleci.com/api/v1.1/project/:vcs-type/:username/:project/checkout-key/:fingerprint -H "Circle-Token: <circle-token>"
```

```json
{"public_key": "ssh-rsa...",
  "type": "deploy-key", // can be "deploy-key" or "user-key"
  "fingerprint": "c9:0b:1c:4f:d5:65:56:b9:ad:88:f9:81:2b:37:74:2f",
  "preferred": true,
  "time" : "2015-09-21T17:29:21.042Z" // when the key was issued
  }
```

**`GET` Request**: Returns an individual checkout key. Supply fingerprint as a path parameter. Fingerprint can be of type md5 or sha256. sha256 fingerprints should be URL-encoded.

## Delete Checkout Key

**`DELETE` Request:** Deletes a checkout key by fingerprint. Supply fingerprint as a path parameter. Fingerprint can be of type md5 or sha256. sha256 fingerprints should be URL-encoded.

```sh
curl -X DELETE https://circleci.com/api/v1.1/project/:vcs-type/:username/:project/checkout-key/:fingerprint -H "Circle-Token: <circle-token>"
```

```json
{"message":"ok"}
```

## Create SSH Keys

**`POST` Request:** Creates an SSH key that will be used to access the external system identified by the hostname parameter for SSH key-based authentication.

```sh
curl -X POST --header "Content-Type: application/json" -d '{"hostname":"hostname","private_key":"RSA private key"}' https://circleci.com/api/v1.1/project/:vcs-type/:username/:project/ssh-key -H "Circle-Token: <circle-token>"
```

```
# no response expected
```

## Delete SSH Key

```sh
curl -X DELETE --header "Content-Type: application/json" -d {"fingerprint":"Fingerprint", "hostname":"Hostname"} https://circleci.com/api/v1.1/project/:vcs-type/:username/:project/ssh-key -H "Circle-Token: <circle-token>"
```

```
# no response expected
```

**`DELETE` Request:** Deletes an SSH key from the system by fingerprint. Supply `fingerprint` in request body. Fingerprint can be of type md5 or sha256.


## Heroku Keys

**`POST` Request:** Adds your Heroku API key to CircleCI and then takes `apikey` as form param name.

```sh
curl -X POST --header "Content-Type: application/json" -d '{"apikey":"Heroku key"}' https://circleci.com/user/heroku-key -H "Circle-Token: <circle-token>"
```

```
# no response expected
```

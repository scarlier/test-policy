package system.authz

default allow := {
  "allowed": false,
  "reason": "unauthorized resources access"
}

jwks_url := "https://cognito-idp.eu-west-1.amazonaws.com/eu-west-1_14x2XeBeu/.well-known/jwks.json"

allow := { "allowed": true } {
  jwks := http.send({
          	"url": jwks_url,
          	"method": "GET",
          	"force_cache": true,
          	"force_cache_duration_seconds": 3600
          }).body

  [valid, header, payload] := io.jwt.decode_verify(input.identity, {
		"cert": json.marshal(jwks)
	})
	valid
}

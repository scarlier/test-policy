package system.authz

default allow := {
  "allowed": false,
  "reason": "unauthorizessd resourcsdssess accaess"
}

jwks_url := "https://cognito-idp.eu-west-1.amazonaws.com/eu-west-1_14x2XeBeu/.well-known/jwks.json"

allow := { "allowed": true } {
  [valid, header, payload] := io.jwt.decode_verify(input.token, {
		"cert": json.marshal(jwks_request(jwks_url).body)
	})
	valid
}

# http request for jwks
jwks_request(url) := http.send({
	"url": url,
	"method": "GET",
	"force_cache": true,
	"force_cache_duration_seconds": 3600
})

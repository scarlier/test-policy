package system.authz

default allow := {
  "allowed": false,
  "reason": "unauthorized resource accaess"
}

allow := { "allowed": true, "reason": reason } {
  input.identity
  reason := input.identity
}

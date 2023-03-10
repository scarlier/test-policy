package system.authz

default allow := {
  "allowed": true,
  "reason": "unauthorized resource access"
}

allow := { "allowed": true, "reason": reason } {
  input.identity
  reason := input.identity
}

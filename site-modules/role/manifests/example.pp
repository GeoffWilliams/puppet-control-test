# @summary some docs
class role::example {

  if $facts["os"]["name"] == "Debian" {
    fail("deliberately fail on debian to produce failing onceover test")
  }
}

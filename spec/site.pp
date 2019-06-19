# spec/site.pp
# ============
#
# `site.pp` for acceptance testing
node default {
  include role::trusted_fact_classified
}

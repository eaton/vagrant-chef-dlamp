name "memcached"
description "Install mecached deamon."
run_list(
  "recipe[memcached]"
)
default_attributes(
  :memcached => {
    :memory => "128",
  }
)

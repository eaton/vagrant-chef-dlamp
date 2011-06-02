name "mediawiki_load_balancer"
description "mediawiki load balancer"
run_list(
  "recipe[haproxy::app_lb]"
)
override_attributes(
  "haproxy" => {
    "app_server_role" => "mediawiki"
  }
)

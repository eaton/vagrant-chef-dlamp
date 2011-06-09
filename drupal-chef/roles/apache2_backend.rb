name "apache2_backend"
description "Override apache2 config to non-standard port to handle requests from a reverse proxy."
override_attributes(
  :apache => {
    :listen_ports => [ "8080", "443" ],
	  :default_port => "8080"
  }
)

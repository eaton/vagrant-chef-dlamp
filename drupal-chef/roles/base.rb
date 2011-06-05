name "base"
description "Base role applied to all nodes."
run_list(
  "recipe[drupal]"
)
override_attributes(
  :php5 => {
    :resource_limits => {
      :max_execution_time => "60",
      :memory_limit => "256M",
    }
  },
  :mysql => {
    :server_root_password => "root",
    :bind_address => "127.0.0.1",
    :tunable => {
      :key_buffer => "384M",
      :table_cache => "4096",
    }
  },
  :apache => {
    :listen_ports => [ "8080", "443" ],
    :keepaliverequests => 10,
    :prefork => {
      :startservers => 2,
      :minspareservers => 1,
      :maxspareservers => 3,
      :serverlimit => 40,
      :maxclients => 40,
      :maxrequestsperchild => 1000
    },
    :worker => {
      :startservers => 2,
      :maxclients => 128,
      :minsparethreads => 16,
      :maxsparethreads => 128,
      :threadsperchild => 16,
      :maxrequestsperchild => 0
    }
  },
  :hosts => {
    :localhost_aliases => ["drupal.vbox.local", "dev-site.vbox.local"]
    # :entries => {
    #   # "pub.lic.ip" => "name"
    # }
  }
)

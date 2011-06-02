name "mediawiki_database_master"
description "database master for the mediawiki application."
run_list(
  "recipe[database::master]"
)
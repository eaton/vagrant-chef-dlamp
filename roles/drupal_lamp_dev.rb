name "drupal_lamp_dev"
description "A LAMP + Memcached stack for Drupal with development tools."
run_list(
  "role[apache2_mod_php]",
  "role[drupal]",
  "role[drupal_dev]",
  "role[memcached]",
  "role[mysql_server]",
  "recipe[drupal::multisite]"
)
# TODO Add recipe to create dev sites via Drush make.

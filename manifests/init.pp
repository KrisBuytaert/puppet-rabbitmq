# = Class: rabbitmq::service
#
# Installs and runs the rabbitmq messaging server: http://www.rabbitmq.com/.
#
# == Usage:
#
#   include rabbitmq
#
class rabbitmq (
  $plugins=$rabbitmq::params::plugins
)
{
  require rabbitmq::params
  include rabbitmq::package
  include rabbitmq::config
  include rabbitmq::service

}

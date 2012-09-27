# = Class: rabbitmq::service
#
# Installs and runs the rabbitmq messaging server: http://www.rabbitmq.com/.
#
# == Usage:
#
#   include rabbitmq
#
class rabbitmq {

  include rabbitmq::package
  include rabbitmq::config
  include rabbitmq::service

}

# = Class: rabbitmq::package
#
#
# == Usage:
#
#   include rabbitmq::package
#
class rabbitmq::package {

  # Ensure rabbitmq is installed:
  package { 'rabbitmq-server': ensure => 'present', }

}

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

  $enable = $::operatingsystem ? {
    'Debian'  => undef,
    'Ubuntu'  => undef,
    default   => true
  }
}

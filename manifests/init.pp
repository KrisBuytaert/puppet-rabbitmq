# = Class: rabbitmq
#
# Installs and runs the rabbitmq messaging server: http://www.rabbitmq.com/.
#
# == Usage:
#
#   include rabbitmq
#
class rabbitmq {

  # Ensure rabbitmq is installed:
  package { 'rabbitmq-server': ensure => 'present', }

  $enable = $::operatingsystem ? {
    'Debian'  => undef,
    'Ubuntu'  => undef,
    default   => true
  }
  # Ensure rabbitmq is running:
  service { 'rabbitmq-server':
    ensure      => 'running',
    enable      => $enable,
    hasrestart  => true,
    hasstatus   => true,
    require     => Package['rabbitmq-server'],
  }
}

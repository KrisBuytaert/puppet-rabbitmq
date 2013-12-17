# = Class: rabbitmq::service
#
# Installs and runs the rabbitmq messaging server: http://www.rabbitmq.com/.
#
# == Usage:
#
#   include rabbitmq
#
class rabbitmq::service {

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

# Class: rabbitmq::stomp
#
#Enables Stomp
#
# Usage:
# include rabbitmq::stomp
#

# Ugly hack using static files .. There most probably is a better approach to this 
class rabbitmq::stomp {


  file { '/etc/rabbitmq/enabled_plugins':
    ensure => 'present',
    group  => 'root',
    owner  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/rabbitmq/enabled_plugins',
  }

  file { '/etc/rabbitmq/rabbitmq.config':
    ensure => 'present',
    mode   => '0644',
    group  => 'root',
    owner  => 'root',
    source => 'puppet:///modules/rabbitmq/rabbitmq.config',
    require => Package['rabbitmq-server'],
  }


}

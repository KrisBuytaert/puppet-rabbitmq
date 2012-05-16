# Class: rabbitmq::stomp
#
#Enables Stomp
#
# Usage:
# include rabbitmq::stomp
#

# Ugly hack using static files ..
# There most probably is a better approach to this
class rabbitmq::stomp (
  $stomp_tcp_listener_host = '127.0.0.1',
  $stomp_tcp_listener_port = 6163)
{

  file { '/etc/rabbitmq/enabled_plugins':
    group   => '0',
    mode    => '0644',
    owner   => '0',
    source  => 'puppet:///modules/rabbitmq/enabled_plugins',
    require => Package['rabbitmq-server'],
  }

  file { '/etc/rabbitmq/rabbitmq.config':
    group   => '0',
    mode    => '0644',
    owner   => '0',
    notify  => Service['rabbitmq-server'],
    content => template('rabbitmq/rabbitmq.config-stomp.erb'),
    require => Package['rabbitmq-server'],
  }

}

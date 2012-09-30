# Class: rabbitmq::ssl
#
#Enables Stomp
#
# Usage:
# include rabbitmq::ssl
#

# Ugly hack using static files ..
# There most probably is a better approach to this
class rabbitmq::ssl{

  file { '/etc/rabbitmq/rabbitmq.config':
    group   => '0',
    mode    => '0644',
    owner   => '0',
    notify  => Service['rabbitmq-server'],
    content => template('rabbitmq/rabbitmq.config-ssl.erb'),
    require => Package['rabbitmq-server'],
  }

  file { '/etc/rabbitmq/ssl/':
    ensure => 'directory',
    group  => '0',
    mode   => '0755',
    owner  => '0',
  }
}

# = Class: rabbitmq::config
#
#
# == Usage:
#
#   include rabbitmq::config
#
class rabbitmq::config($plugins=$rabbitmq::params::plugins)
{

  if $plugins != 'no'
  {
    include concat::setup
    concat {'/etc/rabbitmq/enabled_plugins':
      group   => '0',
      mode    => '0644',
      owner   => '0',
      require => Package['rabbitmq-server'],
      notify  => Service['rabbitmq-server'],
    }
    concat::fragment {'empty':
      target  => '/etc/rabbitmq/enabled_plugins',
      source  => 'puppet:///modules/rabbitmq/enabled_plugins',
      order   => 0,
    }
  }

}

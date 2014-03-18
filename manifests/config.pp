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
    file {'/etc/rabbitmq/enabled_plugins':
      group   => '0',
      mode    => '0644',
      owner   => '0',
      content => '[].',
      require => Package['rabbitmq-server'],
      notify  => Service['rabbitmq-server'],
    }
  }

}

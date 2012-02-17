# Class: rabbitmq::stomp
#
#Enables Stomp
#
# Usage:
# include rabbitmq::stomp
#

# Ugly hack using static files ..
# There most probably is a better approach to this
class rabbitmq::stomp {


  file { '/etc/rabbitmq/enabled_plugins':
    group  => '0',
    mode   => '0644',
    owner  => '0',
    source => 'puppet:///modules/rabbitmq/enabled_plugins';
  }

  file { '/etc/rabbitmq/rabbitmq.config':
    group  => '0',
    mode   => '0644',
    owner  => '0',
    source => 'puppet:///modules/rabbitmq/rabbitmq.config';
  }


}

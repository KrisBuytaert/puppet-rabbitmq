# Define: rabbitmq::vhost
#
# Execute a rabbitmqctl command to create a vhost.
# It has been tested with version 2.7.
#
# Usage:
#
# rabbitmq::vhost { "myuser":
# }
#
#
define rabbitmq::vhost($ensure='present') {

  Exec {
    path => '/usr/bin:/bin:/usr/sbin:/bin'
  }

  case $ensure {
    'present':  {
      exec { "rabbitmq_vhost_${$name}":
        command => "rabbitmqctl add_vhost ${name} ",
        # remark: below we have multiple tabs in the argument of grep
        unless  =>  "rabbitmqctl list_vhosts | grep \"^${name}\"",
        require => Class['rabbitmq'],
      }
    }
    'absent' : {
      exec { "rabbitmq_vhost_${$name}":
        command => "rabbitmqctl delete_vhost ${name} ",
        onlyif  => "rabbitmqctl list_vhosts | grep \"^${name}\"",
        require => Class['rabbitmq'],
      }
    }
    default: {
      fail('use present or absent in rabbitmq::vhost')
    }
  }

}

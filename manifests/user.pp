# Define: rabbitmq::user
#
# Execute a rabbitmqctl command to create a user.
# It has been tested with version 2.7.
#
# Usage:
#
# rabbitmq::user { "myuser":
#   password => 'mypass';
# }
# rabbitmq::user { "myuser2":
#   ensure => "absent";
# }
#
#
define rabbitmq::user($password='', $ensure='present') {

  Exec {
    path => '/usr/bin:/bin:/usr/sbin:/bin'
  }

  case $ensure {
    'present':  {
      exec { "rabbitmq_user_${$name}":
        command => "rabbitmqctl add_user ${name} ${password}",
        # remark: below we have multiple tabs in the argument of grep
        unless  =>  "rabbitmqctl list_users | grep \"^${name}	\"",
        require => Class['rabbitmq'],
      }
    }
    'absent' : {
      exec { "rabbitmq_user_${$name}":
        command => "rabbitmqctl delete_user ${name} ${password}",
        # remark: below we have a tab in the argument of grep
        onlyif  => "rabbitmqctl list_users | grep \"^${name}	\"",
        require => Class['rabbitmq'],
      }
    }
    default: {
      fail('use present or absent in rabbitmq::user')
    }
  }

}

# Define: rabbitmq::permission
#
# Execute a rabbitmqctl command to create a permission.
#
# Usage:
#
# rabbitmq::permission { "myuser":
#   vhostpath => '/', #default
#   $conf     => "^amq.gen-.*",
#   $write    => ".*",
#   $read     => ".*";
# }
# rabbitmq::permission { "myuser":
#   ensure => "absent",
#   vhostpath => '/', #default
#   $conf     => "^amq.gen-.*",
#   $write    => ".*",
#   $read     => ".*";
# }
#
#
define rabbitmq::permission(
  $conf, $write, $read,
  $vhostpath = '/',
  $user=$name,
  $ensure='present')
{

  Exec {
    path => '/usr/bin:/bin:/usr/sbin:/bin'
  }

  case $ensure {
    'present':  {
      exec { "rabbitmq_permission_${$user}":
        command => "rabbitmqctl set_permissions -p ${vhostpath} ${user} \"${conf}\" \"${write}\" \"${read}\"",
        # remark: below we have multiple tabs in the argument of grep
        unless  => "rabbitmqctl list_permissions -p ${vhostpath} | grep '^${user}	${conf}	${write}	${read}\$'",
        require => Class['rabbitmq'],
      }
    }
    'absent' : {
      exec { "rabbitmq_permission_${$user}":
        command => "rabbitmqctl clear_permissions -p ${vhostpath} ${user}",
        # remark: below we have a tab in the argument of grep
        onlyif  => "rabbitmqctl list_permissions -p ${vhostpath} | grep '^${user}	'",
        require => Class['rabbitmq'],
      }
    }
    default: {
      fail('use present or absent in rabbitmq::permission')
    }
  }
}
